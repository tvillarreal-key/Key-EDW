CREATE   PROCEDURE [rubrik].[update_backup_checkpoint_and_get_lsn]
    @operation int,
    @transactionTime datetime,
    @startLsn binary(10) output,
    @tranEndTime datetime output
    as
    begin
    /* DOCUMENTATION:
    This stored procedure is used as part of Rubrik's proprietary algorithm for taking
    transactionally consistent backups.
    Parameters:
    @operation: Operation to be performed. Can be either 1 (delete) or 2 (insert).
    @transactionTime: Time to be inserted in the rubrik.backup_checkpoints table.
    @startLsn: OUT parameter to return the LSN value of the inserted record.
    @tranEndTime: OUT parameter to return the transaction end time of the inserted record.
    Usage:
    declare @startLsn binary(10)
    declare @tranEndTime datetime
    -- for insert
    exec [rubrik].[update_backup_checkpoint_and_get_lsn] 2, '2022-09-29', @startLsn out, @tranEndTime out
    select @startLsn, @tranEndTime
    -- for delete
    exec [rubrik].[update_backup_checkpoint_and_get_lsn] 1, '2022-09-29', @startLsn out, @tranEndTime out
    select @startLsn, @tranEndTime
    */
        -- A. insert/delete checkpoint based on the operation to be performed
        -- Note that if the record is already inserted/deleted, we do not fail
        -- so as to be able to poll idempotently in case of retries.
        if @operation = 2 -- insert
        begin
            insert into rubrik.backup_checkpoints select (@transactionTime)
            WHERE NOT EXISTS (select * from rubrik.backup_checkpoints where time_stamp=@transactionTime)
        end
        else if @operation = 1 -- delete
        begin
            DELETE FROM rubrik.backup_checkpoints WHERE time_stamp=@transactionTime
        end
        else
        begin
            RAISERROR ('Fatal error: invalid operation', 16, 1);
            return
        end


        -- B. poll for startLSN in CT table
        DECLARE @Counter INT = 1
        DECLARE @MaxRetries INT = 10
        DECLARE @TimeInSeconds VARCHAR(10) = '00:00:30' -- 30 seconds
        WHILE (@StartLsn is NULL and @Counter <= @MaxRetries) -- while loop for 5 mins (polling at 30s interval 10 times)
        BEGIN
            select @startLsn = __$start_lsn from cdc.rubrik_rubrik_backup_checkpoints_ct where time_stamp=@transactionTime and __$operation=@operation
            if @StartLsn is NOT NULL
            BEGIN
                select @TranEndTime = tran_end_time from [cdc].[lsn_time_mapping] where start_lsn = @StartLsn
                BREAK;
            END
            WAITFOR DELAY @TimeInSeconds -- wait for 30 second
            SET @Counter  = @Counter  + 1
        END
    end
GO

GRANT EXECUTE
    ON OBJECT::[rubrik].[update_backup_checkpoint_and_get_lsn] TO [rubrik_backup_reader_DO_NOT_DELETE]
    AS [rubrik_login_p3slt6CIhmEdHtqtwsBj];
GO


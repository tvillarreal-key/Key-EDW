CREATE   PROCEDURE [rubrik].[truncate_table]
    @schema_name sysname,
    @table_name sysname,
    @partitions_to_truncate varchar(max) = NULL as
    begin
    /* DOCUMENTATION:
    This stored procedure allows users to TRUNCATE the given @table_name of the
    given @schema_name, with or without partitions. If specific partitions need
    to be truncated, they can be provided as part of @partitions_to_truncate
    argument in the form accepted by the TRUNCATE command. In case the @schema_name
    is omitted (NULL), we assume current user's default schema. In case the given table
    has CDC enabled, this procedure disables the relevant capture instance, executes
    the TRUNCATE command and enables back this capture instance, regardless of the
    outcome of the TRUNCATE operation.
    Usage:
    execute rubrik.truncate_table 'mySchema', 'myTable';  -- non-partitioned table
    execute rubrik.truncate_table 'mySchema', 'myTable', '1, 2, 4 TO 6';  -- partitioned table
    execute rubrik.truncate_table '', 'myTable';  -- assume user's default schema
    */
        set @schema_name = TRIM(@schema_name);
        -- check for valid schema name or use the default name
        if (@schema_name IS null or @schema_name = '')
            set @schema_name = SCHEMA_NAME();

        set @table_name = TRIM(@table_name);
        -- check for valid table name
        if (@table_name IS null or @table_name = '')
        begin
            raiserror(15223, -1, 11, 'table_name')
            return 1
        end

        declare @ci_name sysname = 'rubrik_' + @schema_name + '_' + @table_name;
        declare @cdc_disabled bit = 0;

        -- check if CDC is enabled on current database
        if (select is_cdc_enabled from sys.databases where name = DB_NAME()) = 1
        begin
            -- check if expected capture instance exists for this table
            if exists (select capture_instance from cdc.change_tables where capture_instance = @ci_name)
            begin
                -- disable this capture instance and record the fact
                exec sys.sp_cdc_disable_table @schema_name, @table_name, @ci_name;
                set @cdc_disabled = 1;
            end
        end

        -- check if specific partitions need to be truncated
        set @partitions_to_truncate = TRIM(COALESCE(@partitions_to_truncate, ''))
        if (@partitions_to_truncate <> '')
        begin
            select @partitions_to_truncate = STRING_AGG(trim(value), ', ') from STRING_SPLIT(@partitions_to_truncate, ',');
            set @partitions_to_truncate = ' WITH (PARTITIONS (' + @partitions_to_truncate + '))';
        end

        begin try
            -- execute TRUNCATE command with relevant arguments
            exec ('TRUNCATE TABLE ' + @schema_name + '.' + @table_name + @partitions_to_truncate + ';');
            if (@cdc_disabled = 1)
            begin
                -- update flag before enabling capture instance so that
                -- catch block would not re-attempt it, in case of errors
                set @cdc_disabled = 0;
                -- enable the capture instance that was disabled previously
                exec sys.sp_cdc_enable_table @schema_name, @table_name, @ci_name, 0, rubrik_backup_reader_DO_NOT_DELETE;
            end
        end try
        begin catch
            if (@cdc_disabled = 1)
                -- in case of any error, re-enable the capture instance for this table if disabled previously
                exec sys.sp_cdc_enable_table @schema_name, @table_name, @ci_name, 0, rubrik_backup_reader_DO_NOT_DELETE;
            -- rethrow the underlying error
            throw;
        end catch;
    end
GO


CREATE   TRIGGER rubrik_forbid_drop_checkpoints_table_DO_NOT_DELETE ON DATABASE
    FOR DROP_TABLE
    AS
    DECLARE @data XML = EVENTDATA()
    DECLARE @Schema SYSNAME = @data.value('(/EVENT_INSTANCE/SchemaName)[1]','SYSNAME');
    DECLARE @Table SYSNAME = @data.value('(/EVENT_INSTANCE/ObjectName)[1]','SYSNAME');
    BEGIN
        SET NOCOUNT ON;
        IF @Schema = 'rubrik'
        BEGIN
            DECLARE @error_msg varchar(200) = 'Tables in [rubrik] schema cannot be dropped since it is used by Rubrik'+CHAR(39)+'s database backup algorithm.'
            RAISERROR (@error_msg, 16, 1);
            ROLLBACK;
        END
    END
GO


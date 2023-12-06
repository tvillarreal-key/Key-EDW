CREATE TRIGGER rubrik_auto_configure_cdc_DO_NOT_DELETE ON DATABASE
    AFTER CREATE_TABLE, RENAME, ALTER_TABLE
    AS
    DECLARE @data XML = EVENTDATA()
    DECLARE @event_type SYSNAME = @data.value('(/EVENT_INSTANCE/EventType)[1]','SYSNAME');
    DECLARE @schema_name SYSNAME = @data.value('(/EVENT_INSTANCE/SchemaName)[1]','SYSNAME');
    DECLARE @table_name SYSNAME = @data.value('(/EVENT_INSTANCE/ObjectName)[1]','SYSNAME');
    DECLARE @obj_type SYSNAME = @data.value('(/EVENT_INSTANCE/ObjectType)[1]','SYSNAME');
    DECLARE @old_capture_instance_name sysname = 'rubrik_' + @schema_name + '_' + @table_name;
    DECLARE @new_capture_instance_name sysname = @old_capture_instance_name;

    IF (@obj_type <> 'TABLE' OR @table_name = 'systranschemas')
        RETURN

    IF (@schema_name = 'rubrik')
    BEGIN
        DECLARE @error_msg varchar(200) = 'Tables in [rubrik] schema cannot be created/renamed/altered since it is used by Rubrik'+CHAR(39)+'s database backup algorithm.'
        RAISERROR (@error_msg, 16, 1);
        ROLLBACK;
        RETURN;
    END

    IF (select is_cdc_enabled from sys.databases where name = DB_NAME()) = 0
        RETURN

    exec('GRANT SELECT ON SCHEMA :: ' + @schema_name + ' TO rubrik_backup_reader_DO_NOT_DELETE;');

    IF @event_type = 'RENAME'
    BEGIN
        DECLARE @old_table_name SYSNAME = @table_name;
        SET @table_name = @data.value('(/EVENT_INSTANCE/NewObjectName)[1]','SYSNAME');
        SET @old_capture_instance_name = 'rubrik_' + @schema_name + '_' + @old_table_name;
        SET @new_capture_instance_name = 'rubrik_' + @schema_name + '_' + @table_name;
    END

    IF @schema_name IN (SELECT ss.name FROM sys.schemas ss
    INNER JOIN sys.sysusers su ON ss.principal_id = su.uid
    WHERE su.islogin = 1 AND ss.name NOT IN ('sys', 'cdc', 'guest', 'INFORMATION_SCHEMA'))
    BEGIN
        IF EXISTS (SELECT capture_instance FROM cdc.change_tables WHERE capture_instance = @old_capture_instance_name)
        BEGIN
            EXEC sys.sp_cdc_disable_table @schema_name, @table_name, @old_capture_instance_name;
        END
        EXEC sys.sp_cdc_enable_table
            @source_schema = @schema_name,
            @source_name = @table_name,
            @capture_instance = @new_capture_instance_name,
            @supports_net_changes = 0,
            @role_name = rubrik_backup_reader_DO_NOT_DELETE;
    END
GO


CREATE   PROCEDURE [rubrik].[resume_cdc]
    @schema_name sysname,
    @table_name sysname as
    begin
    /* DOCUMENTATION:
    This stored procedure allows users to resume/enable change data capture on
    the given @table_name of the given @schema_name. It is usually run after
    executing an operation that is normally blocked by CDC. In case the
    @schema_name is omitted (NULL), we assume current user's default schema. In
    case if the given table already has CDC enabled, the procedure just returns.
    Usage:
    execute rubrik.resume_cdc 'mySchema', 'myTable';
    execute rubrik.resume_cdc '', 'myTable';  -- assume user's default schema
    */
        -- Return if CDC is NOT enabled on current database
        if (select is_cdc_enabled from sys.databases where name = DB_NAME()) = 0
        return

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
        -- check if expected capture instance does not exist for this table
        if not exists (select capture_instance from cdc.change_tables where capture_instance = @ci_name)
            -- enable this capture instance
            exec sys.sp_cdc_enable_table @schema_name, @table_name, @ci_name, 0, rubrik_backup_reader_DO_NOT_DELETE;
    end
GO


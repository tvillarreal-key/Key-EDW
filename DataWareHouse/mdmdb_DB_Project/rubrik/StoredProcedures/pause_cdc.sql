CREATE   PROCEDURE [rubrik].[pause_cdc]
    @schema_name sysname,
    @table_name sysname as
    begin
    /* DOCUMENTATION:
    This stored procedure allows users to pause/disable change data capture on
    the given @table_name of the given @schema_name. It is useful to perform
    certain operations which are normally blocked by CDC. In case the @schema_name
    is omitted (NULL), we assume current user's default schema. In case if the
    given table does not have CDC enabled, the procedure just returns.
    Usage:
    execute rubrik.pause_cdc 'mySchema', 'myTable';
    execute rubrik.pause_cdc '', 'myTable';  -- assume user's default schema
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
        -- check if expected capture instance exists for this table
        if exists (select capture_instance from cdc.change_tables where capture_instance = @ci_name)
            -- disable this capture instance
            exec sys.sp_cdc_disable_table @schema_name, @table_name, @ci_name;
    end
GO


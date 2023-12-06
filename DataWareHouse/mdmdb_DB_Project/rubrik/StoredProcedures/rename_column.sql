CREATE   PROCEDURE [rubrik].[rename_column]
        @schema_name sysname,
        @table_name sysname,
        @old_column_name sysname,
        @new_column_name sysname as
    begin
    /* DOCUMENTATION:
    This stored procedure allows users to rename a column from the
    given @old_column_name to @new_column_name of the given @table_name
    and @schema_name. If @schema_name is omitted, then SCHEMA_NAME() is used.
    It uses the internal stored procedure sys.sp_rename for performing the
    actual column rename. In case the given table has CDC enabled, it
    temporarily disables CDC on this table and enables it back again
    once sys.sp_rename completes.
    Usage:
    execute rubrik.rename_column 'mySchema', 'myTable', 'old_column', 'new_column'
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

        -- check for valid old column name
        if (@old_column_name IS null or @old_column_name = '')
        begin
            raiserror(15223, -1, 11, 'old_column_name')
            return 1
        end

        -- check for valid new column name
        if (@new_column_name IS null or @new_column_name = '')
        begin
            raiserror(15223, -1, 11, 'new_column_name')
            return 1
        end

        -- return if both the old and new columns have identical names
        if (@old_column_name = @new_column_name)
            return 0

        declare @ci_name sysname = 'rubrik_' + @schema_name + '_' + @table_name;
        declare @obj_name sysname = @schema_name + '.' + @table_name + '.' + @old_column_name;
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

        begin try
            -- invoke underlying procedure for renaming the column
            exec sys.sp_rename @obj_name, @new_column_name, 'COLUMN';
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


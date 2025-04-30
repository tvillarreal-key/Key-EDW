CREATE PROCEDURE EvaluateAllColumns
    @DatabaseName NVARCHAR(128),
    @SchemaName NVARCHAR(128)
AS
BEGIN
    DECLARE @TableName NVARCHAR(128), @ColumnName NVARCHAR(128), @DataType NVARCHAR(128), @Sql NVARCHAR(MAX)

    DECLARE TableCursor CURSOR FOR
        SELECT TABLE_NAME, COLUMN_NAME, DATA_TYPE
        FROM INFORMATION_SCHEMA.COLUMNS
        WHERE TABLE_SCHEMA = @SchemaName

    OPEN TableCursor
    FETCH NEXT FROM TableCursor INTO @TableName, @ColumnName, @DataType

    WHILE @@FETCH_STATUS = 0
    BEGIN
        -- Data Type Check
        SET @Sql = 'USE ' + QUOTENAME(@DatabaseName) + '; IF EXISTS (SELECT 1 FROM ' + QUOTENAME(@SchemaName) + '.' + QUOTENAME(@TableName) + ' WHERE ISNUMERIC(' + QUOTENAME(@ColumnName) + ') = 0) PRINT ''' + QUOTENAME(@SchemaName) + '.' + QUOTENAME(@TableName) + '.' + QUOTENAME(@ColumnName) + ' contains non-numeric data'''
        EXEC sp_executesql @Sql

        -- Range Check
        SET @Sql = 'USE ' + QUOTENAME(@DatabaseName) + '; IF EXISTS (SELECT 1 FROM ' + QUOTENAME(@SchemaName) + '.' + QUOTENAME(@TableName) + ' WHERE ' + QUOTENAME(@ColumnName) + ' NOT BETWEEN 0 AND 100) PRINT ''' + QUOTENAME(@SchemaName) + '.' + QUOTENAME(@TableName) + '.' + QUOTENAME(@ColumnName) + ' contains data outside the expected range'''
        EXEC sp_executesql @Sql

        -- Pattern Check
        -- Add your pattern checks here based on your requirements

        -- Consistency Check
        -- Add your consistency checks here based on your requirements

        -- Existence Check
        SET @Sql = 'USE ' + QUOTENAME(@DatabaseName) + '; IF NOT EXISTS (SELECT 1 FROM ' + QUOTENAME(@SchemaName) + '.' + QUOTENAME(@TableName) + ') PRINT ''' + QUOTENAME(@SchemaName) + '.' + QUOTENAME(@TableName) + ' does not exist'''
        EXEC sp_executesql @Sql

        FETCH NEXT FROM TableCursor INTO @TableName, @ColumnName, @DataType
    END

    CLOSE TableCursor
    DEALLOCATE TableCursor
END

GO


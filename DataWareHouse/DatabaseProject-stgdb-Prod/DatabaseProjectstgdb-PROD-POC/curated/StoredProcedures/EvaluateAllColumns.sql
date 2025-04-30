CREATE PROCEDURE [curated].[EvaluateAllColumns]
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
        IF @DataType NOT IN ('datetime2', 'datetime', 'date', 'time', 'text', 'ntext')
        BEGIN
            SET @Sql = 'USE ' + QUOTENAME(@DatabaseName) + '; IF EXISTS (SELECT 1 FROM ' + QUOTENAME(@SchemaName) + '.' + QUOTENAME(@TableName) + ' WHERE ISNUMERIC(' + QUOTENAME(@ColumnName) + ') = 0) PRINT ''' + QUOTENAME(@SchemaName) + '.' + QUOTENAME(@TableName) + '.' + QUOTENAME(@ColumnName) + ' contains non-numeric data'''
            EXEC sp_executesql @Sql
        END

        -- Range Check
        -- Add your range checks here based on your requirements

        -- Pattern Check
        -- Add your pattern checks here based on your requirements

        -- Consistency Check: Check for null values
        SET @Sql = 'IF EXISTS (SELECT 1 FROM ' + QUOTENAME(@DatabaseName) + '.' + QUOTENAME(@SchemaName) + '.' + QUOTENAME(@TableName) + ' WHERE ' + QUOTENAME(@ColumnName) + ' IS NULL) PRINT ''' + @TableName + '.' + @ColumnName + ' contains null values''';
        EXEC sp_executesql @Sql;

        -- Existence Check: Check for column existence
        SET @Sql = 'IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = ' + QUOTENAME(@SchemaName) + ' AND TABLE_NAME = ' + QUOTENAME(@TableName) + ' AND COLUMN_NAME = ' + QUOTENAME(@ColumnName) + ') PRINT ''' + @TableName + '.' + @ColumnName + ' does not exist''';
        EXEC sp_executesql @Sql;

        FETCH NEXT FROM TableCursor INTO @TableName, @ColumnName, @DataType
    END

    CLOSE TableCursor
    DEALLOCATE TableCursor
END

GO


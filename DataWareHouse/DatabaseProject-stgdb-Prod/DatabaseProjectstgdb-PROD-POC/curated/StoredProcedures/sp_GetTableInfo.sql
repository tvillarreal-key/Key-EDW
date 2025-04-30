CREATE PROCEDURE [curated].[sp_GetTableInfo]
AS
BEGIN
    DECLARE @TotalRowCount INT;
    DECLARE @ColumnName NVARCHAR(128);
    DECLARE @NullCount INT;
    DECLARE @ValueLength INT;
    DECLARE @DistinctCount INT;
    DECLARE @SQL NVARCHAR(MAX);

    -- Get total row count
    SELECT @TotalRowCount = COUNT(*) FROM staging.MDM_Assets;

    -- Print total row count
    PRINT 'Total Row Count: ' + CAST(@TotalRowCount AS NVARCHAR);

    -- Get column names
    DECLARE column_cursor CURSOR FOR 
    SELECT COLUMN_NAME 
    FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_NAME = 'MDM_Assets' AND TABLE_SCHEMA = 'staging';

    OPEN column_cursor;

    FETCH NEXT FROM column_cursor INTO @ColumnName;

    WHILE @@FETCH_STATUS = 0
    BEGIN
        -- Dynamic SQL to get column info
        SET @SQL = 'SELECT @NullCount_OUT = COUNT(*) FROM staging.MDM_Assets WHERE ISNULL(' + QUOTENAME(@ColumnName) + ', '' '') = '' ''; 
                    SELECT @ValueLength_OUT = MAX(LEN(ISNULL(' + QUOTENAME(@ColumnName) + ', '' ''))) FROM staging.MDM_Assets ; 
                    SELECT @DistinctCount_OUT = COUNT(DISTINCT ISNULL(' + QUOTENAME(@ColumnName) + ', '' '')) FROM staging.MDM_Assets;';
        -- Print column info
     --   PRINT 'Column Query: ' + @SQL ;
     --   PRINT '------------------------';

        EXEC sp_executesql @SQL, 
                           N'@NullCount_OUT INT OUTPUT, @ValueLength_OUT INT OUTPUT, @DistinctCount_OUT INT OUTPUT', 
                           @NullCount_OUT=@NullCount OUTPUT, @ValueLength_OUT=@ValueLength OUTPUT, @DistinctCount_OUT=@DistinctCount OUTPUT;

        -- Print column info
        PRINT 'Column Name: ' + @ColumnName + ', Null Count: ' + CAST(@NullCount AS NVARCHAR) + ', Max Value Length: ' + CAST(@ValueLength AS NVARCHAR) + ', Distinct Value Count: ' + CAST(@DistinctCount AS NVARCHAR);
        PRINT '------------------------';

        FETCH NEXT FROM column_cursor INTO @ColumnName;
    END;

    CLOSE column_cursor;
    DEALLOCATE column_cursor;
END;

GO


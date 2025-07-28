CREATE TABLE #Results (
    TableName NVARCHAR(128),
    ColumnName NVARCHAR(128),
    ColumnValue NVARCHAR(MAX),
    ValueCount INT
);

DECLARE @schemaName NVARCHAR(128) = 'staging'; -- replace with your schema name
DECLARE @tableName NVARCHAR(128);
DECLARE @columnName NVARCHAR(128);
DECLARE @sqlCommand NVARCHAR(MAX);

-- List of column names to skip
DECLARE @skipColumns TABLE (ColumnName NVARCHAR(128));
INSERT INTO @skipColumns VALUES ('AssetsHashKey'), ('AssetAttrHashKey'), ('AssetsChkSum')
, ('AssetAttrChkSum'), ('Asset_Num'), ('Source_LastUpdateDate'), ('Source_LastUpdateBy'), ('LoadDate'), ('SourceSystem'), ('LastSeenDate'), ('ID'), ('Asset_ID');

DECLARE tableCursor CURSOR FOR
SELECT TABLE_NAME
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_SCHEMA = @schemaName AND TABLE_TYPE IN ('BASE TABLE', 'VIEW');

OPEN tableCursor;
FETCH NEXT FROM tableCursor INTO @tableName;

WHILE @@FETCH_STATUS = 0
BEGIN
    DECLARE columnCursor CURSOR FOR
    SELECT COLUMN_NAME
    FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = @schemaName AND TABLE_NAME = @tableName
    AND COLUMN_NAME NOT IN (SELECT ColumnName FROM @skipColumns);

    OPEN columnCursor;
    FETCH NEXT FROM columnCursor INTO @columnName;

    WHILE @@FETCH_STATUS = 0
    BEGIN
        SET @sqlCommand = 'INSERT INTO #Results ' +
            'SELECT ''' + @tableName + ''', ''' + @columnName + ''', CAST(' + @columnName + ' AS NVARCHAR(MAX)), COUNT(*) ' +
            'FROM ' + QUOTENAME(@schemaName) + '.' + QUOTENAME(@tableName) + ' ' +
            'WHERE CAST(' + @columnName + ' AS NVARCHAR(MAX)) != ''asset_id'' ' +
            'GROUP BY ' + @columnName + ';';
        EXEC sp_executesql @sqlCommand;

        FETCH NEXT FROM columnCursor INTO @columnName;
    END;

    CLOSE columnCursor;
    DEALLOCATE columnCursor;

    FETCH NEXT FROM tableCursor INTO @tableName;
END;

CLOSE tableCursor;
DEALLOCATE tableCursor;

SELECT * FROM #Results;
DROP TABLE #Results;

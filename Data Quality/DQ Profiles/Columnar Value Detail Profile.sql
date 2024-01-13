DECLARE @table_catalog NVARCHAR(128) = 'mdmdb';
DECLARE @table_schema NVARCHAR(128) = 'reporting';
DECLARE @table_name NVARCHAR(128) = 'MDM_Assets';

DECLARE @query NVARCHAR(MAX) = '';
DECLARE @column_name NVARCHAR(128);
DECLARE @temp_query NVARCHAR(MAX);
DECLARE @data_type NVARCHAR(128);

DECLARE column_cursor CURSOR FOR 
SELECT COLUMN_NAME, DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_CATALOG = @table_catalog AND TABLE_SCHEMA = @table_schema AND TABLE_NAME = @table_name;

OPEN column_cursor;

FETCH NEXT FROM column_cursor INTO @column_name, @data_type;

WHILE @@FETCH_STATUS = 0
BEGIN
    IF @data_type <> 'datetime'
    BEGIN
        SET @temp_query = 'SELECT 
            ''' + @table_catalog + ''' AS catalog_name, 
            ''' + @table_schema + ''' AS schema_name, 
            ''' + @table_name + ''' AS table_name, 
            ''' + @column_name + ''' AS column_name,
            CAST([' + @column_name + '] AS NVARCHAR(MAX)) AS column_value,
            COUNT(*) AS frequency_of_values,
            CAST(COUNT(*) * 1.0 / (SELECT COUNT(*) FROM [' + @table_catalog + '].[' + @table_schema + '].[' + @table_name + ']) * 100 AS DECIMAL(5,2)) AS percent_of_total_values,
            GETDATE() AS profile_datetime
        FROM [' + @table_catalog + '].[' + @table_schema + '].[' + @table_name + ']
        GROUP BY CAST([' + @column_name + '] AS NVARCHAR(MAX))';

        SET @query = @query + @temp_query + ' UNION ALL ';
    END

    FETCH NEXT FROM column_cursor INTO @column_name, @data_type;
END;

CLOSE column_cursor;
DEALLOCATE column_cursor;

-- Remove the last ' UNION ALL '
SET @query = LEFT(@query, LEN(@query) - 10);

-- Display the query
PRINT @query;

-- Execute the query
EXEC sp_executesql @query;

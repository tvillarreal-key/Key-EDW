DECLARE @table_catalog NVARCHAR(128) = 'mdmdb';
DECLARE @table_schema NVARCHAR(128) = 'reporting';
DECLARE @table_name NVARCHAR(128) = 'MDM_Assets';
DECLARE @column_name NVARCHAR(128) = 'column_name'; -- Add your column name here

DECLARE @query NVARCHAR(MAX) = '';

SELECT @query = @query + 'SELECT 
    ''' + TABLE_CATALOG + ''' AS catalog_name, 
    ''' + TABLE_SCHEMA + ''' AS schema_name, 
    ''' + TABLE_NAME + ''' AS table_name, 
    ''' + @column_name + ''' AS column_name,
    ([' + @column_name + ']) AS column_value,
    COUNT([' + @column_name + ']) AS frequency_of_values,
    CAST(COUNT([' + @column_name + ']) * 1.0 / (SELECT COUNT(*) FROM [' + @table_catalog + '].[' + @table_schema + '].[' + @table_name + ']) * 100 AS DECIMAL(5,2)) AS percent_of_total_values,
    GETDATE() AS profile_datetime
FROM [' + @table_catalog + '].[' + @table_schema + '].[' + @table_name + ']
GROUP BY ' + @column_name
+ ' ORDER BY ([' + @column_name + '])'
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_CATALOG = @table_catalog AND TABLE_SCHEMA = @table_schema AND TABLE_NAME = @table_name AND COLUMN_NAME = @column_name;

-- Display the query
PRINT @query;

-- Execute the query
EXEC sp_executesql @query;
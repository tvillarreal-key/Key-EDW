-- Columnar Discovery Profile for a SQL Server table
DECLARE @table_catalog NVARCHAR(128) = 'mdmdb';
DECLARE @table_schema NVARCHAR(128) = 'Reporting';
DECLARE @table_name NVARCHAR(128) = 'MDM_Assets';

DECLARE @query NVARCHAR(MAX) = '';

SELECT @query = @query + 'SELECT 
    ''' + TABLE_CATALOG + ''' AS catalog_name, 
    ''' + TABLE_SCHEMA + ''' AS schema_name, 
    ''' + TABLE_NAME + ''' AS table_name, 
    ''' + COLUMN_NAME + ''' AS column_name,
    ''' + CAST(ORDINAL_POSITION AS VARCHAR(100)) + ''' AS ordinal_position, 
    ''' + IS_NULLABLE + ''' AS is_nullable, 
    ''' + DATA_TYPE + ''' AS data_type,  
    (CASE WHEN ''' + DATA_TYPE + ''' = ''nvarchar'' THEN MAX (CAST(LEN([' + COLUMN_NAME + ']) AS VARCHAR(200))) ELSE ''0'' END) AS max_len,   
    COUNT(CASE WHEN [' + COLUMN_NAME + '] IS NULL THEN 1 ELSE 0 END) AS num_values,        
    COUNT(DISTINCT [' + COLUMN_NAME + ']) AS num_unique_values, 
    CAST(COUNT(DISTINCT [' + COLUMN_NAME + ']) * 1.0 / COUNT(CASE WHEN [' + COLUMN_NAME + '] IS NULL THEN 1 ELSE 0 END)*100 AS DECIMAL(5,2)) AS pct_unique_values,  
    SUM(CASE WHEN [' + COLUMN_NAME + '] IS NULL THEN 1 ELSE 0 END) AS num_null_values, 
    CAST(SUM(CASE WHEN [' + COLUMN_NAME + '] IS NULL THEN 1 ELSE 0 END) * 1.0 / COUNT(CASE WHEN [' + COLUMN_NAME + '] IS NULL THEN 1 ELSE 0 END)*100 AS DECIMAL(10,2)) AS pct_null_values,        
    MIN (CAST([' + COLUMN_NAME + '] AS VARCHAR(200))) AS min_value, 
    MAX (CAST([' + COLUMN_NAME + '] AS VARCHAR(200))) AS max_value
FROM [' + @table_catalog + '].[' + @table_schema + '].[' + @table_name + ']
UNION ALL
'
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_CATALOG = @table_catalog AND TABLE_SCHEMA = @table_schema AND TABLE_NAME = @table_name
;

SET @query = LEFT(@query, LEN(@query)-10); -- Remove the last 'UNION ALL'

-- Display the query
PRINT @query;

-- Execute the query
EXEC sp_executesql @query;

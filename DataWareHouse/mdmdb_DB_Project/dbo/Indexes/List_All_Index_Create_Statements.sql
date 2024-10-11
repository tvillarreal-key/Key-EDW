CREATE TABLE reporting.index_list (
    DatabaseName NVARCHAR(128),
    SchemaName NVARCHAR(128),
    TableName NVARCHAR(128),
    IndexName NVARCHAR(128),
    IndexColumns NVARCHAR(MAX),
    IncludedColumns NVARCHAR(MAX)
);

 CREATE TABLE reporting.index_list ;

delete
from reporting.index_list
; 

DECLARE @sql NVARCHAR(MAX) = '';

WITH IndexColumns AS (
    SELECT 
        i.object_id,
        i.index_id,
        STRING_AGG(QUOTENAME(c.name), ', ') WITHIN GROUP (ORDER BY ic.index_column_id) AS IndexColumns
    FROM 
        sys.indexes i
        INNER JOIN sys.index_columns ic ON i.object_id = ic.object_id AND i.index_id = ic.index_id AND ic.is_included_column = 0
        INNER JOIN sys.columns c ON ic.object_id = c.object_id AND ic.column_id = c.column_id
    GROUP BY 
        i.object_id, i.index_id
),
IncludedColumns AS (
    SELECT 
        i.object_id,
        i.index_id,
        STRING_AGG(QUOTENAME(c.name), ', ') WITHIN GROUP (ORDER BY ic.index_column_id) AS IncludedColumns
    FROM 
        sys.indexes i
        INNER JOIN sys.index_columns ic ON i.object_id = ic.object_id AND i.index_id = ic.index_id AND ic.is_included_column = 1
        INNER JOIN sys.columns c ON ic.object_id = c.object_id AND ic.column_id = c.column_id
    GROUP BY 
        i.object_id, i.index_id
)
SELECT @sql = @sql + 'INSERT INTO reporting.index_list (DatabaseName, SchemaName, TableName, IndexName, IndexColumns, IncludedColumns) VALUES (' +
    '''' + DB_NAME() + ''', ' +
    '''' + s.name + ''', ' +
    '''' + t.name + ''', ' +
    '''' + i.name + ''', ' +
    '''' + ISNULL(ic.IndexColumns, '') + ''', ' +
    '''' + ISNULL(incc.IncludedColumns, '') + '''' +
    ');' + CHAR(13) + CHAR(10)
FROM 
    sys.indexes i
    INNER JOIN sys.tables t ON i.object_id = t.object_id
    INNER JOIN sys.schemas s ON t.schema_id = s.schema_id
    LEFT JOIN IndexColumns ic ON i.object_id = ic.object_id AND i.index_id = ic.index_id
    LEFT JOIN IncludedColumns incc ON i.object_id = incc.object_id AND i.index_id = incc.index_id
WHERE 
    i.type IN (1, 2) -- clustered and non-clustered indexes
GROUP BY 
    s.name, t.name, i.name, ic.IndexColumns, incc.IncludedColumns;

EXEC sp_executesql @sql;

select *
from reporting.index_list
order by 1,2,3,4
;
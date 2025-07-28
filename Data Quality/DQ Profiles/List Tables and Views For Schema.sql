DECLARE @table_catalog NVARCHAR(128) = 'mdmdb';
DECLARE @table_schema NVARCHAR(128) = 'reporting';

SELECT 
    TABLE_CATALOG AS catalog_name, 
    TABLE_SCHEMA AS schema_name, 
    TABLE_NAME AS object_name, 
    CASE WHEN TABLE_TYPE = 'VIEW' THEN 'VIEW' ELSE 'TABLE' END AS object_type
FROM 
    INFORMATION_SCHEMA.TABLES
WHERE 
    TABLE_CATALOG = @table_catalog 
 --   AND TABLE_SCHEMA = @table_schema
ORDER BY 1,2,3,4

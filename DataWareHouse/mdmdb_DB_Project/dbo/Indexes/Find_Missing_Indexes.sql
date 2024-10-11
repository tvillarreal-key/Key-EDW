SELECT 
    v.name AS view_name,
--    sed.referenced_schema_name AS schema_nm,
--    t.name AS table_name,
    concat(sed.referenced_schema_name,'.', t.name) full_nm,
    mid.equality_columns,
    mid.inequality_columns,
    mid.included_columns
FROM 
    sys.views v
INNER JOIN 
    sys.sql_expression_dependencies sed ON v.object_id = sed.referencing_id
INNER JOIN 
    sys.tables t ON sed.referenced_id = t.object_id
INNER JOIN 
    sys.dm_db_missing_index_details mid ON t.object_id = mid.object_id
INNER JOIN 
    sys.dm_db_missing_index_groups mig ON mid.index_handle = mig.index_handle
INNER JOIN 
    sys.dm_db_missing_index_group_stats migs ON mig.index_group_handle = migs.group_handle
ORDER BY 
   2,3,4,5 



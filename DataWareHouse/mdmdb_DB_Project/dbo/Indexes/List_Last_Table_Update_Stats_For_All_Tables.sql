SELECT 
    DB_NAME() AS DatabaseName,
    s.name AS SchemaName,
    t.name AS TableName,
    MAX(sp.last_updated) AS LastStatsUpdate
FROM 
    sys.tables t
    INNER JOIN sys.schemas s ON t.schema_id = s.schema_id
    INNER JOIN sys.stats st ON t.object_id = st.object_id
    CROSS APPLY sys.dm_db_stats_properties(st.object_id, st.stats_id) sp
GROUP BY 
    s.name, t.name
ORDER BY 
    s.name, t.name;

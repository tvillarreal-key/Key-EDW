CREATE VIEW [reporting].[vw_dot_data_load_validations] AS
WITH TableRecordCounts AS (
    SELECT
        1.1 AS table_id,
        'MDM_Assets_dbo' AS table_name,
        COUNT(*) AS record_count
    FROM dbo.MDM_Assets
    UNION ALL
    SELECT
        1.2 AS table_id,
        'MDM_Assets_reporting' AS table_name, 
        COUNT(*) AS record_count
    FROM reporting.MDM_Assets
    UNION ALL
    SELECT 
        2.1 AS table_id,
        'D365_AssetAttachments_dbo' AS table_name, 
        COUNT(*) AS record_count
    FROM dbo.D365_AssetAttachments
    UNION ALL
    SELECT 
        2.2 AS table_id,
        'D365_AssetAttachments_reporting' AS table_name,
        COUNT(*) AS record_count
    FROM reporting.D365_AssetAttachments
    UNION ALL
    SELECT 
        3.1 AS table_id,
        'D365_WorkOrderJobs_dbo' AS table_name, 
        COUNT(*) AS record_count
    FROM dbo.D365_WorkOrderJobs
    UNION ALL
    SELECT 
        3.2 AS table_id,
        'D365_WorkOrderJobs_reporting' AS table_name, 
        COUNT(*) AS record_count
    FROM reporting.D365_WorkOrderJobs
    UNION ALL
    SELECT 
        4.1 AS table_id,
        'D365_WorkOrders_dbo' AS table_name, 
        COUNT(*) AS record_count
    FROM dbo.D365_WorkOrders
    UNION ALL
    SELECT 
        4.2 AS table_id,
        'D365_WorkOrders_reporting' AS table_name, 
        COUNT(*) AS record_count
    FROM reporting.D365_WorkOrders
    UNION ALL
    SELECT
        5.1 AS table_id, 
        'IScout_159094_dbo' AS table_name, 
        COUNT(*) AS record_count
    FROM dbo.IScout_159094
    UNION ALL
    SELECT 
        5.2 AS table_id,
        'IScout_159094_reporting' AS table_name, 
        COUNT(*) AS record_count
    FROM reporting.IScout_159094
    UNION ALL
    SELECT 
        6.1 AS table_id,
        'MDM_AssetAttr_dbo' AS table_name, 
        COUNT(*) AS record_count
    FROM dbo.MDM_AssetAttr
    UNION ALL
    SELECT
        6.2 AS table_id, 
        'MDM_AssetAttr_reporting' AS table_name, 
        COUNT(*) AS record_count
    FROM reporting.MDM_AssetAttr
    UNION ALL
    SELECT 
        7.1 AS table_id, 
        'MotiveMiles_dbo' AS table_name, 
        COUNT(*) AS record_count
    FROM dbo.MotiveMiles
    UNION ALL
    SELECT 
        7.2 AS table_id,
        'MotiveMiles_reporting' AS table_name, 
        COUNT(*) AS record_count
    FROM reporting.MotiveMiles
    UNION ALL
    SELECT
        8.1 AS table_id, 
        'Motive_IFTA_Trips_dbo' AS table_name, 
        COUNT(*) AS record_count
    FROM dbo.Motive_IFTA_Trips
    UNION ALL
    SELECT 
        8.2 AS table_id,
        'Motive_IFTA_Trips_reporting' AS table_name, 
        COUNT(*) AS record_count
    FROM reporting.Motive_IFTA_Trips
    
)
SELECT table_id, table_name, record_count
FROM TableRecordCounts
GO


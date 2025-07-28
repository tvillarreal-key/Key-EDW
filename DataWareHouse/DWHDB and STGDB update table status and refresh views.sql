 EXEC sp_updatestats;

-- dwhdb-PROD-POC
 EXEC sp_refreshview 'datamart.vw_SumFactIncorrectAssetStatus';
 EXEC sp_refreshview 'metricsvault.vw_lastrun_auditlog_counts';
 --stgdb-PROD-POC
 SELECT 
    TABLE_SCHEMA, 
    TABLE_NAME 
FROM 
    INFORMATION_SCHEMA.VIEWS
ORDER BY 1,2

 EXEC sp_refreshview 'curated.vw_changed_asset_class_recs'
 EXEC sp_refreshview 'curated.vw_changed_asset_status_recs'
 EXEC sp_refreshview 'curated.vw_changed_dimasset_recs'
 EXEC sp_refreshview 'curated.vw_changed_LOB_recs'
 EXEC sp_refreshview 'curated.vw_changed_location_recs'
 EXEC sp_refreshview 'curated.vw_changed_mktplace_recs'
 EXEC sp_refreshview 'curated.vw_changed_yard_recs'
 EXEC sp_refreshview 'curated.vw_distinct_asset_status_recs'
 EXEC sp_refreshview 'curated.vw_distinct_assetclass_recs'
 EXEC sp_refreshview 'curated.vw_distinct_dimasset_recs'
 EXEC sp_refreshview 'curated.vw_distinct_LOB_recs'
 EXEC sp_refreshview 'curated.vw_distinct_location_recs'
 EXEC sp_refreshview 'curated.vw_distinct_mktplace_recs'
 EXEC sp_refreshview 'curated.vw_distinct_yard_recs'
 EXEC sp_refreshview 'curated.vw_FactIncorrectAssetStatus'
 EXEC sp_refreshview 'curated.vw_FactLastDayWorked'
 EXEC sp_refreshview 'staging.vw_changed_asset_recs'
 EXEC sp_refreshview 'staging.vw_changed_assetattr_recs'

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- EXTERNAL VIEW
--USE ElasticMasterDB;
DROP VIEW IF EXISTS [datavault].[vw_changed_hubasset_recs] 
GO
-- EXTERNAL VIEW
--USE ElasticMasterDB;
CREATE VIEW [datavault].[vw_changed_hubasset_recs] AS
SELECT 
    A.[AssetsHashKey]
    ,A.[LoadDate]
    ,A.[SourceSystem]
    ,A.[Asset_Num]    
    ,A.[LastSeenDate]
,'I' AS Chg_Flag
FROM [staging].[MDM_Assets] A 
LEFT JOIN [datavault].[HubAsset] B
ON A.Asset_Num = B.Asset_Num
WHERE B.Asset_Num IS NULL -- This gets the new records
-- No hub records are updated, only inserted
;
GO
-------------
-- testing
-------------
--USE ElasticMasterDB;
SELECT *
FROM [datavault].[vw_changed_hubasset_recs]
;

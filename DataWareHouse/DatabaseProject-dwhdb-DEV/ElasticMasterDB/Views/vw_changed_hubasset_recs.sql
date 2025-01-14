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
/* Always do the hub lookups using the business key to avoid the rare risk
     of hash collisions. If two business keys produce the same hash key, 
     a lookup on the hash key would return that the hash key already exists in the target. 
     But due to the hash collision, this would mean a different business key.
     However, in the case of a hash collision, this will result in a primary key constraint
     violation when inserting the record in the next step. This is not the preferred solution,
     but it is the desired one, because we’d like to be notified in case of collision.
*/
;
GO
-------------
-- testing
-------------
--USE ElasticMasterDB;
SELECT *
FROM [datavault].[vw_changed_hubasset_recs]
;

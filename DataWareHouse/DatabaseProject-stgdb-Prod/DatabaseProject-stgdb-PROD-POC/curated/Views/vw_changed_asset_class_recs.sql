CREATE VIEW [curated].[vw_changed_asset_class_recs] AS
SELECT A.*,'I' AS Chg_Flag
FROM [curated].[vw_distinct_assetclass_recs] A 
LEFT JOIN [curated].[dimAssetClass] B
ON A.ClassHashKey = B.ClassHashKey
WHERE B.ClassHashKey IS NULL -- This gets the new records
UNION
SELECT A.*,'U' AS Chg_Flag
FROM [curated].[vw_distinct_assetclass_recs] A 
LEFT JOIN [curated].[dimAssetClass] B
ON A.ClassHashKey = B.ClassHashKey
WHERE A.ClassChkSum != B.ClassChkSum -- This gets the updated records
;

GO


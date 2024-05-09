CREATE VIEW [datavault].[vw_changed_satasset_recs] AS
SELECT 
    A.*
,'I' AS Chg_Flag
FROM [staging].[MDM_Assets] A 
LEFT JOIN [datavault].[SatAsset] B
ON A.AssetsHashKey = B.AssetsHashKey
WHERE B.AssetsHashKey IS NULL -- This gets the new records
UNION
SELECT 
    A.*
,'U' AS Chg_Flag
FROM [staging].[MDM_Assets] A 
LEFT JOIN [datavault].[SatAsset] B
ON A.AssetsHashKey = B.AssetsHashKey
WHERE A.AssetsChkSum != B.AssetsChkSum -- This gets the updated records
;
GO


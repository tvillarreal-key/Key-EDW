CREATE VIEW [staging].[vw_changed_asset_recs] AS
SELECT A.*,'I' AS Chg_Flag
FROM [staging].[MDM_Assets] A 
LEFT JOIN [curated].[MDM_Assets] B
ON A.Asset_Num = B.Asset_Num
WHERE B.Asset_Num IS NULL -- This gets the new records
UNION
SELECT A.*,'U' AS Chg_Flag
FROM [staging].[MDM_Assets] A 
LEFT JOIN [curated].[MDM_Assets] B
ON A.Asset_Num = B.Asset_Num
WHERE A.AssetsChkSum != B.AssetsChkSum -- This gets the updated records
;

GO


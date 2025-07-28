SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
DROP VIEW IF EXISTS [staging].[vw_changed_asset_recs] 
GO
CREATE VIEW [staging].[vw_changed_asset_recs] AS
SELECT A.*,'U' AS Chg_Flag
FROM [staging].[MDM_Assets] A 
LEFT JOIN [curated].[MDM_Assets] B
ON A.Asset_Num = B.Asset_Num
WHERE A.AssetsChkSum != B.AssetsChkSum -- This gets the updated records
UNION
SELECT A.*,'I' AS Chg_Flag
FROM [staging].[MDM_Assets] A 
LEFT JOIN [curated].[MDM_Assets] B
ON A.Asset_Num = B.Asset_Num
WHERE B.Asset_Num IS NULL -- This gets the new records
;
GO

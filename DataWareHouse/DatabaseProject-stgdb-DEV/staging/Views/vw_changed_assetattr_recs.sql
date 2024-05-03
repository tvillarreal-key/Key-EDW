SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
DROP VIEW IF EXISTS [staging].[vw_changed_assetattr_recs] 
GO
CREATE VIEW [staging].[vw_changed_assetattr_recs] AS
SELECT A.*,'U' AS Chg_Flag
FROM [staging].[MDM_Assetattr] A 
LEFT JOIN [curated].[MDM_AssetAttr] B
ON A.Asset_Num = B.Asset_Num
   AND A.AttrCode = B.AttrCode
WHERE A.AssetAttrChkSum != B.AssetAttrChkSum -- This gets the updated records
UNION
SELECT A.*,'I' AS Chg_Flag
FROM [staging].[MDM_Assetattr] A 
LEFT JOIN [curated].[MDM_AssetAttr] B
ON A.Asset_Num = B.Asset_Num
   AND A.AttrCode = B.AttrCode
WHERE B.Asset_ID IS NULL -- This gets the new records
;
GO

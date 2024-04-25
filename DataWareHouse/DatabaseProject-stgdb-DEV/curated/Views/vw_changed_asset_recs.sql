SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
DROP VIEW IF EXISTS [curated].[vw_changed_asset_recs]
GO
CREATE VIEW [curated].[vw_changed_asset_recs] AS
SELECT A.*
FROM [staging].[MDM_Assets] A 
WHERE A.Asset_Num NOT IN        
    (SELECT B.Asset_Num
     FROM [curated].[MDM_Assets] B
    )
UNION
SELECT A.*
FROM [staging].[MDM_Assets] A 
JOIN [curated].[MDM_Assets] B
  ON A.Asset_Num = B.Asset_Num
  AND A.AssetsChkSum != B.AssetsChkSum
;
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
DROP VIEW IF EXISTS [curated].[vw_changed_dimasset_recs]
GO
CREATE VIEW [curated].[vw_changed_dimasset_recs] AS
SELECT A.*,'I' AS Chg_Flag
FROM [curated].[vw_distinct_Asset_recs] A 
LEFT JOIN [curated].[dimAsset] B
ON A.AssetHashKey = B.AssetHashKey
WHERE B.AssetHashKey IS NULL -- This gets the new records
UNION
SELECT A.*,'U' AS Chg_Flag
FROM [curated].[vw_distinct_Asset_recs] A 
LEFT JOIN [curated].[dimAsset] B
ON A.AssetHashKey = B.AssetHashKey
WHERE A.AssetChkSum != B.AssetChkSum -- This gets the updated records
;
GO

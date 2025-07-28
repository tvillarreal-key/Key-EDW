SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
DROP VIEW IF EXISTS [curated].[vw_changed_dimasset_recs]
GO
CREATE VIEW [curated].[vw_changed_dimasset_recs] AS
SELECT A.*,'I' AS Chg_Flag
FROM [curated].[vw_distinct_dimasset_recs] A 
LEFT JOIN [curated].[dimAsset] B
ON A.AssetsHashKey = B.AssetsHashKey
WHERE B.AssetsHashKey IS NULL -- This gets the new records
UNION
SELECT A.*,'U' AS Chg_Flag
FROM [curated].[vw_distinct_dimasset_recs] A 
LEFT JOIN [curated].[dimAsset] B
ON A.AssetsHashKey = B.AssetsHashKey
WHERE A.AssetsChkSum != B.AssetsChkSum -- This gets the updated records
;
GO

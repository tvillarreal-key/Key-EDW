SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
DROP VIEW IF EXISTS [curated].[vw_changed_asset_status_recs]
GO
CREATE VIEW [curated].[vw_changed_asset_status_recs] AS
SELECT A.*,'I' AS Chg_Flag
FROM [curated].[vw_distinct_asset_status_recs] A 
LEFT JOIN [curated].[dimAssetStatus] B
ON A.StatusHashKey = B.StatusHashKey
WHERE B.StatusHashKey IS NULL -- This gets the new records
UNION
SELECT A.*,'U' AS Chg_Flag
FROM [curated].[vw_distinct_asset_status_recs] A 
LEFT JOIN [curated].[dimAssetStatus] B
ON A.StatusHashKey = B.StatusHashKey
WHERE A.StatusChkSum != B.StatusChkSum -- This gets the updated records
;
GO

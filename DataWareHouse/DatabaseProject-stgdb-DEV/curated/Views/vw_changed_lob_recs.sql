SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
DROP VIEW [curated].[vw_changed_LOB_recs]
GO
CREATE VIEW [curated].[vw_changed_LOB_recs] AS
SELECT A.*,'I' AS Chg_Flag
FROM [curated].[vw_distinct_LOB_recs] A 
LEFT JOIN [curated].[dimLOB] B
ON A.LOBHashKey = B.LOBHashKey
WHERE B.LOBHashKey IS NULL -- This gets the new records
UNION
SELECT A.*,'U' AS Chg_Flag
FROM [curated].[vw_distinct_LOB_recs] A 
LEFT JOIN [curated].[dimLOB] B
ON A.LOBHashKey = B.LOBHashKey
WHERE A.LOBChkSum != B.LOBChkSum -- This gets the updated records
;
GO

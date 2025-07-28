CREATE VIEW [curated].[vw_changed_yard_recs] AS
SELECT A.*,'I' AS Chg_Flag
FROM [curated].[vw_distinct_yard_recs] A 
LEFT JOIN [curated].[dimYard] B
ON A.YardHashKey = B.YardHashKey
WHERE B.YardHashKey IS NULL -- This gets the new records
UNION
SELECT A.*,'U' AS Chg_Flag
FROM [curated].[vw_distinct_yard_recs] A 
LEFT JOIN [curated].[dimYard] B
ON A.YardHashKey = B.YardHashKey
WHERE A.YardChkSum != B.YardChkSum -- This gets the updated records
;

GO


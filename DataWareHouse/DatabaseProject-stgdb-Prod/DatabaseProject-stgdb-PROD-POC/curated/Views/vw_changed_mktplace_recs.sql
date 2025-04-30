CREATE VIEW [curated].[vw_changed_mktplace_recs] AS
SELECT A.*,'I' AS Chg_Flag
FROM [curated].[vw_distinct_mktplace_recs] A 
LEFT JOIN [curated].[dimMktPlace] B
ON A.MktPlaceHashKey = B.MktPlaceHashKey
WHERE B.MktPlaceHashKey IS NULL -- This gets the new records
UNION
SELECT A.*,'U' AS Chg_Flag
FROM [curated].[vw_distinct_mktplace_recs] A 
LEFT JOIN [curated].[dimMktPlace] B
ON A.MktPlaceHashKey = B.MktPlaceHashKey
WHERE A.MktPlaceChkSum != B.MktPlaceChkSum -- This gets the updated records
;

GO


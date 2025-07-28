-- Finds the raw rows for the last changed assets in curated load
SELECT *
FROM [curated].[MDM_Assets] B
WHERE LoadDate IN
(
    SELECT MAX(LoadDate)
    FROM [curated].[MDM_Assets] C
)
;

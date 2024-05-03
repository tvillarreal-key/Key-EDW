-- Finds the raw rows for the last changed assets in curated load
SELECT *
FROM [raw].[MDM_Assets] A
WHERE A.Asset_Num IN
(
    SELECT Asset_Num
    FROM [curated].[MDM_Assets] B
    WHERE LoadDate IN
    (
        SELECT MAX(LoadDate)
        FROM [curated].[MDM_Assets] C
    )
)
ORDER BY Asset_Num ASC, LoadDate DESC
;

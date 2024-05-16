-- validate query for update below
SELECT 
    hub.AssetsHashKey, hub.LoadDate, hub.SourceSystem, hub.Asset_Num,
    hub.LastSeenDate
FROM 
    [datavault].[HubAsset] hub
WHERE 
    hub.LastSeenDate < '2024-05-11 12:58:00'
;

SELECT DISTINCT LoadDate
FROM [staging].MDM_Assets;


-- update used in pipeline
UPDATE [datavault].HubAsset 
SET LastSeenDate = '2024-05-11 12:58:00'
FROM 
    [datavault].[HubAsset] hub
WHERE
    hub.LastSeenDate < '2024-05-11 12:58:00'
;
UPDATE [datavault].[HubAsset]
SET LastSeenDate = '2024-05-15T10:12:12.901'

SELECT AssetsHashKey, LoadDate,Asset_Num,LastSeenDate
FROM [datavault].[HubAsset] 
WHERE LastSeenDate < '2024-05-15T10:12:12.901'

-- Last Seen Counts
SELECT LoadDate,LastSeenDate, COUNT(*) cnt 
FROM [datavault].[HubAsset] 
GROUP BY LoadDate,LastSeenDate;



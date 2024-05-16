---- dwhdb-DEV --------------------------------------------
-- Full Run
SELECT [LogSequence]
      ,[TargetSchema]
      ,[TargetName]
      ,[ExecutionEndTime]
      ,FORMAT(CAST(RowsRead AS money), 'N0') AS RowsRead
      ,FORMAT(CAST(RowsWritten AS money), 'N0') AS RowsWritten
  FROM [metricsvault].[Integration_AuditLog]
  WHERE LogSequence > 
    (
        SELECT MAX(LogSequence)-10
        FROM [metricsvault].[Integration_AuditLog]        
    )
    ORDER BY 1 DESC
    ;

---- stgdb-DEV --------------------------------------------
-- MDM_Assets
SELECT 'staging data MDM_Assets cnts: ' cnt_type
      ,FORMAT(CAST(COUNT(*) AS money), 'N0') AS cnt
FROM [staging].[MDM_Assets] A
UNION
SELECT 'raw data MDM_Assets cnts: ' cnt_type
      ,FORMAT(CAST(COUNT(*) AS money), 'N0') AS cnt
FROM [raw].[MDM_Assets] B
WHERE LoadDate IN
(
    SELECT MAX(LoadDate)
    FROM [raw].[MDM_Assets] C
)
UNION
SELECT 'curated data MDM_Assets cnts: ' cnt_type
      ,FORMAT(CAST(COUNT(*) AS money), 'N0') AS cnt
FROM [curated].[MDM_Assets] B
;

---- stgdb-DEV --------------------------------------------
-- MDM_AssetAttr
SELECT 'staging data MDM_AssetAttr cnts: ' cnt_type
      ,FORMAT(CAST(COUNT(*) AS money), 'N0') AS cnt
FROM [staging].[MDM_AssetAttr] A
UNION
SELECT 'raw data MDM_AssetAttr cnts: ' cnt_type
      ,FORMAT(CAST(COUNT(*) AS money), 'N0') AS cnt
FROM [raw].[MDM_AssetAttr] B
WHERE LoadDate IN
(
    SELECT MAX(LoadDate)
    FROM [raw].[MDM_AssetAttr] C
)
UNION
SELECT 'curated data MDM_AssetAttr cnts: ' cnt_type
      ,FORMAT(CAST(COUNT(*) AS money), 'N0') AS cnt
FROM [curated].[MDM_AssetAttr] B
;

---- dwhdb-DEV --------------------------------------------
-- datavault checks
-- ** Last Seen Counts
-- LoadDate - when hub record added (no updates); LastSeenDate - Asset_Num last Seen in latest stg LoadDate
SELECT LoadDate,LastSeenDate, COUNT(*) cnt 
FROM [datavault].[HubAsset] 
GROUP BY LoadDate,LastSeenDate
ORDER BY 1;

-- validate query for update below
SELECT 
    hub.AssetsHashKey, hub.LoadDate, hub.SourceSystem, hub.Asset_Num,
    hub.LastSeenDate
FROM 
    [datavault].[HubAsset] hub
WHERE 
    hub.LastSeenDate < getdate()
;

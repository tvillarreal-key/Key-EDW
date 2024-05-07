SELECT [LogSequence]
      ,[TargetSchema]
      ,[TargetName]
      ,[ExecutionEndTime]
      ,FORMAT(CAST(RowsRead AS money), 'N0') AS RowsRead
      ,FORMAT(CAST(RowsWritten AS money), 'N0') AS RowsWritten
  FROM [metricsvault].[Integration_AuditLog]
  WHERE LogSequence > 
    (
        SELECT MAX(LogSequence)-6
        FROM [metricsvault].[Integration_AuditLog]        
    )
    ORDER BY 3, 2 ASC
    ;

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

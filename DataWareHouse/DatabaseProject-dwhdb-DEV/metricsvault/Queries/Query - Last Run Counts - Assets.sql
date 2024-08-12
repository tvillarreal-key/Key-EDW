---- dwhdb-PROD --------------------------------------------
-- Full Run
---- dwhdb-DEV --------------------------------------------
-- Full Run
SELECT [LogSequence]
      ,[TargetSchema]
      ,[TargetName]
      ,[ExecutionEndTime]
      ,FORMAT(CAST(RowsRead AS money), 'N0') AS RowsRead
      ,FORMAT(CAST(RowsWritten AS money), 'N0') AS RowsWritten
  FROM [metricsvault].[Integration_AuditLog]
  WHERE CONVERT(DATE,ExecutionStartTime)  =
    (
        SELECT DISTINCT CONVERT(DATE,ExecutionStartTime) 
        FROM [metricsvault].[Integration_AuditLog]   
        WHERE CONVERT(DATE,ExecutionStartTime) = CONVERT(DATE,GETDATE())     
    )
 --   AND TargetSchema = 'CURATED'
 --  AND TargetSchema IN ('DATAMART')
    ORDER BY 4 DESC
    ;
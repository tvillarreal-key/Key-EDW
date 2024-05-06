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
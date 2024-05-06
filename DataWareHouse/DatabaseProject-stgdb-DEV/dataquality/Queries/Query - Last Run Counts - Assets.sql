SELECT [LogSequence]
      ,[PipelineName]
      ,[TargetName]
      ,[RowsRead]
      ,[RowsWritten]
  FROM [metricsvault].[Integration_AuditLog]
  WHERE LogSequence > 
    (
        SELECT MAX(LogSequence)-6
        FROM [metricsvault].[Integration_AuditLog]        
    )
    ORDER BY 3, 2 ASC
SELECT [LogSequence]
      ,[Integration_MethodName]
      ,[TriggerType]
      ,[PipelineName]
      ,[TriggerId]
      ,[TriggerName]
      ,[TriggerTime]
      ,[SourceType]
      ,[SourceSchema]
      ,[SourceName]
      ,[TargetType]
      ,[TargetSchema]
      ,[TargetName]
      ,FORMAT(CAST(RowsRead AS money), 'N0') AS RowsRead
      ,FORMAT(CAST(RowsWritten AS money), 'N0') AS RowsWritten
      ,FORMAT(CAST(RowsRead-RowsWritten AS money), 'N0') AS Difference
      ,[ExecutionRunId]
      ,[ExecutionStatus]
      ,[ExecutionStartTime]
      ,[ExecutionEndTime]
      ,[ExecutionRunDurationInSecs]
      ,[ErrorCode]
      ,[ErrorName]
      ,[ErrorDescription]
      ,[ErrorSeverity]
      ,[ErrorCategory]
  FROM [metricsvault].[Integration_AuditLog]
  WHERE CONVERT(DATE,ExecutionStartTime)  =
    (
        SELECT DISTINCT CONVERT(DATE,ExecutionStartTime) 
        FROM [metricsvault].[Integration_AuditLog]   
        WHERE CONVERT(DATE,ExecutionStartTime) = CONVERT(DATE,GETDATE())     
    )
  ORDER BY 1 DESC
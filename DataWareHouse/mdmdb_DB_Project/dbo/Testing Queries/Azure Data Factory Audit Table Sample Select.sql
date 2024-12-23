SELECT TOP (1000) [LogSequence]
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
      ,[RowsRead]
      ,[RowsWritten]
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
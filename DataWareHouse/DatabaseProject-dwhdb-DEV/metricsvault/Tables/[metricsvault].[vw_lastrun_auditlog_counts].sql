SELECT TOP (1000) [LogSequence]
      ,[TargetSchema]
      ,[TargetName]
      ,[ExecutionEndTime]
      ,[RowsRead]
      ,[RowsWritten]
  FROM [metricsvault].[vw_lastrun_auditlog_counts]
  ORDER BY 1 DESC
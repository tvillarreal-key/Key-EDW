SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
DROP VIEW IF EXISTS [metricsvault].[vw_lastrun_auditlog_counts]
GO
CREATE VIEW [metricsvault].[vw_lastrun_auditlog_counts] AS
SELECT [LogSequence]
      ,[TargetSchema]
      ,[TargetName]
      ,[ExecutionEndTime]
      ,FORMAT(CAST(RowsRead AS money), 'N0') AS RowsRead
      ,FORMAT(CAST(RowsWritten AS money), 'N0') AS RowsWritten
  FROM [metricsvault].[Integration_AuditLog]
  WHERE LogSequence > 
    (
        SELECT MAX(LogSequence)-27
        FROM [metricsvault].[Integration_AuditLog]        
    )
;
GO
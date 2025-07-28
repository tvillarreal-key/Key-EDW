SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
DROP VIEW IF EXISTS [metricsvault].[vw_lastrun_auditlog_counts];
GO
CREATE VIEW [metricsvault].[vw_lastrun_auditlog_counts] AS
SELECT TOP 1000 [LogSequence]
      ,[TargetSchema]
      ,[TargetName]
      ,[ExecutionEndTime]
      ,FORMAT(CAST(RowsRead AS money), 'N0') AS RowsRead
      ,FORMAT(CAST(RowsWritten AS money), 'N0') AS RowsWritten
      ,FORMAT(CAST(RowsRead-RowsWritten AS money), 'N0') AS Difference
  FROM [metricsvault].[Integration_AuditLog]
  WHERE CONVERT(DATE,ExecutionStartTime)  =
    (
        SELECT DISTINCT CONVERT(DATE,ExecutionStartTime) 
        FROM [metricsvault].[Integration_AuditLog]   
        WHERE CONVERT(DATE,ExecutionStartTime) = CONVERT(DATE,GETDATE())     
    )
  ORDER BY 4 DESC   
;
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- DROP TABLE [dbo].[Integration_AuditLog]
CREATE TABLE [dbo].[Integration_AuditLog](
	[LogSequence] [bigint],
	[Integration_MethodName] [nvarchar](100) NULL,
	[TriggerType] [nvarchar](50) NULL,
	[PipelineName] [nvarchar](100) NULL,
	[TriggerId] [nvarchar](100) NULL,
	[TriggerName] [nvarchar](100) NULL,
	[TriggerTime] [nvarchar](50) NULL,
	[SourceType] [nvarchar](50) NULL,
	[SourceSchema] [nvarchar](50) NULL,
	[SourceName] [nvarchar](100) NULL,
	[TargetType] [nvarchar](50) NULL,
	[TargetSchema] [nvarchar](50) NULL,
	[TargetName] [nvarchar](100) NULL,
	[RowsRead] [int] NULL,
	[RowsWritten] [int] NULL,
	[ExecutionRunId] [nvarchar](100) NULL,
	[ExecutionStatus] [nvarchar](50) NULL,
	[ExecutionStartTime] [datetime] NULL,
	[ExecutionEndTime] [datetime] NULL,
    [ExecutionRunDurationInSecs] [int] NULL,
    [ErrorCode] [nvarchar](50) NULL,
    [ErrorName] [nvarchar](100) NULL,
    [ErrorDescription] [nvarchar](500) NULL,  
    [ErrorSeverity] [nvarchar](50) NULL,    
    [ErrorCategory] [nvarchar](50) NULL    
) ON [PRIMARY]
GO

-- Drop SEQUENCE LogSequence
CREATE SEQUENCE dbo.Integration_AuditLogSeq
    AS BIGINT
    START WITH 1
    INCREMENT BY 1;

--DROP SEQUENCE dbo.Integration_AuditLogSeq;
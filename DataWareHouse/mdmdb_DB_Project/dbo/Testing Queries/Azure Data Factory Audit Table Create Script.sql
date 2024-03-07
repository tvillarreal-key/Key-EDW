SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- DROP TABLE [dbo].[Integration_AuditLog]
CREATE TABLE [dbo].[Integration_AuditLog](
	[LogSequence] [bigint] NULL,
    [ETL_Method_Name] [nvarchar](500) NULL,
	[TriggerType] [nvarchar](500) NULL,
	[PipelineName] [nvarchar](500) NULL,
	[TriggerId] [nvarchar](500) NULL,
	[TriggerName] [nvarchar](500) NULL,
	[TriggerTime] [nvarchar](500) NULL,
	[RunId] [nvarchar](500) NULL,
	[SourceType] [nvarchar](500) NULL,
	[SourceSchema] [nvarchar](500) NULL,
	[SourceName] [nvarchar](500) NULL,
	[TargetType] [nvarchar](500) NULL,
    [TargetSchema] [nvarchar](500) NULL,
	[TargetName] [nvarchar](500) NULL,
	[RowsRead] [int] NULL,
	[RowsWritten] [int] NULL,
	[RunDuration_in_secs] [int] NULL,
	[IntegrationRuntime] [nvarchar](500) NULL,
	[Execution_Status] [nvarchar](500) NULL,
	[RunActivity_Start_Time] [datetime] NULL,
	[RunActivity_End_Time] [datetime] NULL
) ON [PRIMARY]
GO

-- Drop SEQUENCE LogSequence
CREATE SEQUENCE dbo.Integration_AuditLogSeq
    AS BIGINT
    START WITH 1
    INCREMENT BY 1;

--DROP SEQUENCE dbo.Integration_AuditLogSeq;
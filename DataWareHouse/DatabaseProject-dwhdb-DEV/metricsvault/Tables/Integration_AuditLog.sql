CREATE TABLE [metricsvault].[Integration_AuditLog] (
    [LogSequence]                BIGINT         NULL,
    [Integration_MethodName]     NVARCHAR (100) NULL,
    [TriggerType]                NVARCHAR (50)  NULL,
    [PipelineName]               NVARCHAR (100) NULL,
    [TriggerId]                  NVARCHAR (100) NULL,
    [TriggerName]                NVARCHAR (100) NULL,
    [TriggerTime]                NVARCHAR (50)  NULL,
    [SourceType]                 NVARCHAR (50)  NULL,
    [SourceSchema]               NVARCHAR (50)  NULL,
    [SourceName]                 NVARCHAR (100) NULL,
    [TargetType]                 NVARCHAR (50)  NULL,
    [TargetSchema]               NVARCHAR (50)  NULL,
    [TargetName]                 NVARCHAR (100) NULL,
    [RowsRead]                   INT            NULL,
    [RowsWritten]                INT            NULL,
    [ExecutionRunId]             NVARCHAR (100) NULL,
    [ExecutionStatus]            NVARCHAR (50)  NULL,
    [ExecutionStartTime]         DATETIME       NULL,
    [ExecutionEndTime]           DATETIME       NULL,
    [ExecutionRunDurationInSecs] INT            NULL,
    [ErrorCode]                  NVARCHAR (50)  NULL,
    [ErrorName]                  NVARCHAR (100) NULL,
    [ErrorDescription]           NVARCHAR (500) NULL,
    [ErrorSeverity]              NVARCHAR (50)  NULL,
    [ErrorCategory]              NVARCHAR (50)  NULL
);


GO


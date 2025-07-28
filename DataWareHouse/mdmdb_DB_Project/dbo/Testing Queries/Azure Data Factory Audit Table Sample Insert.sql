-- Insert sample data into Integration_AuditLog
INSERT INTO [dbo].[Integration_AuditLog] (
    [LogSequence],
    [Integration_MethodName],
    [TriggerType],
    [PipelineName],
    [TriggerId],
    [TriggerName],
    [TriggerTime],
    [SourceType],
    [SourceSchema],
    [SourceName],
    [TargetType],
    [TargetSchema],
    [TargetName],
    [RowsRead],
    [RowsWritten],
    [ExecutionRunId],
    [ExecutionStatus],
    [ExecutionStartTime],
    [ExecutionEndTime],
    [ExecutionRunDurationInSecs],
    [ErrorCode],
    [ErrorName],
    [ErrorDescription],
    [ErrorSeverity],
    [ErrorCategory]
)
VALUES (
    NEXT VALUE FOR dbo.Integration_AuditLogSeq, --LogSequence
    'ADF Pipeline', -- Integration_MethodName
    'PowerAutomate Schedule', -- TriggerType -- other options Boomi on-demand; Boomi hourly; Boomi Streaming
    'MDM_Assets_Load_Daily', -- PipelineName
    '123456789', -- TriggerId  -- Boomi Schedule ID captured at runtime
    'DWH Daily Load', -- TriggerName -- Boomi Schedule Name
    'Daily 12:01 AM', -- TriggerTime  -- Boomi Schedule Time and Frequency
    'D365 Entity', -- SourceType
    'D365_FNO', -- SourceSchema
    'D365_Assets_Entity', -- SourceName
    'Azure DB Table', -- TargetType
    'DBO', -- TargetSchema
    'MDM_Assets', -- TargetName
    100, -- RowsRead
    100, -- RowsWritten
    '32165', -- ExecutionRunId
    'Success',  -- ExecutionStatus; success, running, pending, completed, error
    '2024-03-06T15:00:00', -- ExecutionStartTime YYYY-MM-DD:THH:MM:SS
    '2024-03-06T15:01:43', -- ExecutionEndTime   YYYY-MM-DD:THH:MM:SS   
    103, -- ExecutionRunDurationInSecs
    'E001', -- ErrorCode; integration, read or write error number
    'Error 001 - Write Error', -- ErrorName; integration, read or write error name
    'Write Error During Execution', -- ErrorDescription; integration, read or write error
    'High', -- ErrorSeverity; High, Med, Low
    'WriteIssue' -- ErrorCategory; ReadIssue, WriteIssue, ConnectionIssue, IntegrationIssue
);

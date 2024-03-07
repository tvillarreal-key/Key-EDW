INSERT INTO [metricsvault].[Integration_AuditLog] (
    [LogSequence],
    [ETL_Method_Name],
    [TriggerType],
    [PipelineName],
    [TriggerId],
    [TriggerName],
    [TriggerTime],
    [RunId],
    [SourceType],    
    [SourceSchema],
    [SourceName],
    [TargetType],    
    [TargetSchema],
    [TargetName],
    [RowsRead],
    [RowsWritten],
    [RunDuration_in_secs],
    [IntegrationRuntime],
    [Execution_Status],
    [RunActivity_Start_Time],
    [RunActivity_End_Time]
)
VALUES (
    NEXT VALUE FOR metricsvault.Integration_AuditLogSeq,
    'Boomi', -- ETL_Method_Name
    'Boomi Schedule', -- TriggerType -- other options Boomi on-demand; Boomi hourly; Boomi Streaming
    'MDM_Assets_Load_Daily', -- PipelineName
    '123456789', -- TriggerId  -- Boomi Schedule ID captured at runtime
    'DWH Daily Load', -- TriggerName -- Boomi Schedule Name
    'Daily 12:01 AM', -- TriggerTime  -- Boomi Schedule Time and Frequency
    '32165', -- RunId
    'D365 Entity', -- Source_Type
    'D365_FNO', -- SourceSchema
    'D365_Assets_Entity', -- SourceName
    'Azure DB Table', -- Target_Type
    'DBO', -- TargetSchema
    'MDM_Assets', -- TargetName
    100, -- RowsRead
    100, -- RowsWritten
    60, -- RunDuration_in_secs
    '00:01:43', -- IntegrationRuntime HH:MM:SS
    'Success',  -- Execution_Status
    '2024-03-06T15:00:00', -- RunActivity_Start_Time YYYY-MM-DD:THH:MM:SS
    '2024-03-06T15:01:43'  -- RunActivity_End_Time   YYYY-MM-DD:THH:MM:SS   
);

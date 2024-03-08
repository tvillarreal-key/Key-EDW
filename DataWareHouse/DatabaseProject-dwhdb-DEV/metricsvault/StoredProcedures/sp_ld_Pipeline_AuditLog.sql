- DROP PROCEDURE [metricsvault].[Load_Pipeline_AuditLog]
CREATE PROCEDURE [metricsvault].[sp_ld_Pipeline_AuditLog]
    @DataFactory_Name nvarchar(500),
    @Pipeline_Name nvarchar(500),
    @RunId nvarchar(500),
    @SourceSchema nvarchar(500),
    @SourceName nvarchar(500),
    @TargetSchema nvarchar(500),
    @TargetName nvarchar(500),
    @TriggerType nvarchar(500),
    @TriggerId nvarchar(500),
    @TriggerName nvarchar(500),
    @TriggerTime nvarchar(500),
    @RowsRead int,
    @RowsWritten int,
    @No_ParallelCopies int,
    @RunDuration_in_secs int,
    @effectiveIntegrationRuntime nvarchar(500),
    @Source_Type nvarchar(500),
    @Sink_Type nvarchar(500),
    @Execution_Status nvarchar(500),
    @RunActivity_Start_Time datetime,
    @RunActivity_End_Time datetime,
    @RunActivity_queuingDuration_in_secs int,
    @RunActivity_timeToFirstByte_in_secs int,
    @RunActivity_transferDuration_in_secs int
AS
BEGIN
    INSERT INTO [metricsvault].[Pipeline_AuditLog]
    (
        LogSequence,
        DataFactory_Name,
        Pipeline_Name,
        RunId,
        SourceSchema,
        SourceName,
        TargetSchema,
        TargetName,
        TriggerType,
        TriggerId,
        TriggerName,
        TriggerTime,
        RowsRead,
        RowsWritten,
        No_ParallelCopies,
        RunDuration_in_secs,
        effectiveIntegrationRuntime,
        Source_Type,
        Sink_Type,
        Execution_Status,
        RunActivity_Start_Time,
        RunActivity_End_Time,
        RunActivity_queuingDuration_in_secs,
        RunActivity_timeToFirstByte_in_secs,
        RunActivity_transferDuration_in_secs
    )
    VALUES
    (
        NEXT VALUE FOR metricsvault.Pipeline_AuditLogSeq,
        @DataFactory_Name,
        @Pipeline_Name,
        @RunId,
        @SourceSchema,
        @SourceName,
        @TargetSchema,
        @TargetName,
        @TriggerType,
        @TriggerId,
        @TriggerName,
        @TriggerTime,
        @RowsRead,
        @RowsWritten,
        @No_ParallelCopies,
        @RunDuration_in_secs,
        @effectiveIntegrationRuntime,
        @Source_Type,
        @Sink_Type,
        @Execution_Status,
        @RunActivity_Start_Time,
        @RunActivity_End_Time,
        @RunActivity_queuingDuration_in_secs,
        @RunActivity_timeToFirstByte_in_secs,
        @RunActivity_transferDuration_in_secs
    );
END;

GO


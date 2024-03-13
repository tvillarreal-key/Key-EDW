SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
DROP PROCEDURE IF EXISTS [metricsvault].[sp_InsertIntegrationAuditLog];
GO
CREATE PROCEDURE [metricsvault].[sp_InsertIntegrationAuditLog]
    @Integration_MethodName nvarchar(100),
    @TriggerType nvarchar(50),
    @PipelineName nvarchar(100),
    @TriggerId nvarchar(100),
    @TriggerName nvarchar(100),
    @TriggerTime nvarchar(50),
    @SourceType nvarchar(50),
    @SourceSchema nvarchar(50),
    @SourceName nvarchar(100),
    @TargetType nvarchar(50),
    @TargetSchema nvarchar(50),
    @TargetName nvarchar(100),
    @RowsRead int,
    @RowsWritten int,
    @ExecutionRunId nvarchar(100),
    @ExecutionStatus nvarchar(50),
    @ExecutionStartTime datetime,
    @ExecutionEndTime datetime,
    @ExecutionRunDurationInSecs int,
    @ErrorCode nvarchar(50),
    @ErrorName nvarchar(100),
    @ErrorDescription nvarchar(500),
    @ErrorSeverity nvarchar(50),
    @ErrorCategory nvarchar(50)
AS
BEGIN
    DECLARE @seqvalue bigint; 
    SET NOCOUNT ON;
    SET @seqvalue = NEXT VALUE FOR [metricsvault].[Integration_AuditLogSeq];

    INSERT INTO [metricsvault].[Integration_AuditLog]
    (
        LogSequence,
        Integration_MethodName,
        TriggerType,
        PipelineName,
        TriggerId,
        TriggerName,
        TriggerTime,
        SourceType,
        SourceSchema,
        SourceName,
        TargetType,
        TargetSchema,
        TargetName,
        RowsRead,
        RowsWritten,
        ExecutionRunId,
        ExecutionStatus,
        ExecutionStartTime,
        ExecutionEndTime,
        ExecutionRunDurationInSecs,
        ErrorCode,
        ErrorName,
        ErrorDescription,
        ErrorSeverity,
        ErrorCategory
    )
    VALUES
    (
        @SeqValue,
        @Integration_MethodName,
        @TriggerType,
        @PipelineName,
        @TriggerId,
        @TriggerName,
        @TriggerTime,
        @SourceType,
        @SourceSchema,
        @SourceName,
        @TargetType,
        @TargetSchema,
        @TargetName,
        @RowsRead,
        @RowsWritten,
        @ExecutionRunId,
        @ExecutionStatus,
        @ExecutionStartTime,
        @ExecutionEndTime,
        @ExecutionRunDurationInSecs,
        @ErrorCode,
        @ErrorName,
        @ErrorDescription,
        @ErrorSeverity,
        @ErrorCategory
    );
END;
GO

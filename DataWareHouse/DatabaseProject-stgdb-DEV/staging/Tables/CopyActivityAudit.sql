CREATE TABLE [staging].[CopyActivityAudit] (
    [PipelineName]       NVARCHAR (50) NULL,
    [ActivityName]       NVARCHAR (50) NULL,
    [DataRead]           BIGINT        NULL,
    [DataWritten]        BIGINT        NULL,
    [FilesRead]          INT           NULL,
    [FilesWritten]       INT           NULL,
    [CopyDuration]       INT           NULL,
    [Timestampdatetime2] DATETIME2 (7) NULL
);


GO


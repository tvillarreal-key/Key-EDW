CREATE PROCEDURE staging.InsertCopyActivityAudit
    @PipelineName nvarchar(50),
    @ActivityName nvarchar(50),
    @DataRead bigint,
    @DataWritten bigint,
    @FilesRead int,
    @FilesWritten int,
    @CopyDuration int,
    @Timestamp datetime2
AS
BEGIN
    INSERT INTO staging.CopyActivityAudit
    VALUES (@PipelineName, @ActivityName, @DataRead, @DataWritten, @FilesRead, @FilesWritten, @CopyDuration, @Timestamp);
END;

GO


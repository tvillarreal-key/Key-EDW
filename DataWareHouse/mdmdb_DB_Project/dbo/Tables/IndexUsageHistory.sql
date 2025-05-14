CREATE TABLE [dbo].[IndexUsageHistory] (
    [CaptureDate] DATETIME       NULL,
    [TableName]   NVARCHAR (128) NULL,
    [IndexName]   NVARCHAR (128) NULL,
    [UserSeeks]   BIGINT         NULL,
    [UserScans]   BIGINT         NULL,
    [UserLookups] BIGINT         NULL,
    [UserUpdates] BIGINT         NULL
);
GO


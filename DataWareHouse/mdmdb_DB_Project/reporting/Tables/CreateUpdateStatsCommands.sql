CREATE TABLE [reporting].[CreateUpdateStatsCommands] (
    [CommandID]  INT            IDENTITY (1, 1) NOT NULL,
    [SchemaName] NVARCHAR (255) NULL,
    [TableName]  NVARCHAR (255) NULL,
    [Command]    NVARCHAR (MAX) NULL,
    PRIMARY KEY CLUSTERED ([CommandID] ASC)
);
GO


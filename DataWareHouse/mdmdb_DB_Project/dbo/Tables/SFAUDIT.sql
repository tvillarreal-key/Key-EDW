CREATE TABLE [dbo].[SFAUDIT] (
    [Type]             NVARCHAR (20) NULL,
    [Id]               NVARCHAR (50) NULL,
    [Name]             NVARCHAR (50) NULL,
    [Date]             NVARCHAR (50) NULL,
    [Status]           NVARCHAR (50) NULL,
    [Number]           NVARCHAR (50) NULL,
    [ExtractedToAzure] NVARCHAR (50) NULL,
    [InsertedOn]       DATETIME      NULL,
    [ProcessedFlag]    INT           NULL
);
GO


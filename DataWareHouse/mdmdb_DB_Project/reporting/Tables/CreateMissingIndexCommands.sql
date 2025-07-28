CREATE TABLE [reporting].[CreateMissingIndexCommands] (
    [ViewName]           NVARCHAR (255) NULL,
    [FullName]           NVARCHAR (255) NULL,
    [EqualityColumns]    NVARCHAR (MAX) NULL,
    [InequalityColumns]  NVARCHAR (MAX) NULL,
    [IncludedColumns]    NVARCHAR (MAX) NULL,
    [CreateIndexCommand] NVARCHAR (MAX) NULL
);
GO


CREATE TABLE [reporting].[index_list] (
    [DatabaseName]    NVARCHAR (128) NULL,
    [SchemaName]      NVARCHAR (128) NULL,
    [TableName]       NVARCHAR (128) NULL,
    [IndexName]       NVARCHAR (128) NULL,
    [IndexColumns]    NVARCHAR (MAX) NULL,
    [IncludedColumns] NVARCHAR (MAX) NULL
);
GO


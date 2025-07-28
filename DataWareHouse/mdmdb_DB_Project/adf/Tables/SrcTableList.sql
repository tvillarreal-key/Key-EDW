CREATE TABLE [adf].[SrcTableList] (
    [Id]                INT            IDENTITY (1, 1) NOT NULL,
    [TableName]         NVARCHAR (100) DEFAULT ('Unknown') NULL,
    [SrcAddedDate]      DATE           DEFAULT (getdate()) NULL,
    [SrcUpdatedDate]    DATE           DEFAULT ('2999-12-31') NULL,
    [LastExtractedDate] DATE           DEFAULT ('2999-12-31') NULL,
    [ExtractedFlag]     INT            DEFAULT ('0') NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);
GO


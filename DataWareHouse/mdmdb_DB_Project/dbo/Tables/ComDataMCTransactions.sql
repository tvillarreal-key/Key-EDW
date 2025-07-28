CREATE TABLE [dbo].[ComDataMCTransactions] (
    [RecordType]    NVARCHAR (4)   NOT NULL,
    [TransactionID] NVARCHAR (7)   NOT NULL,
    [RecordData]    NVARCHAR (505) NOT NULL,
    [LoadFile]      NVARCHAR (50)  NOT NULL,
    [DateLoaded]    DATETIME2 (7)  NULL
);
GO


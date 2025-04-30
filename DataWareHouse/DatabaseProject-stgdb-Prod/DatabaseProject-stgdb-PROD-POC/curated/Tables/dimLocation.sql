CREATE TABLE [curated].[dimLocation] (
    [LocationHashKey] NVARCHAR (32)  NOT NULL,
    [LocationChkSum]  NVARCHAR (32)  NOT NULL,
    [Loca_Code]       NVARCHAR (20)  NOT NULL,
    [SourceSystem]    NVARCHAR (50)  NOT NULL,
    [Loca_Name]       NVARCHAR (100) NOT NULL,
    [LastSeenDate]    DATETIME2 (7)  NULL,
    [LoadDate]        DATETIME2 (7)  NOT NULL,
    CONSTRAINT [PK_dimLocation] PRIMARY KEY NONCLUSTERED ([LocationHashKey] ASC)
);


GO


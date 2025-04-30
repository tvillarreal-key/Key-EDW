CREATE TABLE [curated].[dimMktPlace] (
    [MktPlaceHashKey] NVARCHAR (32)  NOT NULL,
    [MktPlaceChkSum]  NVARCHAR (32)  NOT NULL,
    [MktPlace_Code]   NVARCHAR (20)  NULL,
    [SourceSystem]    NVARCHAR (50)  NOT NULL,
    [MktPlace_Name]   NVARCHAR (100) NULL,
    [LoadDate]        DATETIME2 (7)  NOT NULL,
    CONSTRAINT [PK_dimMktPlace] PRIMARY KEY NONCLUSTERED ([MktPlaceHashKey] ASC)
);


GO


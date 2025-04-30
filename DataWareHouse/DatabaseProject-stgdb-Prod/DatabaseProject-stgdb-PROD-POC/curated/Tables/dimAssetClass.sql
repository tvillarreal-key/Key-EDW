CREATE TABLE [curated].[dimAssetClass] (
    [ClassHashKey] NVARCHAR (32)  NOT NULL,
    [ClassChkSum]  NVARCHAR (32)  NOT NULL,
    [Class_Code]   NVARCHAR (20)  NOT NULL,
    [SourceSystem] NVARCHAR (50)  NOT NULL,
    [Class_Name]   NVARCHAR (255) NULL,
    [LoadDate]     DATETIME2 (7)  NOT NULL,
    CONSTRAINT [PK_dimAssetClass2] PRIMARY KEY NONCLUSTERED ([ClassHashKey] ASC)
);


GO


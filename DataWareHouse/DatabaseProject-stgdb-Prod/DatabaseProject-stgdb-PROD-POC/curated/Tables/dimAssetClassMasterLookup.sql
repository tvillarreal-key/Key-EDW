CREATE TABLE [curated].[dimAssetClassMasterLookup] (
    [ClassKey]   NVARCHAR (3)   NOT NULL,
    [Class_Code] NVARCHAR (20)  NOT NULL,
    [Class_Name] NVARCHAR (255) NULL,
    [LoadDate]   DATETIME2 (7)  NOT NULL,
    CONSTRAINT [PK_dimAssetClass] PRIMARY KEY NONCLUSTERED ([ClassKey] ASC)
);


GO


CREATE TABLE [curated].[dimAssetStatus] (
    [StatusHashKey] NVARCHAR (32)  NOT NULL,
    [StatusChkSum]  NVARCHAR (32)  NOT NULL,
    [Status_Code]   NVARCHAR (20)  NOT NULL,
    [SourceSystem]  NVARCHAR (50)  NOT NULL,
    [Status_Name]   NVARCHAR (255) NULL,
    [LoadDate]      DATETIME2 (7)  NOT NULL,
    CONSTRAINT [PK_dimAssetStatus] PRIMARY KEY NONCLUSTERED ([StatusHashKey] ASC)
);


GO


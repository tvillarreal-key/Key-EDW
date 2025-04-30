CREATE TABLE [curated].[dimLOB] (
    [LOBHashKey]   NVARCHAR (32)  NOT NULL,
    [LOBChkSum]    NVARCHAR (32)  NOT NULL,
    [LOB_Key_Code] NVARCHAR (500) NOT NULL,
    [SourceSystem] NVARCHAR (50)  NOT NULL,
    [Yard_Code]    NVARCHAR (20)  NULL,
    [Yard_Name]    NVARCHAR (100) NULL,
    [Lvl1_Code]    NVARCHAR (20)  NULL,
    [Lvl1_Name]    NVARCHAR (100) NULL,
    [Lob_Code]     NVARCHAR (20)  NULL,
    [Lob_Name]     NVARCHAR (100) NULL,
    [LoadDate]     DATETIME2 (7)  NOT NULL,
    CONSTRAINT [PK_dimLOB] PRIMARY KEY NONCLUSTERED ([LOBHashKey] ASC)
);


GO


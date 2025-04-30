CREATE TABLE [curated].[dimYard] (
    [YardHashKey]  NVARCHAR (32)  NOT NULL,
    [YardChkSum]   NVARCHAR (32)  NOT NULL,
    [Yard_Code]    NVARCHAR (20)  NULL,
    [SourceSystem] NVARCHAR (50)  NOT NULL,
    [Yard_Name]    NVARCHAR (100) NULL,
    [LoadDate]     DATETIME2 (7)  NOT NULL,
    CONSTRAINT [PK_dimYard] PRIMARY KEY NONCLUSTERED ([YardHashKey] ASC)
);


GO


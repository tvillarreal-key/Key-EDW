CREATE TABLE [curated].[dimChildRelType] (
    [Dim_ChildRelType_Id]     INT          DEFAULT (NEXT VALUE FOR [curated].[Seq_DimChildRelType_Id]) NOT NULL,
    [Child_Relationship_Type] VARCHAR (50) NOT NULL,
    [LoadDate]                DATETIME     NOT NULL,
    CONSTRAINT [PK_dimChildRelType] PRIMARY KEY NONCLUSTERED ([Dim_ChildRelType_Id] ASC),
    CONSTRAINT [UK_dimChildRelType] UNIQUE NONCLUSTERED ([Child_Relationship_Type] ASC)
);


GO


DROP TABLE curated.dimChildRelType;
GO
CREATE TABLE curated.dimChildRelType (
    Dim_ChildRelType_Id INT NOT NULL DEFAULT (NEXT VALUE FOR curated.Seq_DimChildRelType_Id),
    Child_Relationship_Type VARCHAR(50) NOT NULL,
    LoadDate DATETIME NOT NULL,
    CONSTRAINT PK_dimChildRelType PRIMARY KEY NONCLUSTERED (Dim_ChildRelType_Id ASC) ON [PRIMARY],
    CONSTRAINT UK_dimChildRelType UNIQUE NONCLUSTERED (Child_Relationship_Type ASC) ON [PRIMARY]
) ON [PRIMARY];
GO

INSERT INTO curated.dimChildRelType (Dim_ChildRelType_Id, Child_Relationship_Type, LoadDate)
SELECT NEXT VALUE FOR curated.Seq_DimChildRelType_Id, [Child_Relationship_Type], GETDATE()
FROM [staging].[MDM_Assets]
WHERE [Child_Relationship_Type] IS NOT NULL
GROUP BY [Child_Relationship_Type];

SELECT *
FROM curated.dimChildRelType;


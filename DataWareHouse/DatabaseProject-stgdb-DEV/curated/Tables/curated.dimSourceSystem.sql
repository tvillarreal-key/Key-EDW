DROP TABLE curated.dimSourceSystem;
GO
CREATE TABLE curated.dimSourceSystem (
    DimSourceSystemId INT NOT NULL,
    SourceSystemName VARCHAR(50) NOT NULL,
    LoadDate DATETIME NOT NULL,
) ON [PRIMARY];
GO

INSERT INTO curated.dimSourceSystem (DimSourceSystemId, SourceSystemName, LoadDate)
SELECT DISTINCT 1 as SourceSystemID , SourceSystem, getdate() as LoadDate
  FROM [staging].[MDM_Assets]
UNION
SELECT DISTINCT 2 as SourceSystemID, SourceSystem, getdate() as LoadDate
  FROM [staging].[MDM_AssetAttr];

SELECT *
FROM curated.dimSourceSystem;




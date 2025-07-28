DROP TABLE datamart.dimSourceSystem;
GO
CREATE TABLE datamart.dimSourceSystem (
    DimSourceSystemId INT NOT NULL,
    SourceSystemName VARCHAR(50) NOT NULL,
    LoadDate DATETIME NOT NULL,
) ON [PRIMARY];
GO

SELECT *
FROM datamart.dimSourceSystem;




SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
DROP TABLE IF EXISTS [dataquality].[DQ_Rules] 
GO
CREATE TABLE [dataquality].[DQ_Rules]  (
    ID INT IDENTITY(1,1),
    RuleName VARCHAR(255),
    RuleType VARCHAR(255),
    DatabaseName VARCHAR(255),
    SchemaName VARCHAR(255),
    TableName VARCHAR(255),
    ColumnName VARCHAR(255),
    RuleDefinition VARCHAR(255),
    ExpectedResult INT,
    IsActive INT,
    Severity INT
);

INSERT INTO [dataquality].[DQ_Rules] (RuleName, RuleType, DatabaseName, SchemaName, TableName, ColumnName, RuleDefinition, ExpectedResult, IsActive, Severity)
VALUES 
('ID Null Check', 'Null Check', 'stgdb-DEV', 'staging', 'MDM_Assets', 'Asset_Num', 'ID IS NULL', 0, 1, 2),
('Asset_Desc Null Check', 'Null Check', 'stgdb-DEV', 'staging', 'MDM_Assets', 'Asset_Desc', 'Asset_Desc IS NULL', 0, 1, 2),
('Asset_Class Null Check', 'Null Check', 'stgdb-DEV', 'staging', 'MDM_Assets', 'Asset_Class', 'Asset_Class IS NULL', 0, 1, 2),
('ID Is Numeric Check', 'Numeric Check', 'stgdb-DEV', 'staging', 'MDM_Assets', 'Asset_Num', 'ISNUMERIC(ID) = 0', 0, 1, 2);

 SELECT
 *
 FROM [dataquality].[DQ_Rules];

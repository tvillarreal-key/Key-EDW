SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
DROP TABLE IF EXISTS [dataquality].[ColumnRuleControl] 
GO
CREATE TABLE [dataquality].[ColumnRuleControl]
(
    DatabaseName NVARCHAR(128),
    SchemaName NVARCHAR(128),
    TableName NVARCHAR(128),
    ColumnName NVARCHAR(128),
    IsNullable NVARCHAR(3),
    MaxLength INT,
    RuleID INT,
    RuleName VARCHAR(255),
    RuleDefinition TEXT,
    ExpectedResult VARCHAR(255),
    IsActive BIT DEFAULT 1,
    Severity INT
) ON [PRIMARY] 
GO
SET ANSI_PADDING ON
GO

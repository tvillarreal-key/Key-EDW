SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
DROP TABLE IF EXISTS [dataquality].[DQ_Rules]
GO
CREATE TABLE [dataquality].[DQ_Rules](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[RuleName] [varchar](255) NULL,
	[RuleType] [varchar](255) NULL,
	[DatabaseName] [varchar](255) NULL,
	[SchemaName] [varchar](255) NULL,
	[TableName] [varchar](255) NULL,
	[ColumnName] [varchar](255) NULL,
	[RuleDefinition] [varchar](255) NULL,
	[ExpectedResult] [int] NULL,
	[IsActive] [int] NULL,
	[Severity] [int] NULL,
    [LoadDate] DATETIME2 DEFAULT GETDATE()
) ON [PRIMARY]
GO


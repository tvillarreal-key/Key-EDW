CREATE TABLE [dataquality].[ColumnRuleControl] (
    [DatabaseName]   NVARCHAR (128) NULL,
    [SchemaName]     NVARCHAR (128) NULL,
    [TableName]      NVARCHAR (128) NULL,
    [ColumnName]     NVARCHAR (128) NULL,
    [IsNullable]     NVARCHAR (3)   NULL,
    [MaxLength]      INT            NULL,
    [RuleID]         INT            NULL,
    [RuleName]       VARCHAR (255)  NULL,
    [RuleDefinition] TEXT           NULL,
    [ExpectedResult] VARCHAR (255)  NULL,
    [IsActive]       BIT            DEFAULT ((1)) NULL,
    [Severity]       INT            NULL
);


GO


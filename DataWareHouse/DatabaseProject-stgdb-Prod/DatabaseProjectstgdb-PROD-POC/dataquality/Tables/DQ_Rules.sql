CREATE TABLE [dataquality].[DQ_Rules] (
    [ID]             INT           IDENTITY (1, 1) NOT NULL,
    [RuleName]       VARCHAR (255) NULL,
    [RuleType]       VARCHAR (255) NULL,
    [DatabaseName]   VARCHAR (255) NULL,
    [SchemaName]     VARCHAR (255) NULL,
    [TableName]      VARCHAR (255) NULL,
    [ColumnName]     VARCHAR (255) NULL,
    [RuleDefinition] VARCHAR (255) NULL,
    [ExpectedResult] INT           NULL,
    [IsActive]       INT           NULL,
    [Severity]       INT           NULL,
    [LoadDate]       DATETIME2 (7) DEFAULT (getdate()) NULL
);


GO


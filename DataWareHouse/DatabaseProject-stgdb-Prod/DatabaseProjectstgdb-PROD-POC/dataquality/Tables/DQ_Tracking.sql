CREATE TABLE [dataquality].[DQ_Tracking] (
    [Tracking_ID]    INT            IDENTITY (1, 1) NOT NULL,
    [KeyField]       NVARCHAR (128) NOT NULL,
    [LoadDate]       DATETIME2 (7)  NOT NULL,
    [RuleID]         INT            NOT NULL,
    [RuleName]       NVARCHAR (255) NOT NULL,
    [RuleType]       NVARCHAR (255) NULL,
    [DatabaseName]   NVARCHAR (128) NULL,
    [SchemaName]     NVARCHAR (128) NULL,
    [TableName]      NVARCHAR (128) NULL,
    [ColumnName]     NVARCHAR (128) NULL,
    [RuleDefinition] NVARCHAR (128) NULL,
    [Severity]       INT            NULL,
    [Process_Dt]     DATETIME2 (7)  NOT NULL
);


GO


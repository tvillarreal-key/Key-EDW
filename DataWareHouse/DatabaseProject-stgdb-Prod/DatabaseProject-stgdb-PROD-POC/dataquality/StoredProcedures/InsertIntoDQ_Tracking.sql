CREATE PROCEDURE [dataquality].[InsertIntoDQ_Tracking]
    @KeyField NVARCHAR(128),
    @LoadDate DATETIME2,
    @RuleID INT,
    @RuleName NVARCHAR(255),
    @RuleType NVARCHAR(255) = NULL,
    @DatabaseName NVARCHAR(128) = NULL,
    @SchemaName NVARCHAR(128) = NULL,
    @TableName NVARCHAR(128) = NULL,
    @ColumnName NVARCHAR(128) = NULL,
    @RuleDefinition NVARCHAR(128) = NULL,
    @Severity INT = NULL,
    @Process_Dt DATETIME2
AS
BEGIN
    INSERT INTO [dataquality].[DQ_Tracking]
    (
        KeyField,
        LoadDate,
        RuleID,
        RuleName,
        RuleType,
        DatabaseName,
        SchemaName,
        TableName,
        ColumnName,
        RuleDefinition,
        Severity,
        Process_Dt
    )
    VALUES
    (
        @KeyField,
        @LoadDate,
        @RuleID,
        @RuleName,
        @RuleType,
        @DatabaseName,
        @SchemaName,
        @TableName,
        @ColumnName,
        @RuleDefinition,
        @Severity,
        @Process_Dt
    )
END

GO


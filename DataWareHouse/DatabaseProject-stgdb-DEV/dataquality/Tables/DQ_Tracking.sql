SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
DROP TABLE IF EXISTS [dataquality].[DQ_Tracking] 
GO
CREATE TABLE [dataquality].[DQ_Tracking]
(
    DatabaseName NVARCHAR(128),
    SchemaName NVARCHAR(128),
    TableName NVARCHAR(128),
    ColumnName NVARCHAR(128),
	KeyColName NVARCHAR(128),
    RuleID INT,
    DQ_Result  NVARCHAR(128),
    DQ_Process_Dt DATETIME2
) ON [PRIMARY] 
GO
SET ANSI_PADDING ON
GO

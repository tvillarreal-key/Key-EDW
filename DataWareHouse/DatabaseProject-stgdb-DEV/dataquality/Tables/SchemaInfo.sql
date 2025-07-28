SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
DROP TABLE IF EXISTS [dataquality].[SchemaInfo] 
GO
CREATE TABLE [dataquality].[SchemaInfo]
(
    DatabaseName NVARCHAR(128),
    SchemaName NVARCHAR(128),
    TableName NVARCHAR(128),
    ColumnName NVARCHAR(128),
    DataType NVARCHAR(128),
    IsNullable NVARCHAR(3),
    MaxLength INT,
    NumericPrecision INT,
    NumericScale INT,
    DefaultValue NVARCHAR(128),
    LoadDate DATETIME2
    );
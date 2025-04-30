CREATE TABLE [dataquality].[SchemaInfo] (
    [DatabaseName]     NVARCHAR (128) NULL,
    [SchemaName]       NVARCHAR (128) NULL,
    [TableName]        NVARCHAR (128) NULL,
    [ColumnName]       NVARCHAR (128) NULL,
    [DataType]         NVARCHAR (128) NULL,
    [IsNullable]       NVARCHAR (3)   NULL,
    [MaxLength]        INT            NULL,
    [NumericPrecision] INT            NULL,
    [NumericScale]     INT            NULL,
    [DefaultValue]     NVARCHAR (128) NULL,
    [LoadDate]         DATETIME2 (7)  NULL
);


GO


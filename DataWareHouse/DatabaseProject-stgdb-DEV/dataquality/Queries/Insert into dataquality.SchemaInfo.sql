INSERT INTO [dataquality].[SchemaInfo]
(
    DatabaseName,
    SchemaName,
    TableName,
    ColumnName,
    DataType,
    IsNullable,
    MaxLength,
    NumericPrecision,
    NumericScale,
    DefaultValue
)
SELECT 
    table_catalog AS "Database",
    table_schema AS "Schema",
    table_name AS "Table",
    column_name AS "Column",
    data_type AS "Data Type",
    is_nullable AS "Is Nullable",
    character_maximum_length AS "Max Length",
    numeric_precision AS "Numeric Precision",
    numeric_scale AS "Numeric Scale",
    column_default AS "Default Value"
FROM 
    information_schema.columns
WHERE 
    table_schema = 'staging'
ORDER BY 
    table_name, 
    ordinal_position;
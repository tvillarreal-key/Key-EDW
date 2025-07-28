CREATE TABLE reporting.UpdateStatisticsCommands (
    SchemaName NVARCHAR(255),
    TableName NVARCHAR(255),
    Command NVARCHAR(MAX)
);

DECLARE @schemaName NVARCHAR(255);
DECLARE @tableName NVARCHAR(255);
DECLARE @sql NVARCHAR(MAX);

-- Declare a cursor to iterate over all schemas and tables in the database, sorted by schema and table name
DECLARE table_cursor CURSOR FOR
SELECT TABLE_SCHEMA, TABLE_NAME
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_TYPE = 'BASE TABLE'
ORDER BY TABLE_SCHEMA, TABLE_NAME;

-- Open the cursor
OPEN table_cursor;
FETCH NEXT FROM table_cursor INTO @schemaName, @tableName;

-- Loop through all tables
WHILE @@FETCH_STATUS = 0
BEGIN
    -- Generate the UPDATE STATISTICS command for the current table
    SET @sql = 'UPDATE STATISTICS ' + @schemaName + '.' + @tableName + ';';

    -- Insert the command into the reporting.UpdateStatisticsCommands table
    INSERT INTO reporting.UpdateStatisticsCommands (SchemaName, TableName, Command)
    VALUES (@schemaName, @tableName, @sql);

    -- Fetch the next table
    FETCH NEXT FROM table_cursor INTO @schemaName, @tableName;
END;

-- Close and deallocate the cursor
CLOSE table_cursor;
DEALLOCATE table_cursor;

SELECT Command
FROM reporting.UpdateStatisticsCommands
--WHERE SchemaName In ('reporting', 'dbo')
ORDER BY 1
;

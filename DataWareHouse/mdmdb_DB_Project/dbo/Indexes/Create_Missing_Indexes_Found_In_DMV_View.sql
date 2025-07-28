/* CREATE TABLE reporting.CreateMissingIndexCommands (
    ViewName NVARCHAR(255),
    FullName NVARCHAR(255),
    EqualityColumns NVARCHAR(MAX),
    InequalityColumns NVARCHAR(MAX),
    IncludedColumns NVARCHAR(MAX),
    CreateIndexCommand NVARCHAR(MAX)
);
*/

DELETE
FROM reporting.CreateMissingIndexCommands

DECLARE @viewName NVARCHAR(255);
DECLARE @fullName NVARCHAR(255);
DECLARE @equalityColumns NVARCHAR(MAX);
DECLARE @inequalityColumns NVARCHAR(MAX);
DECLARE @includedColumns NVARCHAR(MAX);
DECLARE @createIndexCommand NVARCHAR(MAX);

-- Declare a cursor to iterate over the results of the provided query
DECLARE index_cursor CURSOR FOR
SELECT 
    v.name AS view_name,
    CONCAT(sed.referenced_schema_name, '.', t.name) AS full_nm,
    mid.equality_columns,
    mid.inequality_columns,
    mid.included_columns
FROM 
    sys.views v
INNER JOIN 
    sys.sql_expression_dependencies sed ON v.object_id = sed.referencing_id
INNER JOIN 
    sys.tables t ON sed.referenced_id = t.object_id
INNER JOIN 
    sys.dm_db_missing_index_details mid ON t.object_id = mid.object_id
INNER JOIN 
    sys.dm_db_missing_index_groups mig ON mid.index_handle = mig.index_handle
INNER JOIN 
    sys.dm_db_missing_index_group_stats migs ON mig.index_group_handle = migs.group_handle
ORDER BY 
    2, 3, 4, 5;

-- Open the cursor
OPEN index_cursor;
FETCH NEXT FROM index_cursor INTO @viewName, @fullName, @equalityColumns, @inequalityColumns, @includedColumns;

-- Loop through all results
WHILE @@FETCH_STATUS = 0
BEGIN
    -- Initialize the CREATE INDEX command
    SET @createIndexCommand = 'CREATE INDEX IX_' + REPLACE(@fullName, '.', '_') + ' ON ' + @fullName + ' (';

    -- Add equality columns if they exist
    IF @equalityColumns IS NOT NULL AND LEN(@equalityColumns) > 0
    BEGIN
        SET @createIndexCommand = @createIndexCommand + @equalityColumns;
    END

    -- Add inequality columns if they exist
    IF @inequalityColumns IS NOT NULL AND LEN(@inequalityColumns) > 0
    BEGIN
        IF LEN(@createIndexCommand) > LEN('CREATE INDEX IX_' + REPLACE(@fullName, '.', '_') + ' ON ' + @fullName + ' (')
        BEGIN
            SET @createIndexCommand = @createIndexCommand + ', ';
        END
        SET @createIndexCommand = @createIndexCommand + @inequalityColumns;
    END

    -- Close the column list
    SET @createIndexCommand = @createIndexCommand + ')';

    -- Add included columns if they exist
    IF @includedColumns IS NOT NULL AND LEN(@includedColumns) > 0
    BEGIN
        SET @createIndexCommand = @createIndexCommand + ' INCLUDE (' + @includedColumns + ')';
    END

    -- Complete the command
    SET @createIndexCommand = @createIndexCommand + ';';

    -- Insert the command into the reporting.CreateMissingIndexCommands table
    INSERT INTO reporting.CreateMissingIndexCommands (ViewName, FullName, EqualityColumns, InequalityColumns, IncludedColumns, CreateIndexCommand)
    VALUES (@viewName, @fullName, @equalityColumns, @inequalityColumns, @includedColumns, @createIndexCommand);

    -- Fetch the next result
    FETCH NEXT FROM index_cursor INTO @viewName, @fullName, @equalityColumns, @inequalityColumns, @includedColumns;
END;

-- Close and deallocate the cursor
CLOSE index_cursor;
DEALLOCATE index_cursor;


-- 59; 7 distinct 
SELECT DISTINCT CreateIndexCommand
FROM reporting.CreateMissingIndexCommands
;


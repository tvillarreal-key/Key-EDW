DECLARE @RC int
DECLARE @DatabaseName nvarchar(128)
DECLARE @SchemaName nvarchar(128)

-- TODO: Set parameter values here.

EXECUTE @RC = [curated].[sp_GetTableInfo] 
GO
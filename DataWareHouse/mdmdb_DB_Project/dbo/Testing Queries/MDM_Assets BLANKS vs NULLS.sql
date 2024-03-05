--============================
DECLARE @NullCount TABLE (ColumnName NVARCHAR(128), NullCount INT);

INSERT INTO @NullCount
SELECT 'id' AS 'COLNAME', COUNT(*) AS 'COUNT' FROM dbo.MDM_Assets2 WHERE id IS NULL
UNION ALL
SELECT 'asset_num', COUNT(*) FROM dbo.MDM_Assets2 WHERE asset_num IS NULL 
UNION ALL
SELECT 'asset_desc', COUNT(*) FROM dbo.MDM_Assets2 WHERE asset_desc IS NULL 
UNION ALL
SELECT 'asset_class', COUNT(*) FROM dbo.MDM_Assets2 WHERE asset_class IS NULL 
UNION ALL
SELECT 'manufacturer', COUNT(*) FROM dbo.MDM_Assets2 WHERE manufacturer IS NULL 
UNION ALL
SELECT 'model', COUNT(*) FROM dbo.MDM_Assets2 WHERE model IS NULL 
UNION ALL
SELECT 'model_year', COUNT(*) FROM dbo.MDM_Assets2 WHERE model_year IS NULL 
UNION ALL
SELECT 'series', COUNT(*) FROM dbo.MDM_Assets2 WHERE series IS NULL 
UNION ALL
SELECT 'serial_num', COUNT(*) FROM dbo.MDM_Assets2 WHERE serial_num IS NULL 
UNION ALL
SELECT 'status', COUNT(*) FROM dbo.MDM_Assets2 WHERE [status] IS NULL 
UNION ALL
SELECT 'status_desc', COUNT(*) FROM dbo.MDM_Assets2 WHERE status_desc IS NULL 
-- Repeat for all columns
UNION ALL
SELECT 'source', COUNT(*) FROM dbo.MDM_Assets2 WHERE source IS NULL
UNION ALL
SELECT 'marketed', COUNT(*) FROM dbo.MDM_Assets2 WHERE marketed IS NULL
UNION ALL
SELECT 'revenue_track', COUNT(*) FROM dbo.MDM_Assets2 WHERE revenue_track IS NULL
UNION ALL
SELECT 'parent_asset_num', COUNT(*) FROM dbo.MDM_Assets2 WHERE parent_asset_num IS NULL
UNION ALL
SELECT 'child_relationship_type', COUNT(*) FROM dbo.MDM_Assets2 WHERE child_relationship_type IS NULL
UNION ALL
SELECT 'loco_code', COUNT(*) FROM dbo.MDM_Assets2 WHERE loco_code IS NULL
UNION ALL
SELECT 'loco_name', COUNT(*) FROM dbo.MDM_Assets2 WHERE loco_name IS NULL
UNION ALL
SELECT 'loca_code', COUNT(*) FROM dbo.MDM_Assets2 WHERE loca_code IS NULL
UNION ALL
SELECT 'loca_name', COUNT(*) FROM dbo.MDM_Assets2 WHERE loca_name IS NULL
UNION ALL
SELECT 'mktp_code', COUNT(*) FROM dbo.MDM_Assets2 WHERE mktp_code IS NULL
UNION ALL
SELECT 'mktp_name', COUNT(*) FROM dbo.MDM_Assets2 WHERE mktp_name IS NULL
UNION ALL
SELECT 'lvl1_code', COUNT(*) FROM dbo.MDM_Assets2 WHERE lvl1_code IS NULL
UNION ALL
SELECT 'lvl1_name', COUNT(*) FROM dbo.MDM_Assets2 WHERE lvl1_name IS NULL
UNION ALL
SELECT 'lob_code', COUNT(*) FROM dbo.MDM_Assets2 WHERE lob_code IS NULL
UNION ALL
SELECT 'lob_name', COUNT(*) FROM dbo.MDM_Assets2 WHERE lob_name IS NULL
UNION ALL
SELECT 'dist_code', COUNT(*) FROM dbo.MDM_Assets2 WHERE dist_code IS NULL
UNION ALL
SELECT 'dist_name', COUNT(*) FROM dbo.MDM_Assets2 WHERE dist_name IS NULL
UNION ALL
SELECT 'mare_code', COUNT(*) FROM dbo.MDM_Assets2 WHERE mare_code IS NULL
UNION ALL
SELECT 'mare_name', COUNT(*) FROM dbo.MDM_Assets2 WHERE mare_name IS NULL
UNION ALL
SELECT 'yard_code', COUNT(*) FROM dbo.MDM_Assets2 WHERE yard_code IS NULL
UNION ALL
SELECT 'yard_name', COUNT(*) FROM dbo.MDM_Assets2 WHERE yard_name IS NULL
UNION ALL
SELECT 'W_Status', COUNT(*) FROM dbo.MDM_Assets2 WHERE W_Status IS NULL
UNION ALL
SELECT 'Crew_Needed', COUNT(*) FROM dbo.MDM_Assets2 WHERE Crew_Needed IS NULL
UNION ALL
SELECT 'Avail_Date', COUNT(*) FROM dbo.MDM_Assets2 WHERE Avail_Date IS NULL
UNION ALL
SELECT 'LastWT_Date', COUNT(*) FROM dbo.MDM_Assets2 WHERE LastWT_Date IS NULL
UNION ALL
SELECT 'Mod_Date', COUNT(*) FROM dbo.MDM_Assets2 WHERE Mod_Date IS NULL
UNION ALL
SELECT 'Mod_User', COUNT(*) FROM dbo.MDM_Assets2 WHERE Mod_User IS NULL
UNION ALL
SELECT 'Note', COUNT(*) FROM dbo.MDM_Assets2 WHERE Note IS NULL
UNION ALL
SELECT 'Customer', COUNT(*) FROM dbo.MDM_Assets2 WHERE Customer IS NULL
UNION ALL
SELECT 'JobType', COUNT(*) FROM dbo.MDM_Assets2 WHERE JobType IS NULL
UNION ALL
SELECT 'Supervisor', COUNT(*) FROM dbo.MDM_Assets2 WHERE Supervisor IS NULL
UNION ALL
SELECT 'Operator', COUNT(*) FROM dbo.MDM_Assets2 WHERE Operator IS NULL
UNION ALL
SELECT 'Directions', COUNT(*) FROM dbo.MDM_Assets2 WHERE Directions IS NULL
UNION ALL
SELECT 'CompanyMan', COUNT(*) FROM dbo.MDM_Assets2 WHERE CompanyMan IS NULL
UNION ALL
SELECT 'CompanyManPhone', COUNT(*) FROM dbo.MDM_Assets2 WHERE CompanyManPhone IS NULL
UNION ALL
SELECT 'Daylight24HR', COUNT(*) FROM dbo.MDM_Assets2 WHERE Daylight24HR IS NULL
UNION ALL
SELECT 'Size', COUNT(*) FROM dbo.MDM_Assets2 WHERE Size IS NULL
UNION ALL
SELECT 'UsedByRigYard', COUNT(*) FROM dbo.MDM_Assets2 WHERE UsedByRigYard IS NULL
UNION ALL
SELECT 'UsedByRigNum', COUNT(*) FROM dbo.MDM_Assets2 WHERE UsedByRigNum IS NULL
UNION ALL
SELECT 'Source_LastUpdateDate', COUNT(*) FROM dbo.MDM_Assets2 WHERE Source_LastUpdateDate IS NULL
UNION ALL
SELECT 'Source_LastUpdateBy', COUNT(*) FROM dbo.MDM_Assets2 WHERE Source_LastUpdateBy IS NULL;

SELECT * FROM @NullCount;

--============================
DECLARE @BlankCount TABLE (ColumnName NVARCHAR(128), BlankCount INT);

INSERT INTO @BlankCount
SELECT 'id' AS 'COLNAME', COUNT(*) AS 'COUNT' FROM dbo.MDM_Assets2 WHERE id = ''
UNION ALL
SELECT 'asset_num', COUNT(*) FROM dbo.MDM_Assets2 WHERE asset_num = '' 
UNION ALL
SELECT 'asset_desc', COUNT(*) FROM dbo.MDM_Assets2 WHERE asset_desc = '' 
UNION ALL
SELECT 'asset_class', COUNT(*) FROM dbo.MDM_Assets2 WHERE asset_class = '' 
UNION ALL
SELECT 'manufacturer', COUNT(*) FROM dbo.MDM_Assets2 WHERE manufacturer = '' 
UNION ALL
SELECT 'model', COUNT(*) FROM dbo.MDM_Assets2 WHERE model = '' 
UNION ALL
SELECT 'model_year', COUNT(*) FROM dbo.MDM_Assets2 WHERE model_year = '' 
UNION ALL
SELECT 'series', COUNT(*) FROM dbo.MDM_Assets2 WHERE series = '' 
UNION ALL
SELECT 'serial_num', COUNT(*) FROM dbo.MDM_Assets2 WHERE serial_num = '' 
UNION ALL
SELECT 'status', COUNT(*) FROM dbo.MDM_Assets2 WHERE [status] = '' 
UNION ALL
SELECT 'status_desc', COUNT(*) FROM dbo.MDM_Assets2 WHERE status_desc = '' 
-- Repeat for all columns
UNION ALL
SELECT 'source', COUNT(*) FROM dbo.MDM_Assets2 WHERE source = ''
UNION ALL
SELECT 'marketed', COUNT(*) FROM dbo.MDM_Assets2 WHERE marketed = ''
UNION ALL
SELECT 'revenue_track', COUNT(*) FROM dbo.MDM_Assets2 WHERE revenue_track = ''
UNION ALL
SELECT 'parent_asset_num', COUNT(*) FROM dbo.MDM_Assets2 WHERE parent_asset_num = ''
UNION ALL
SELECT 'child_relationship_type', COUNT(*) FROM dbo.MDM_Assets2 WHERE child_relationship_type = ''
UNION ALL
SELECT 'loco_code', COUNT(*) FROM dbo.MDM_Assets2 WHERE loco_code = ''
UNION ALL
SELECT 'loco_name', COUNT(*) FROM dbo.MDM_Assets2 WHERE loco_name = ''
UNION ALL
SELECT 'loca_code', COUNT(*) FROM dbo.MDM_Assets2 WHERE loca_code = ''
UNION ALL
SELECT 'loca_name', COUNT(*) FROM dbo.MDM_Assets2 WHERE loca_name = ''
UNION ALL
SELECT 'mktp_code', COUNT(*) FROM dbo.MDM_Assets2 WHERE mktp_code = ''
UNION ALL
SELECT 'mktp_name', COUNT(*) FROM dbo.MDM_Assets2 WHERE mktp_name = ''
UNION ALL
SELECT 'lvl1_code', COUNT(*) FROM dbo.MDM_Assets2 WHERE lvl1_code = ''
UNION ALL
SELECT 'lvl1_name', COUNT(*) FROM dbo.MDM_Assets2 WHERE lvl1_name = ''
UNION ALL
SELECT 'lob_code', COUNT(*) FROM dbo.MDM_Assets2 WHERE lob_code = ''
UNION ALL
SELECT 'lob_name', COUNT(*) FROM dbo.MDM_Assets2 WHERE lob_name = ''
UNION ALL
SELECT 'dist_code', COUNT(*) FROM dbo.MDM_Assets2 WHERE dist_code = ''
UNION ALL
SELECT 'dist_name', COUNT(*) FROM dbo.MDM_Assets2 WHERE dist_name = ''
UNION ALL
SELECT 'mare_code', COUNT(*) FROM dbo.MDM_Assets2 WHERE mare_code = ''
UNION ALL
SELECT 'mare_name', COUNT(*) FROM dbo.MDM_Assets2 WHERE mare_name = ''
UNION ALL
SELECT 'yard_code', COUNT(*) FROM dbo.MDM_Assets2 WHERE yard_code = ''
UNION ALL
SELECT 'yard_name', COUNT(*) FROM dbo.MDM_Assets2 WHERE yard_name = ''
UNION ALL
SELECT 'W_Status', COUNT(*) FROM dbo.MDM_Assets2 WHERE W_Status = ''
UNION ALL
SELECT 'Crew_Needed', COUNT(*) FROM dbo.MDM_Assets2 WHERE Crew_Needed = ''
UNION ALL
SELECT 'Avail_Date', COUNT(*) FROM dbo.MDM_Assets2 WHERE Avail_Date = ''
UNION ALL
SELECT 'LastWT_Date', COUNT(*) FROM dbo.MDM_Assets2 WHERE LastWT_Date = ''
UNION ALL
SELECT 'Mod_Date', COUNT(*) FROM dbo.MDM_Assets2 WHERE Mod_Date = ''
UNION ALL
SELECT 'Mod_User', COUNT(*) FROM dbo.MDM_Assets2 WHERE Mod_User = ''
UNION ALL
SELECT 'Note', COUNT(*) FROM dbo.MDM_Assets2 WHERE Note = ''
UNION ALL
SELECT 'Customer', COUNT(*) FROM dbo.MDM_Assets2 WHERE Customer = ''
UNION ALL
SELECT 'JobType', COUNT(*) FROM dbo.MDM_Assets2 WHERE JobType = ''
UNION ALL
SELECT 'Supervisor', COUNT(*) FROM dbo.MDM_Assets2 WHERE Supervisor = ''
UNION ALL
SELECT 'Operator', COUNT(*) FROM dbo.MDM_Assets2 WHERE Operator = ''
UNION ALL
SELECT 'Directions', COUNT(*) FROM dbo.MDM_Assets2 WHERE Directions = ''
UNION ALL
SELECT 'CompanyMan', COUNT(*) FROM dbo.MDM_Assets2 WHERE CompanyMan = ''
UNION ALL
SELECT 'CompanyManPhone', COUNT(*) FROM dbo.MDM_Assets2 WHERE CompanyManPhone = ''
UNION ALL
SELECT 'Daylight24HR', COUNT(*) FROM dbo.MDM_Assets2 WHERE Daylight24HR = ''
UNION ALL
SELECT 'Size', COUNT(*) FROM dbo.MDM_Assets2 WHERE Size = ''
UNION ALL
SELECT 'UsedByRigYard', COUNT(*) FROM dbo.MDM_Assets2 WHERE UsedByRigYard = ''
UNION ALL
SELECT 'UsedByRigNum', COUNT(*) FROM dbo.MDM_Assets2 WHERE UsedByRigNum = ''
UNION ALL
SELECT 'Source_LastUpdateDate', COUNT(*) FROM dbo.MDM_Assets2 WHERE Source_LastUpdateDate = ''
UNION ALL
SELECT 'Source_LastUpdateBy', COUNT(*) FROM dbo.MDM_Assets2 WHERE Source_LastUpdateBy = '';

SELECT * FROM @BlankCount;



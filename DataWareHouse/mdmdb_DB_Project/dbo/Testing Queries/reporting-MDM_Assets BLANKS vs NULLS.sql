--============================
DECLARE @NullCount TABLE (ColumnName NVARCHAR(128), NullCount INT);

INSERT INTO @NullCount
SELECT 'asset_id' AS 'COLNAME', COUNT(*) AS 'COUNT' FROM reporting.MDM_Assets WHERE asset_id IS NULL
UNION ALL
SELECT 'asset_num', COUNT(*) FROM reporting.MDM_Assets WHERE asset_num IS NULL 
UNION ALL
SELECT 'asset_desc', COUNT(*) FROM reporting.MDM_Assets WHERE asset_desc IS NULL 
UNION ALL
SELECT 'asset_class', COUNT(*) FROM reporting.MDM_Assets WHERE asset_class IS NULL 
UNION ALL
SELECT 'manufacturer', COUNT(*) FROM reporting.MDM_Assets WHERE manufacturer IS NULL 
UNION ALL
SELECT 'model', COUNT(*) FROM reporting.MDM_Assets WHERE model IS NULL 
UNION ALL
SELECT 'model_year', COUNT(*) FROM reporting.MDM_Assets WHERE model_year IS NULL 
UNION ALL
SELECT 'series', COUNT(*) FROM reporting.MDM_Assets WHERE series IS NULL 
UNION ALL
SELECT 'serial_num', COUNT(*) FROM reporting.MDM_Assets WHERE serial_num IS NULL 
UNION ALL
SELECT 'status', COUNT(*) FROM reporting.MDM_Assets WHERE [status] IS NULL 
UNION ALL
SELECT 'status_desc', COUNT(*) FROM reporting.MDM_Assets WHERE status_desc IS NULL 
-- Repeat for all columns
UNION ALL
SELECT 'source', COUNT(*) FROM reporting.MDM_Assets WHERE source IS NULL
UNION ALL
SELECT 'marketed', COUNT(*) FROM reporting.MDM_Assets WHERE marketed IS NULL
UNION ALL
SELECT 'revenue_track', COUNT(*) FROM reporting.MDM_Assets WHERE revenue_track IS NULL
UNION ALL
SELECT 'parent_asset_num', COUNT(*) FROM reporting.MDM_Assets WHERE parent_asset_num IS NULL
UNION ALL
SELECT 'child_relationship_type', COUNT(*) FROM reporting.MDM_Assets WHERE child_relationship_type IS NULL
UNION ALL
SELECT 'loco_code', COUNT(*) FROM reporting.MDM_Assets WHERE loco_code IS NULL
UNION ALL
SELECT 'loco_name', COUNT(*) FROM reporting.MDM_Assets WHERE loco_name IS NULL
UNION ALL
SELECT 'loca_code', COUNT(*) FROM reporting.MDM_Assets WHERE loca_code IS NULL
UNION ALL
SELECT 'loca_name', COUNT(*) FROM reporting.MDM_Assets WHERE loca_name IS NULL
UNION ALL
SELECT 'mktp_code', COUNT(*) FROM reporting.MDM_Assets WHERE mktp_code IS NULL
UNION ALL
SELECT 'mktp_name', COUNT(*) FROM reporting.MDM_Assets WHERE mktp_name IS NULL
UNION ALL
SELECT 'lvl1_code', COUNT(*) FROM reporting.MDM_Assets WHERE lvl1_code IS NULL
UNION ALL
SELECT 'lvl1_name', COUNT(*) FROM reporting.MDM_Assets WHERE lvl1_name IS NULL
UNION ALL
SELECT 'lob_code', COUNT(*) FROM reporting.MDM_Assets WHERE lob_code IS NULL
UNION ALL
SELECT 'lob_name', COUNT(*) FROM reporting.MDM_Assets WHERE lob_name IS NULL
UNION ALL
SELECT 'dist_code', COUNT(*) FROM reporting.MDM_Assets WHERE dist_code IS NULL
UNION ALL
SELECT 'dist_name', COUNT(*) FROM reporting.MDM_Assets WHERE dist_name IS NULL
UNION ALL
SELECT 'mare_code', COUNT(*) FROM reporting.MDM_Assets WHERE mare_code IS NULL
UNION ALL
SELECT 'mare_name', COUNT(*) FROM reporting.MDM_Assets WHERE mare_name IS NULL
UNION ALL
SELECT 'yard_code', COUNT(*) FROM reporting.MDM_Assets WHERE yard_code IS NULL
UNION ALL
SELECT 'yard_name', COUNT(*) FROM reporting.MDM_Assets WHERE yard_name IS NULL
/* UNION ALL
SELECT 'W_Status', COUNT(*) FROM reporting.MDM_Assets WHERE W_Status IS NULL
UNION ALL
SELECT 'Crew_Needed', COUNT(*) FROM reporting.MDM_Assets WHERE Crew_Needed IS NULL
UNION ALL
SELECT 'Avail_Date', COUNT(*) FROM reporting.MDM_Assets WHERE Avail_Date IS NULL
UNION ALL
SELECT 'LastWT_Date', COUNT(*) FROM reporting.MDM_Assets WHERE LastWT_Date IS NULL
UNION ALL
SELECT 'Mod_Date', COUNT(*) FROM reporting.MDM_Assets WHERE Mod_Date IS NULL
UNION ALL
SELECT 'Mod_User', COUNT(*) FROM reporting.MDM_Assets WHERE Mod_User IS NULL
UNION ALL
SELECT 'Note', COUNT(*) FROM reporting.MDM_Assets WHERE Note IS NULL
UNION ALL
SELECT 'Customer', COUNT(*) FROM reporting.MDM_Assets WHERE Customer IS NULL
UNION ALL
SELECT 'JobType', COUNT(*) FROM reporting.MDM_Assets WHERE JobType IS NULL
UNION ALL
SELECT 'Supervisor', COUNT(*) FROM reporting.MDM_Assets WHERE Supervisor IS NULL
UNION ALL
SELECT 'Operator', COUNT(*) FROM reporting.MDM_Assets WHERE Operator IS NULL
UNION ALL
SELECT 'Directions', COUNT(*) FROM reporting.MDM_Assets WHERE Directions IS NULL
UNION ALL
SELECT 'CompanyMan', COUNT(*) FROM reporting.MDM_Assets WHERE CompanyMan IS NULL
UNION ALL
SELECT 'CompanyManPhone', COUNT(*) FROM reporting.MDM_Assets WHERE CompanyManPhone IS NULL
UNION ALL
SELECT 'Daylight24HR', COUNT(*) FROM reporting.MDM_Assets WHERE Daylight24HR IS NULL
UNION ALL
SELECT 'Size', COUNT(*) FROM reporting.MDM_Assets WHERE Size IS NULL
UNION ALL
SELECT 'UsedByRigYard', COUNT(*) FROM reporting.MDM_Assets WHERE UsedByRigYard IS NULL 
UNION ALL 
SELECT 'UsedByRigNum', COUNT(*) FROM reporting.MDM_Assets WHERE UsedByRigNum IS NULL
UNION ALL
SELECT 'Source_LastUpdateDate', COUNT(*) FROM reporting.MDM_Assets WHERE Source_LastUpdateDate IS NULL
UNION ALL
SELECT 'Source_LastUpdateBy', COUNT(*) FROM reporting.MDM_Assets WHERE Source_LastUpdateBy IS NULL;
*/
SELECT * FROM @NullCount;

--============================
DECLARE @BlankCount TABLE (ColumnName NVARCHAR(128), BlankCount INT);

INSERT INTO @BlankCount
SELECT 'asset_id' AS 'COLNAME', COUNT(*) AS 'COUNT' FROM reporting.MDM_Assets WHERE asset_id = ''
UNION ALL
SELECT 'asset_num', COUNT(*) FROM reporting.MDM_Assets WHERE asset_num = '' 
UNION ALL
SELECT 'asset_desc', COUNT(*) FROM reporting.MDM_Assets WHERE asset_desc = '' 
UNION ALL
SELECT 'asset_class', COUNT(*) FROM reporting.MDM_Assets WHERE asset_class = '' 
UNION ALL
SELECT 'manufacturer', COUNT(*) FROM reporting.MDM_Assets WHERE manufacturer = '' 
UNION ALL
SELECT 'model', COUNT(*) FROM reporting.MDM_Assets WHERE model = '' 
UNION ALL
SELECT 'model_year', COUNT(*) FROM reporting.MDM_Assets WHERE model_year = '' 
UNION ALL
SELECT 'series', COUNT(*) FROM reporting.MDM_Assets WHERE series = '' 
UNION ALL
SELECT 'serial_num', COUNT(*) FROM reporting.MDM_Assets WHERE serial_num = '' 
UNION ALL
SELECT 'status', COUNT(*) FROM reporting.MDM_Assets WHERE [status] = '' 
UNION ALL
SELECT 'status_desc', COUNT(*) FROM reporting.MDM_Assets WHERE status_desc = '' 
-- Repeat for all columns
UNION ALL
SELECT 'source', COUNT(*) FROM reporting.MDM_Assets WHERE source = ''
UNION ALL
SELECT 'marketed', COUNT(*) FROM reporting.MDM_Assets WHERE marketed = ''
UNION ALL
SELECT 'revenue_track', COUNT(*) FROM reporting.MDM_Assets WHERE revenue_track = ''
UNION ALL
SELECT 'parent_asset_num', COUNT(*) FROM reporting.MDM_Assets WHERE parent_asset_num = ''
UNION ALL
SELECT 'child_relationship_type', COUNT(*) FROM reporting.MDM_Assets WHERE child_relationship_type = ''
UNION ALL
SELECT 'loco_code', COUNT(*) FROM reporting.MDM_Assets WHERE loco_code = ''
UNION ALL
SELECT 'loco_name', COUNT(*) FROM reporting.MDM_Assets WHERE loco_name = ''
UNION ALL
SELECT 'loca_code', COUNT(*) FROM reporting.MDM_Assets WHERE loca_code = ''
UNION ALL
SELECT 'loca_name', COUNT(*) FROM reporting.MDM_Assets WHERE loca_name = ''
UNION ALL
SELECT 'mktp_code', COUNT(*) FROM reporting.MDM_Assets WHERE mktp_code = ''
UNION ALL
SELECT 'mktp_name', COUNT(*) FROM reporting.MDM_Assets WHERE mktp_name = ''
UNION ALL
SELECT 'lvl1_code', COUNT(*) FROM reporting.MDM_Assets WHERE lvl1_code = ''
UNION ALL
SELECT 'lvl1_name', COUNT(*) FROM reporting.MDM_Assets WHERE lvl1_name = ''
UNION ALL
SELECT 'lob_code', COUNT(*) FROM reporting.MDM_Assets WHERE lob_code = ''
UNION ALL
SELECT 'lob_name', COUNT(*) FROM reporting.MDM_Assets WHERE lob_name = ''
UNION ALL
SELECT 'dist_code', COUNT(*) FROM reporting.MDM_Assets WHERE dist_code = ''
UNION ALL
SELECT 'dist_name', COUNT(*) FROM reporting.MDM_Assets WHERE dist_name = ''
UNION ALL
SELECT 'mare_code', COUNT(*) FROM reporting.MDM_Assets WHERE mare_code = ''
UNION ALL
SELECT 'mare_name', COUNT(*) FROM reporting.MDM_Assets WHERE mare_name = ''
UNION ALL
SELECT 'yard_code', COUNT(*) FROM reporting.MDM_Assets WHERE yard_code = ''
UNION ALL
SELECT 'yard_name', COUNT(*) FROM reporting.MDM_Assets WHERE yard_name = ''
/* UNION ALL
SELECT 'W_Status', COUNT(*) FROM reporting.MDM_Assets WHERE W_Status = ''
UNION ALL
SELECT 'Crew_Needed', COUNT(*) FROM reporting.MDM_Assets WHERE Crew_Needed = ''
UNION ALL
SELECT 'Avail_Date', COUNT(*) FROM reporting.MDM_Assets WHERE Avail_Date = ''
UNION ALL
SELECT 'LastWT_Date', COUNT(*) FROM reporting.MDM_Assets WHERE LastWT_Date = ''
UNION ALL
SELECT 'Mod_Date', COUNT(*) FROM reporting.MDM_Assets WHERE Mod_Date = ''
UNION ALL
SELECT 'Mod_User', COUNT(*) FROM reporting.MDM_Assets WHERE Mod_User = ''
UNION ALL
SELECT 'Note', COUNT(*) FROM reporting.MDM_Assets WHERE Note = ''
UNION ALL
SELECT 'Customer', COUNT(*) FROM reporting.MDM_Assets WHERE Customer = ''
UNION ALL
SELECT 'JobType', COUNT(*) FROM reporting.MDM_Assets WHERE JobType = ''
UNION ALL
SELECT 'Supervisor', COUNT(*) FROM reporting.MDM_Assets WHERE Supervisor = ''
UNION ALL
SELECT 'Operator', COUNT(*) FROM reporting.MDM_Assets WHERE Operator = ''
UNION ALL
SELECT 'Directions', COUNT(*) FROM reporting.MDM_Assets WHERE Directions = ''
UNION ALL
SELECT 'CompanyMan', COUNT(*) FROM reporting.MDM_Assets WHERE CompanyMan = ''
UNION ALL
SELECT 'CompanyManPhone', COUNT(*) FROM reporting.MDM_Assets WHERE CompanyManPhone = ''
UNION ALL
SELECT 'Daylight24HR', COUNT(*) FROM reporting.MDM_Assets WHERE Daylight24HR = ''
UNION ALL
SELECT 'Size', COUNT(*) FROM reporting.MDM_Assets WHERE Size = ''
UNION ALL
SELECT 'UsedByRigYard', COUNT(*) FROM reporting.MDM_Assets WHERE UsedByRigYard = ''
UNION ALL
SELECT 'UsedByRigNum', COUNT(*) FROM reporting.MDM_Assets WHERE UsedByRigNum = ''
UNION ALL
SELECT 'Source_LastUpdateDate', COUNT(*) FROM reporting.MDM_Assets WHERE Source_LastUpdateDate = ''
UNION ALL
SELECT 'Source_LastUpdateBy', COUNT(*) FROM reporting.MDM_Assets WHERE Source_LastUpdateBy = '';
*/
SELECT * FROM @BlankCount;

-- 62,167
SELECT COUNT(*) COUNT
FROM reporting.MDM_AssetAttr;

SELECT 
    case when asset_id = '' then null else asset_id end AS asset_id, 
    case when asset_num = '' then null else asset_num end AS asset_num, 
    case when attrcode = '' then null else attrcode end as attrcode,
    case when attrvalue = '' then null else attrvalue end AS attrvalue 
FROM dbo.MDM_AssetAttr
where attrvalue = ''

select *
from reporting.MDM_AssetAttr;

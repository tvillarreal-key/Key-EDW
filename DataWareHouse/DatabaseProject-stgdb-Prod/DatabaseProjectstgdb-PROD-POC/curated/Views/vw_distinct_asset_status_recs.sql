CREATE VIEW [curated].[vw_distinct_asset_status_recs] AS
SELECT DISTINCT 
    UPPER(CONVERT(char(32), 
        HASHBYTES(
            'MD5',UPPER(RTRIM(LTRIM(COALESCE(Status,''))))
        ),2
    )) As StatusHashKey,
    UPPER(CONVERT(char(32), 
        HASHBYTES(
            'MD5',UPPER(RTRIM(LTRIM(COALESCE(Status_Desc,''))))
        ),2
    )) As StatusChkSum,
    Status AS Status_Code, 
    SourceSystem,
    Status_Desc As Status_Name,
    getdate() as LoadDate
FROM curated.MDM_Assets
;

GO


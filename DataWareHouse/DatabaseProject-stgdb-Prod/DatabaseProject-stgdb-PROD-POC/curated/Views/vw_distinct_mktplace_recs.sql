CREATE VIEW [curated].[vw_distinct_mktplace_recs] AS
SELECT DISTINCT
    UPPER(CONVERT(char(32), 
        HASHBYTES('MD5',
            UPPER(CONCAT(
                    RTRIM(LTRIM(COALESCE(MKTP_Code,'N/A'))), ';',
                    RTRIM(LTRIM(COALESCE(MKTP_Name,'N/A')))
            ))
        ),2
    )) As MktPlaceHashKey    
    ,UPPER(CONVERT(char(32), 
        HASHBYTES('MD5',
                    RTRIM(LTRIM(COALESCE(MKTP_Name,'N/A')))
        ),2
    )) As MktPlaceChkSum  
    ,COALESCE(MKTP_Code,'N/A') AS MktPlace_Code
    ,SourceSystem
    ,COALESCE(MKTP_Name,'N/A') AS MktPlace_Name
    ,getdate() As LoadDate
From curated.Mdm_Assets
;

GO


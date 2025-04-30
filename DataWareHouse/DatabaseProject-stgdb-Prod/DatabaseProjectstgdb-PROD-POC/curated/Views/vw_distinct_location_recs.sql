CREATE VIEW [curated].[vw_distinct_location_recs] AS
SELECT DISTINCT
    UPPER(CONVERT(char(32), 
        HASHBYTES('MD5',
            UPPER(CONCAT(
                    RTRIM(LTRIM(COALESCE(Loca_Code,'N/A'))), ';',
                    RTRIM(LTRIM(COALESCE(Loca_Name,'N/A')))
            ))
        ),2
    )) As LocationHashKey    
    ,UPPER(CONVERT(char(32), 
        HASHBYTES('MD5',
                    RTRIM(LTRIM(COALESCE(Loca_Name,'N/A')))
        ),2
    )) As LocationChkSum  
    ,COALESCE(Loca_Code,'N/A') AS Loca_Code
    ,SourceSystem
    ,COALESCE(Loca_Name,'N/A') AS Loca_Name
    ,getdate() As LoadDate
From curated.Mdm_Assets
;

GO


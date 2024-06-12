SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
DROP VIEW IF EXISTS [curated].[vw_distinct_mktplace_recs]
GO
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

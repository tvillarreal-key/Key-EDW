SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
DROP VIEW IF EXISTS [curated].[vw_distinct_location_recs] 
GO
CREATE VIEW [curated].[vw_distinct_location_recs] AS
SELECT DISTINCT
    UPPER(CONVERT(char(32), 
        HASHBYTES('MD5',
            UPPER(CONCAT(
                    RTRIM(LTRIM(COALESCE(Yard_Code,'N/A'))), ';',
                    RTRIM(LTRIM(COALESCE(Loco_Code,'N/A'))), ';',
                    RTRIM(LTRIM(COALESCE(Loca_Code,'N/A'))), ';',
                    RTRIM(LTRIM(COALESCE(Mktp_Code,'N/A')))
            ))
        ),2
    )) As LocationHashKey    
    ,UPPER(CONVERT(char(32), 
        HASHBYTES('MD5',
            UPPER(CONCAT(
                    RTRIM(LTRIM(COALESCE(Yard_Name,'N/A'))), ';',
                    RTRIM(LTRIM(COALESCE(Loco_Name,'N/A'))), ';',
                    RTRIM(LTRIM(COALESCE(Loca_Name,'N/A'))), ';',
                    RTRIM(LTRIM(COALESCE(Mktp_Name,'N/A')))
            ))
        ),2
    )) As LocationChkSum    
    ,getdate() As LoadDate
    ,SourceSystem
    ,NULL As LoadSeenDate
    ,COALESCE(Yard_Code,'N/A') AS Yard_Code
    ,COALESCE(Yard_Name,'N/A') AS Yard_Name
    ,COALESCE(Loco_Code,'N/A') AS Loco_Code
    ,COALESCE(Loco_Name,'N/A') AS Loco_Name
    ,COALESCE(Loca_Code,'N/A') AS Loca_Code
    ,COALESCE(Loca_Name,'N/A') AS Loca_Name
    ,COALESCE(Mktp_Code,'N/A') AS Mktp_Code
    ,COALESCE(Mktp_Name,'N/A') AS Mktp_Name
From curated.Mdm_Assets
;
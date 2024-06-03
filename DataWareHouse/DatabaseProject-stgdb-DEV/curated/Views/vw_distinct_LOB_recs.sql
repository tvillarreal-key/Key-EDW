SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
DROP VIEW [curated].[vw_distinct_LOB_recs]
GO
CREATE VIEW [curated].[vw_distinct_LOB_recs] AS
SELECT DISTINCT
    UPPER(CONVERT(char(32), 
        HASHBYTES('MD5',
            UPPER(CONCAT(
                    RTRIM(LTRIM(COALESCE(Yard_Code,'N/A'))), ';',
                    RTRIM(LTRIM(COALESCE(Lvl1_Code,'N/A'))), ';',
                    RTRIM(LTRIM(COALESCE(Lob_Code,'N/A')))
            ))
        ),2
    )) As LOBHashKey    
    ,UPPER(CONVERT(char(32), 
        HASHBYTES('MD5',
            UPPER(CONCAT(
                    RTRIM(LTRIM(COALESCE(Yard_Name,'N/A'))), ';',
                    RTRIM(LTRIM(COALESCE(Lvl1_Name,'N/A'))), ';',
                    RTRIM(LTRIM(COALESCE(Lob_Name,'N/A')))
            ))
        ),2
    )) As LOBChkSum  
        ,UPPER(CONCAT(
        RTRIM(LTRIM(COALESCE(Yard_Name,'N/A'))), ';',
        RTRIM(LTRIM(COALESCE(Lvl1_Name,'N/A'))), ';',
        RTRIM(LTRIM(COALESCE(Lob_Name,'N/A')))
    )) As LOB_Key_Code    
    ,SourceSystem
    ,COALESCE(Yard_Code,'N/A') AS Yard_Code
    ,COALESCE(Yard_Name,'N/A') AS Yard_Name
    ,COALESCE(Lvl1_Code,'N/A') AS Lvl1_Code
    ,COALESCE(Lvl1_Name,'N/A') AS Lvl1_Name
    ,COALESCE(Lob_Code,'N/A') AS LOB_Code
    ,COALESCE(Lob_Name,'N/A') AS LOB_Name
    ,getdate() As LoadDate
From curated.Mdm_Assets
;
GO

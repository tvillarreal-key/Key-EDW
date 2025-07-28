SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
DROP VIEW IF EXISTS [curated].[vw_distinct_AssetClass_recs]
GO
CREATE VIEW [curated].[vw_distinct_AssetClass_recs] AS
SELECT DISTINCT
    UPPER(CONVERT(char(32), 
        HASHBYTES('MD5',
            UPPER(
                    RTRIM(LTRIM(COALESCE(Asset_Class,'N/A'))
            ))
        ),2
    )) As AssetClassHashKey    
    ,UPPER(CONVERT(char(32), 
        HASHBYTES('MD5',
            UPPER(
                    RTRIM(LTRIM(COALESCE(Asset_Desc,'N/A'))
            ))
        ),2
    )) As AssetClassChkSum  
    ,SourceSystem
    ,COALESCE(Asset_Class,'N/A') AS AssetClass_Code
    ,COALESCE(Asset_Desc,'N/A') AS AssetClass_Name
    ,getdate() As LoadDate
From staging.Mdm_Assets
;
GO

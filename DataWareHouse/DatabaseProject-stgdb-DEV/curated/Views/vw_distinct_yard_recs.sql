SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
DROP VIEW IF EXISTS [curated].[vw_distinct_yard_recs]
GO
CREATE VIEW [curated].[vw_distinct_yard_recs] AS
SELECT DISTINCT
    UPPER(CONVERT(char(32), 
        HASHBYTES('MD5',
            UPPER(CONCAT(
                    RTRIM(LTRIM(COALESCE(yard_Code,'N/A'))), ';',
                    RTRIM(LTRIM(COALESCE(yard_Name,'N/A')))
            ))
        ),2
    )) As YardHashKey    
    ,UPPER(CONVERT(char(32), 
        HASHBYTES('MD5',
                    RTRIM(LTRIM(COALESCE(yard_Name,'N/A')))
        ),2
    )) As YardChkSum  
    ,COALESCE(yard_Code,'N/A') AS Yard_Code
    ,SourceSystem
    ,COALESCE(yard_Name,'N/A') AS Yard_Name
    ,getdate() As LoadDate
From curated.Mdm_Assets
;
GO

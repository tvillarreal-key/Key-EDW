SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
DROP VIEW IF EXISTS [curated].[vw_distinct_Asset_recs]
GO
CREATE VIEW [curated].[vw_distinct_Asset_recs] AS
SELECT DISTINCT
    UPPER(CONVERT(char(32), 
        HASHBYTES('MD5',
            UPPER(
                    RTRIM(LTRIM(COALESCE(Asset_Num,'N/A'))
            ))
        ),2
    )) As AssetHashKey    
    ,UPPER(CONVERT(char(32), 
        HASHBYTES('MD5',
            UPPER(
                    RTRIM(LTRIM(COALESCE(Asset_Desc,'N/A'))
            ))
        ),2
    )) As AssetChkSum  
    ,COALESCE(Asset_Num,'N/A') AS Asset_Code
    ,SourceSystem
    ,COALESCE(Asset_Desc,'N/A') AS Asset_Name
    ,COALESCE(ID,0) AS ID
    ,COALESCE(Manufacturer,'N/A') AS Manufacturer
    ,COALESCE(Model,'N/A') AS Model
    ,COALESCE(Model_Year,'N/A') AS Model_Year
    ,COALESCE(Serial_Num,'N/A') AS Serial_Num
    ,COALESCE(Source,'N/A') AS Source
    ,COALESCE(Marketed,0) AS Marketed
    ,COALESCE(Revenue_Track,0) AS Revenue_Track
    ,COALESCE(Parent_Asset_Num,'N/A') AS Parent_Asset_Num
    ,COALESCE(Child_Relationship_Type,'N/A') AS Child_Relationship_Type
    ,COALESCE(W_Status,'N/A') AS W_Status
    ,COALESCE(Crew_Needed,0) AS Crew_Needed
    ,COALESCE(Avail_Date,'2999-12-31') AS Avail_Date
    ,COALESCE(LastWT_Date,'2999-12-31') AS LastWT_Date
    ,CASE 
        WHEN [JobType] = '' OR [JobType] IS NULL THEN 'N/A'
        ELSE [JobType]
     END AS [JobType]
    ,COALESCE(Supervisor,'N/A') AS Supervisor
    ,COALESCE(Operator,'N/A') AS Operator
    ,COALESCE(Directions,'N/A') AS Directions
    ,COALESCE(CompanyMan,'N/A') AS CompanyMan
    ,COALESCE(CompanyManPhone,'N/A') AS CompanyManPhone
    ,COALESCE(Daylight24HR,'N/A') AS Daylight24HR
    ,CASE 
        WHEN [Size] = '' OR [Size] IS NULL THEN 'N/A'
        ELSE [Size]
     END AS [Size]
    ,COALESCE(UsedByRigYard,'N/A') AS UsedByRigYard
    ,COALESCE(UsedByRigNum,'N/A') AS UsedByRigNum
    ,getdate() As LoadDate
From staging.Mdm_Assets
;
GO

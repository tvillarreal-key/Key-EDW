CREATE VIEW [curated].[vw_distinct_assetclass_recs] AS
SELECT DISTINCT
    UPPER(CONVERT(char(32), 
        HASHBYTES('MD5',
            UPPER(
                    RTRIM(LTRIM(COALESCE(Asset_Class,'N/A'))
            ))
        ),2
    )) As ClassHashKey    
    ,UPPER(CONVERT(char(32), 
        HASHBYTES('MD5',
                    RTRIM(LTRIM(COALESCE(Class_Name,'N/A')))
        ),2
    )) As ClassChkSum  
    ,COALESCE(Asset_Class,'N/A') AS Class_Code
    ,SourceSystem
    ,COALESCE(Class_Name,'N/A') AS Class_Name
    ,getdate() As LoadDate
From curated.Mdm_Assets a
LEFT JOIN curated.dimAssetClassMasterLookup b 
  ON a.Asset_Class = b.Class_Code
;

GO


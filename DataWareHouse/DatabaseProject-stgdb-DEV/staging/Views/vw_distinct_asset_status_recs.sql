SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
DROP VIEW IF EXISTS [curated].[vw_distinct_asset_status_recs] 
GO
CREATE VIEW [curated].[vw_distinct_asset_status_recs] AS
SELECT DISTINCT 
    UPPER(CONVERT(char(32), 
        HASHBYTES(
            'MD5',UPPER(RTRIM(LTRIM(COALESCE(Status_Desc,''))))
        ),2
    )) As AssetStatusKey,
    Status AS Status_Code, 
    Status_Desc As Status_Name,
    getdate() as LoadDate
FROM curated.MDM_Assets
;
GO

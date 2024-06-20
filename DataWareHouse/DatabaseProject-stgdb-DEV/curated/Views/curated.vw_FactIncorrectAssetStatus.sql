SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
DROP VIEW IF EXISTS [curated].[vw_FactIncorrectAssetStatus]
GO
CREATE VIEW [curated].[vw_FactIncorrectAssetStatus] AS
WITH CTE AS (
    SELECT 
        UPPER(CONVERT(char(32), HASHBYTES('MD5', UPPER(RTRIM(LTRIM(COALESCE(Asset_Num,'N/A'))))), 2)) AS AssetsHashKey,
        COALESCE(Asset_Num,'N/A') AS Asset_Name,
        COALESCE(Asset_Desc,'N/A') AS Asset_Code,
        COALESCE(MKTP_Code,'N/A') AS MktPlace_Code,
        COALESCE(MKTP_Name,'N/A') AS MktPlace_Name,
        UPPER(CONVERT(char(32), HASHBYTES('MD5', UPPER(CONCAT(RTRIM(LTRIM(COALESCE(MKTP_Code,'N/A'))), ';', RTRIM(LTRIM(COALESCE(MKTP_Name,'N/A')))))), 2)) AS MktPlaceHashKey,
        UPPER(CONVERT(char(32), HASHBYTES('MD5', UPPER(CONCAT(RTRIM(LTRIM(COALESCE(yard_Code,'N/A'))), ';', RTRIM(LTRIM(COALESCE(yard_Name,'N/A')))))), 2)) AS YardHashKey,
        COALESCE(yard_Code,'N/A') AS Yard_Code,
        COALESCE(yard_Name,'N/A') AS Yard_Name,
        UPPER(CONVERT(char(32), HASHBYTES('MD5', UPPER(RTRIM(LTRIM(COALESCE(Asset_Class,'N/A'))))), 2)) AS AssetClassHashKey,
        COALESCE(Asset_Desc,'N/A') AS AssetClass_Name,
        COALESCE(Status,'N/A') AS D365_Status_Code,
        COALESCE(Status_Desc,'N/A') AS D365_Status_Name,
        CASE 
            WHEN W_Status = '' THEN 'N/A'
            ELSE COALESCE(W_Status,'N/A')
        END AS Rig_Status_Code,
        getdate() AS FactLoadDate
    FROM [curated].[MDM_Assets]
)
SELECT 
    AssetsHashKey, 
    MktPlaceHashKey,
    YardHashKey,
    AssetClassHashKey,
    Asset_Code,
    Asset_Name,
    MktPlace_Code,
    MktPlace_Name,
    Yard_Code,
    Yard_Name,
    AssetClass_Name,
    D365_Status_Code,
    D365_Status_Name,
    Rig_Status_Code,
    CASE WHEN D365_Status_Code = Rig_Status_Code THEN 1 ELSE 0 END AS Status_Match_Flag,
    FactLoadDate
FROM CTE
--WHERE CASE WHEN Status = W_Status THEN 1 ELSE 0 END = 0;
;
GO

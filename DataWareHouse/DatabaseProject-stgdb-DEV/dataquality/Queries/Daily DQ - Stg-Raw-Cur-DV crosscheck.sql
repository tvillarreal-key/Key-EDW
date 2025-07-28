-- Testing Script
-- stg to raw to curated (total counts)
SELECT 'STAGING' AS DB
,LoadDate 
,FORMAT(CAST(COUNT(*) AS money), 'N0') AS CNT
FROM staging.MDM_Assets
GROUP BY LoadDate
UNION
SELECT 'RAW' AS DB
,LoadDate 
,FORMAT(CAST(COUNT(*) AS money), 'N0') AS CNT
FROM raw.MDM_Assets
WHERE LoadDate IN (SELECT MAX(LoadDate) from raw.MDM_Assets)
GROUP BY LoadDate
UNION
SELECT 'CURATED' AS DB
,LoadDate = (SELECT MAX(LoadDate) from raw.MDM_Assets) 
,FORMAT(CAST(COUNT(*) AS money), 'N0') AS CNT
FROM curated.MDM_Assets
;

-------------------------
-- Staging
-------------------------
-------------------------
-- Assets
-------------------------
-- stg to raw (missing values)
SELECT *
FROM staging.MDM_Assets stg
WHERE stg.Asset_Num NOT IN
(
    SELECT raw.Asset_Num
    FROM raw.MDM_Assets raw
    WHERE raw.LoadDate IN (SELECT MAX(LoadDate) from raw.MDM_Assets)
)
;
-- raw to curated to (missing values)
SELECT *
FROM raw.MDM_Assets raw
WHERE raw.LoadDate IN (SELECT MAX(LoadDate) from raw.MDM_Assets)
    AND raw.Asset_Num NOT IN 
    (
        SELECT curated.Asset_Num
        FROM curated.MDM_Assets curated
    )
;
-------------------------
-- AssetAttr
-------------------------
-- stg to raw (missing values)
SELECT stg.Asset_Num+stg.AttrCode
FROM staging.MDM_AssetAttr stg
WHERE stg.Asset_Num+stg.AttrCode NOT IN
(
    SELECT raw.Asset_Num+raw.AttrCode
    FROM raw.MDM_AssetAttr raw
    WHERE raw.LoadDate IN (SELECT MAX(LoadDate) from raw.MDM_AssetAttr)
)
;
-- raw to curated to (missing values)
SELECT raw.Asset_Num+raw.AttrCode
FROM raw.MDM_AssetAttr raw
WHERE raw.LoadDate IN (SELECT MAX(LoadDate) from raw.MDM_AssetAttr)
    AND raw.Asset_Num+raw.AttrCode NOT IN 
    (
        SELECT curated.Asset_Num+curated.AttrCode
        FROM curated.MDM_AssetAttr curated
    )
;

-------------------------
-- Data Vault (ElasticMasterDB) 
-------------------------
-------------------------
-- Asset Hub
-------------------------
SELECT *
FROM staging.MDM_Assets stg 
WHERE stg.Asset_Num NOT IN 
(
    SELECT ha.Asset_Num
    FROM datavault.HubAsset ha 
)
-------------------------
-- Asset Satellite
-------------------------
SELECT *
FROM staging.MDM_Assets stg 
WHERE stg.Asset_Num NOT IN 
(
    SELECT sata.Asset_Num
    FROM datavault.SatAsset sata  
    WHERE sata.LoadEndDate IS NULL
)
;
-------------------------
-- AssetAttr Hub
-------------------------
SELECT *
FROM staging.MDM_AssetAttr stg 
WHERE stg.Asset_Num+stg.AttrCode NOT IN 
(
    SELECT ha.Asset_Num+ha.AttrCode
    FROM datavault.HubAssetAttr ha 
)
;
-------------------------
-- AssetAttr Satellite
-------------------------
SELECT *
FROM staging.MDM_AssetAttr stg 
WHERE stg.Asset_Num+stg.AttrCode NOT IN 
(
    SELECT sata.Asset_Num+sata.AttrCode
    FROM datavault.SatAssetAttr sata  
    WHERE sata.LoadEndDate IS NULL
)
;

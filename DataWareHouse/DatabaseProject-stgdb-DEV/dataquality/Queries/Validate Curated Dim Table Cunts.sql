-- ============== MDMDB ============================================
-- Test Staging Load - 62,563
SELECT COUNT(*) CNT 
FROM dbo.MDM_Assets
;

-- Test MDMDB check - 532,726
SELECT COUNT(*) CNT 
FROM dbo.MDM_AssetAttr
;
-- ============== STAGING ============================================
-- Test Staging Load - 62,563
SELECT COUNT(*) CNT 
FROM staging.MDM_Assets
;

-- 2024-06-27 10:12:17.0930000
SELECT LOADDATE,FORMAT(CAST(COUNT(*) AS money), 'N0') AS CNT  
FROM staging.MDM_Assets
GROUP BY LOADDATE
;
-- 2024-06-27 10:12:17.0930000
SELECT LOADDATE,FORMAT(CAST(COUNT(*) AS money), 'N0') AS CNT 
FROM staging.MDM_AssetAttr
GROUP BY LOADDATE
;

-- Test Staging Load - 532,726
SELECT COUNT(*) CNT 
FROM staging.MDM_AssetAttr
;

-- ============== RAW ============================================
-- 2024-06-24 10:12:18.0460000
SELECT LOADDATE,FORMAT(CAST(COUNT(*) AS money), 'N0') AS CNT 
FROM RAW.MDM_Assets
--WHERE LOADDATE = '2024-06-24 10:12:18.0460000'
GROUP BY LOADDATE
ORDER BY 1 DESC
;

-- Test Staging Load - 62,563
SELECT DISTINCT LOADDATE
FROM RAW.MDM_Assets
WHERE LOADDATE = (SELECT MAX(LOADDATE) FROM staging.MDM_Assets)
;

-- Clean up RAW tables
--TRUNCATE TABLE RAW.MDM_Assets;
--TRUNCATE TABLE RAW.MDM_AssetAttr;

-- Test Staging Load - 532,726
SELECT LOADDATE, COUNT(*) CNT 
FROM RAW.MDM_AssetAttr
WHERE LOADDATE = (SELECT MAX(LOADDATE) FROM staging.MDM_AssetAttr)
GROUP BY LOADDATE
;
-- ============== CURATED ============================================
-- Test Curated Load - 62,563
SELECT FORMAT(CAST(COUNT(*) AS money), 'N0') AS CNT 
FROM CURATED.MDM_Assets
;

-- 2024-06-24 10:12:18.0460000
SELECT LOADDATE,FORMAT(CAST(COUNT(*) AS money), 'N0') AS CNT 
FROM CURATED.MDM_Assets
GROUP BY LOADDATE
ORDER BY 1 DESC
;

-- 2024-06-24 10:12:18.0460000
SELECT LOADDATE,FORMAT(CAST(COUNT(*) AS money), 'N0') AS CNT 
FROM CURATED.MDM_AssetAttr
GROUP BY LOADDATE
ORDER BY 1 DESC
;

-- 2024-06-24 10:12:18.0460000
SELECT FORMAT(CAST(COUNT(*) AS money), 'N0') AS CNT 
FROM CURATED.MDM_AssetAttr
ORDER BY 1 DESC
;

-- Check for missing CURATED Assets or Asset Changes
SELECT ASSET_NUM, AssetsChkSum
FROM STAGING.MDM_Assets
EXCEPT 
SELECT ASSET_NUM, AssetsChkSum
FROM CURATED.MDM_Assets
;

-- Check for missing CURATED AssetAttr or Asset Changes
SELECT ASSET_NUM, AttrCode, AssetAttrChkSum
FROM STAGING.MDM_AssetAttr
EXCEPT 
SELECT ASSET_NUM, AttrCode, AssetAttrChkSum
FROM CURATED.MDM_AssetAttr
;

-- ============== CURATED DIMS ============================================
-- Check LOB Dim total count
SELECT FORMAT(CAST(COUNT(*) AS money), 'N0') AS CNT 
FROM CURATED.dimLOB
ORDER BY 1 DESC
;

-- Check LOCATION Dim total count
SELECT FORMAT(CAST(COUNT(*) AS money), 'N0') AS CNT 
FROM CURATED.dimLocation
ORDER BY 1 DESC
;

-- Check YARD Dim total count
SELECT FORMAT(CAST(COUNT(*) AS money), 'N0') AS CNT 
FROM CURATED.dimYard
ORDER BY 1 DESC
;

-- Check MktPlace Dim total count
SELECT FORMAT(CAST(COUNT(*) AS money), 'N0') AS CNT 
FROM CURATED.dimMktPlace
ORDER BY 1 DESC
;

-- Check Asset Dim total count
SELECT FORMAT(CAST(COUNT(*) AS money), 'N0') AS CNT 
FROM CURATED.dimAsset
ORDER BY 1 DESC
;

-- Check AssetClass Dim total count
SELECT FORMAT(CAST(COUNT(*) AS money), 'N0') AS CNT 
FROM CURATED.dimAssetClass
ORDER BY 1 DESC
;

-- Check AssetStatus Dim total count
SELECT FORMAT(CAST(COUNT(*) AS money), 'N0') AS CNT 
FROM CURATED.dimAssetStatus
ORDER BY 1 DESC
;

-- Check ChildRelType Dim total count
SELECT FORMAT(CAST(COUNT(*) AS money), 'N0') AS CNT 
FROM CURATED.dimChildRelType
ORDER BY 1 DESC
;

-- Check ChildRelType Dim total count
SELECT FORMAT(CAST(COUNT(*) AS money), 'N0') AS CNT 
FROM CURATED.dimSourceSystem
ORDER BY 1 DESC
;


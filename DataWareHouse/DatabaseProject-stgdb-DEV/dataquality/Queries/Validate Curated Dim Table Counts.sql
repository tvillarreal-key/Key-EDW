-- ============== MDMDB ============================================
-- Test Staging Load - 62,573 (6/28/2024)
SELECT FORMAT(CAST(COUNT(*) AS money), 'N0') AS CNT 
FROM dbo.MDM_Assets
;

-- Test MDMDB check - 532,854 (6/28/2024)
SELECT FORMAT(CAST(COUNT(*) AS money), 'N0') AS CNT  
FROM dbo.MDM_AssetAttr
;
-- ============== STAGING ============================================
-- Test Staging Load - 62,573 (6/28/2024)
SELECT FORMAT(CAST(COUNT(*) AS money), 'N0') AS CNT  
FROM staging.MDM_Assets
;

-- 2024-06-28 05:12:48.2810000, 62,573
SELECT LOADDATE,FORMAT(CAST(COUNT(*) AS money), 'N0') AS CNT  
FROM staging.MDM_Assets
GROUP BY LOADDATE
;
-- 2024-06-28 05:12:15.6990000, 532,854
SELECT LOADDATE,FORMAT(CAST(COUNT(*) AS money), 'N0') AS CNT 
FROM staging.MDM_AssetAttr
GROUP BY LOADDATE
;

-- Test Staging Load - 532,854 (6/28/2024)
SELECT FORMAT(CAST(COUNT(*) AS money), 'N0') AS CNT 
FROM staging.MDM_AssetAttr
;

-- ============== RAW ============================================
-- 2024-06-28 05:12:48.2810000	62,573
SELECT LOADDATE,FORMAT(CAST(COUNT(*) AS money), 'N0') AS CNT 
FROM RAW.MDM_Assets
--WHERE LOADDATE = '2024-06-24 10:12:18.0460000'
GROUP BY LOADDATE
ORDER BY 1 DESC
;

-- 2024-06-28 05:12:48.2810000
SELECT DISTINCT LOADDATE
FROM RAW.MDM_Assets
WHERE LOADDATE = (SELECT MAX(LOADDATE) FROM staging.MDM_Assets)
;

-- Clean up RAW tables
--TRUNCATE TABLE RAW.MDM_Assets;
--TRUNCATE TABLE RAW.MDM_AssetAttr;

-- 2024-06-28 05:12:15.6990000	532,854
SELECT LOADDATE, FORMAT(CAST(COUNT(*) AS money), 'N0') AS CNT 
FROM RAW.MDM_AssetAttr
WHERE LOADDATE = (SELECT MAX(LOADDATE) FROM staging.MDM_AssetAttr)
GROUP BY LOADDATE
;
-- ============== CURATED ============================================
-- Test Curated Load - 62,573 (6/28/2024)
SELECT FORMAT(CAST(COUNT(*) AS money), 'N0') AS CNT 
FROM CURATED.MDM_Assets
;

-- 2024-06-28 05:12:48.2810000	432 (adds, updates)
SELECT LOADDATE,FORMAT(CAST(COUNT(*) AS money), 'N0') AS CNT 
FROM CURATED.MDM_Assets
GROUP BY LOADDATE
ORDER BY 1 DESC
;

-- 2024-06-28 05:12:15.6990000	132 (adds, updates)
SELECT LOADDATE,FORMAT(CAST(COUNT(*) AS money), 'N0') AS CNT 
FROM CURATED.MDM_AssetAttr
GROUP BY LOADDATE
ORDER BY 1 DESC
;

-- 532,854 (6/28/2024)
SELECT FORMAT(CAST(COUNT(*) AS money), 'N0') AS CNT 
FROM CURATED.MDM_AssetAttr
ORDER BY 1 DESC
;

-- Check for missing CURATED Assets or Asset Changes
-- 0 missing (6/28/2024)
SELECT ASSET_NUM, AssetsChkSum
FROM STAGING.MDM_Assets
EXCEPT 
SELECT ASSET_NUM, AssetsChkSum
FROM CURATED.MDM_Assets
;

-- Check for missing CURATED AssetAttr or Asset Changes
-- 0 missing (6/28/2024)
SELECT ASSET_NUM, AttrCode, AssetAttrChkSum
FROM STAGING.MDM_AssetAttr
EXCEPT 
SELECT ASSET_NUM, AttrCode, AssetAttrChkSum
FROM CURATED.MDM_AssetAttr
;

-- ============== CURATED DIMS ============================================
-- Check LOB Dim total count
-- 463
SELECT LOADDATE, FORMAT(CAST(COUNT(*) AS money), 'N0') AS CNT 
FROM CURATED.dimLOB
GROUP BY LOADDATE
ORDER BY 1 DESC
;

-- Check LOCATION Dim total count
-- 297
SELECT LOADDATE, FORMAT(CAST(COUNT(*) AS money), 'N0') AS CNT 
FROM CURATED.dimLocation
GROUP BY LOADDATE
ORDER BY 1 DESC
;

-- Check YARD Dim total count
-- 462
SELECT LOADDATE, FORMAT(CAST(COUNT(*) AS money), 'N0') AS CNT 
FROM CURATED.dimYard
GROUP BY LOADDATE
ORDER BY 1 DESC
;

-- Check MktPlace Dim total count
-- 14
SELECT LOADDATE, FORMAT(CAST(COUNT(*) AS money), 'N0') AS CNT 
FROM CURATED.dimMktPlace
GROUP BY LOADDATE
ORDER BY 1 DESC
;

-- Check Asset Dim total count
-- 62,573
-- 2024-06-28 10:28:08.6330000	10 (adds, updates)
SELECT LOADDATE, FORMAT(CAST(COUNT(*) AS money), 'N0') AS CNT 
FROM CURATED.dimAsset
GROUP BY LOADDATE
ORDER BY 1 DESC
;
SELECT FORMAT(CAST(COUNT(*) AS money), 'N0') AS CNT 
FROM CURATED.dimAsset
ORDER BY 1 DESC
;

-- Check AssetClass Dim total count
-- 66
SELECT LOADDATE, FORMAT(CAST(COUNT(*) AS money), 'N0') AS CNT 
FROM CURATED.dimAssetClass
GROUP BY LOADDATE
ORDER BY 1 DESC
;
SELECT FORMAT(CAST(COUNT(*) AS money), 'N0') AS CNT 
FROM CURATED.dimAssetClass
ORDER BY 1 DESC
;

-- Check AssetStatus Dim total count
-- 17
SELECT LOADDATE, FORMAT(CAST(COUNT(*) AS money), 'N0') AS CNT 
FROM CURATED.dimAssetStatus
GROUP BY LOADDATE
ORDER BY 1 DESC
;
SELECT FORMAT(CAST(COUNT(*) AS money), 'N0') AS CNT 
FROM CURATED.dimAssetStatus
ORDER BY 1 DESC
;

-- Check ChildRelType Dim total count
-- 2
SELECT FORMAT(CAST(COUNT(*) AS money), 'N0') AS CNT 
FROM CURATED.dimChildRelType
ORDER BY 1 DESC
;

-- Check ChildRelType Dim total count
-- 2
SELECT FORMAT(CAST(COUNT(*) AS money), 'N0') AS CNT 
FROM CURATED.dimSourceSystem
ORDER BY 1 DESC
;

-- Check for missing CURATED Assets or Asset Changes
SELECT ASSET_NUM, COUNT(*) CNT 
FROM CURATED.dimAsset
GROUP BY ASSET_NUM
HAVING COUNT(*) > 1

DELETE
FROM CURATED.dimAsset
WHERE ASSET_NUM = '4931321'

-- 0 missing (6/28/2024)
SELECT ASSET_NUM
FROM STAGING.MDM_Assets
EXCEPT 
SELECT ASSET_NUM
FROM CURATED.dimAsset
;

-- ============== Data Vault Hubs ============================================
-- Check 
-- ?? missing (6/28/2024)
SELECT ASSET_NUM
FROM STAGING.MDM_Assets
EXCEPT 
SELECT ASSET_NUM
FROM DATAVAULT.HubAsset
;

-- ============== DATA MART DIMS ============================================
-- Check LOB Dim total count
-- 463 (matches)
SELECT LOADDATE, FORMAT(CAST(COUNT(*) AS money), 'N0') AS CNT 
FROM DATAMART.dimLOB
GROUP BY LOADDATE
ORDER BY 1 DESC
;
-- missing unknown record
SELECT *
FROM DATAMART.dimLOB
--WHERE Loca_code = '3025'
--WHERE LOADDATE = '2024-06-11 10:54:24.0766667'
WHERE LOBHashkey = '00000000000000000000000000000000'
;

-- Check LOCATION Dim total count
-- 297 Duplicate for 3025 because different descriptions
SELECT *
FROM DATAMART.dimLocation
--WHERE Loca_code = '3025'
--WHERE LOADDATE = '2024-06-11 10:54:24.0766667'
WHERE LocationHashkey = '00000000000000000000000000000000'
;
SELECT Loca_code, FORMAT(CAST(COUNT(*) AS money), 'N0') AS CNT 
FROM DATAMART.dimLocation
GROUP BY Loca_code
ORDER BY 2 DESC
;
SELECT LOADDATE, FORMAT(CAST(COUNT(*) AS money), 'N0') AS CNT 
FROM DATAMART.dimLocation
GROUP BY LOADDATE
ORDER BY 1 DESC
;

-- Check YARD Dim total count
-- 462
SELECT LOADDATE, FORMAT(CAST(COUNT(*) AS money), 'N0') AS CNT 
FROM DATAMART.dimYard
GROUP BY LOADDATE
ORDER BY 1 DESC
;
SELECT *
FROM DATAMART.dimYard
--WHERE Loca_code = '3025'
--WHERE LOADDATE = '2024-06-11 10:54:24.0766667'
WHERE YardHashkey = '00000000000000000000000000000000'
;

-- Check MktPlace Dim total count
-- 14
SELECT LOADDATE, FORMAT(CAST(COUNT(*) AS money), 'N0') AS CNT 
FROM DATAMART.dimMktPlace
GROUP BY LOADDATE
ORDER BY 1 DESC
;

-- Check Asset Dim total count
-- 62,573
-- 2024-06-28 10:28:08.6330000	10 (adds, updates)
SELECT LOADDATE, FORMAT(CAST(COUNT(*) AS money), 'N0') AS CNT 
FROM DATAMART.dimAsset
GROUP BY LOADDATE
ORDER BY 1 DESC
;
SELECT FORMAT(CAST(COUNT(*) AS money), 'N0') AS CNT 
FROM DATAMART.dimAsset
ORDER BY 1 DESC
;

-- Check AssetClass Dim total count
-- 66
SELECT LOADDATE, FORMAT(CAST(COUNT(*) AS money), 'N0') AS CNT 
FROM DATAMART.dimAssetClass
GROUP BY LOADDATE
ORDER BY 1 DESC
;
SELECT FORMAT(CAST(COUNT(*) AS money), 'N0') AS CNT 
FROM DATAMART.dimAssetClass
ORDER BY 1 DESC
;

-- Check AssetStatus Dim total count
-- 17
SELECT LOADDATE, FORMAT(CAST(COUNT(*) AS money), 'N0') AS CNT 
FROM DATAMART.dimAssetStatus
GROUP BY LOADDATE
ORDER BY 1 DESC
;
SELECT FORMAT(CAST(COUNT(*) AS money), 'N0') AS CNT 
FROM DATAMART.dimAssetStatus
ORDER BY 1 DESC
;

-- Check ChildRelType Dim total count
-- 2
SELECT FORMAT(CAST(COUNT(*) AS money), 'N0') AS CNT 
FROM DATAMART.dimChildRelType
ORDER BY 1 DESC
;

-- Check ChildRelType Dim total count
-- 2
SELECT FORMAT(CAST(COUNT(*) AS money), 'N0') AS CNT 
FROM DATAMART.dimSourceSystem
ORDER BY 1 DESC
;

-- Check for missing DATAMART Assets or Asset Changes
SELECT ASSET_NUM, COUNT(*) CNT 
FROM DATAMART.dimAsset
GROUP BY ASSET_NUM
HAVING COUNT(*) > 1



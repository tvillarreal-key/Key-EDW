-- Asset = 62,199
SELECT 'Staging Assets' TableName
  ,count(*) CNT
FROM [staging].[MDM_Assets]
UNION
SELECT 'Raw Assets' TableName
  ,count(*) CNT
FROM [raw].[MDM_Assets]
WHERE LoadDate = (select MAX(LoadDate) from [raw].[MDM_Assets])
UNION
SELECT 'Curated Assets' TableName
  ,count(*) CNT
FROM [curated].[MDM_Assets]
;


-- AssetAttr = 62,199
SELECT 'Staging AssetAttr' TableName
  ,count(*) CNT
FROM [staging].[MDM_AssetAttr]
UNION
SELECT 'Raw AssetAttr' TableName
  ,count(*) CNT
FROM [raw].[MDM_AssetAttr]
WHERE LoadDate = (select MAX(LoadDate) from [raw].[MDM_AssetAttr])
UNION
SELECT 'Curated AssetAttr' TableName
  ,count(*) CNT
FROM [curated].[MDM_AssetAttr]
;




-- With PostRigCountStatus = 643
-- Without PostRigCountStatus = 61,930
SELECT  
      [Asset_Num]
      ,[Source_LastUpdateDate]
      ,[Source_LastUpdateBy]
      ,[FactLoadDate]
  FROM [datamart].[FactIncorrectAssetStatus] a 
  JOIN [datamart].[dimAsset] c 
  ON a.AssetsHashKey =  c.AssetsHashKey
  WHERE ([Source_LastUpdateBy] != 'PostRigCountStatus'
   OR  [Source_LastUpdateBy] IS NULL)   
/* WHERE ([Source_LastUpdateBy] = 'PostRigCountStatus')
   AND FactLoadDate = (SELECT MAX(FactLoadDate) FROM [datamart].[FactIncorrectAssetStatus]) */
;

SELECT  
/*      a.[AssetsHashKey]
     ,a.[MktPlaceHashKey]
      ,a.[YardHashKey]
      ,a.[AssetClassHashKey] */
      [Asset_Num]
      ,[Source_LastUpdateDate]
      ,[Source_LastUpdateBy]
/*      ,[Class_Name]
      ,[MktPlace_Name]
      ,[Yard_Name]
      ,[D365_Status_Code]
      ,[D365_Status_Name]
      ,[Rig_Status_Code]
      ,[Status_Match_Flag] */
      ,[FactLoadDate]
  FROM [datamart].[FactIncorrectAssetStatus] a 
/*  JOIN [datamart].[dimAssetClass] b
  ON a.AssetClassHashKey = b.ClassHashKey  
  JOIN [datamart].[dimMktPlace] d
  ON a.MktPlaceHashKey =  d.MktPlaceHashKey  
  JOIN [datamart].[dimYard] e
  ON a.YardHashKey =  e.YardHashKey  */
  JOIN [datamart].[dimAsset] c 
  ON a.AssetsHashKey =  c.AssetsHashKey
/*  WHERE ([Source_LastUpdateBy] != 'PostRigCountStatus'
   OR  [Source_LastUpdateBy] IS NULL) */
WHERE ([Source_LastUpdateBy] = 'PostRigCountStatus')
   AND FactLoadDate = (SELECT MAX(FactLoadDate) FROM [datamart].[FactIncorrectAssetStatus])   
;
SELECT *
FROM [datamart].[FactIncorrectAssetStatus] a 
WHERE FactLoadDate = (SELECT MAX(FactLoadDate) FROM [datamart].[FactIncorrectAssetStatus])

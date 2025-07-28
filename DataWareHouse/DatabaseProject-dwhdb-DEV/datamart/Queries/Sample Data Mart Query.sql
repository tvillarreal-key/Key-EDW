SELECT TOP (1000) 
      a.[AssetsHashKey]
      ,a.[MktPlaceHashKey]
      ,a.[YardHashKey]
      ,a.[AssetClassHashKey]
      ,[Asset_Num]
      ,[Class_Name]
      ,[MktPlace_Name]
      ,[Yard_Name]
      ,[D365_Status_Code]
      ,[D365_Status_Name]
      ,[Rig_Status_Code]
      ,[Status_Match_Flag]
      ,[FactLoadDate]
  FROM [datamart].[FactIncorrectAssetStatus] a 
  JOIN [datamart].[dimAssetClass] b
  ON a.AssetClassHashKey = b.ClassHashKey  
  JOIN [datamart].[dimMktPlace] d
  ON a.MktPlaceHashKey =  d.MktPlaceHashKey  
  JOIN [datamart].[dimYard] e
  ON a.YardHashKey =  e.YardHashKey  
  JOIN [datamart].[dimAsset] c 
  ON a.AssetsHashKey =  c.AssetsHashKey
  WHERE b.Class_Code = 'Rig'
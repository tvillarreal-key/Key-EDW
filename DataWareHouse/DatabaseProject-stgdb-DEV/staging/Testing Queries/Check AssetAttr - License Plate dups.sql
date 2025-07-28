SELECT [AssetAttrHashKey]
      ,[AssetAttrChkSum]
      ,[LoadDate]
      ,[SourceSystem]
      ,[LastSeenDate]
      ,[Asset_ID]
      ,[Asset_Num]
      ,[AttrCode]
      ,[AttrValue]
  FROM [curated].[MDM_AssetAttr]
  WHERE LoadDate = '2024-05-22 10:12:25.4740000'
  AND AttrCode LIKE 'License%'

  SELECT [AssetAttrHashKey]
      ,[AssetAttrChkSum]
      ,[LoadDate]
      ,[SourceSystem]
      ,[LastSeenDate]
      ,[Asset_ID]
      ,[Asset_Num]
      ,[AttrCode]
      ,[AttrValue]
  FROM [staging].[MDM_AssetAttr]
  WHERE LoadDate = '2024-05-22 10:12:25.4740000'
  AND AttrCode LIKE 'License%'

  
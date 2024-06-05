INSERT INTO [datamart].[dimAssetStatus]
    ([AssetStatusKey]
    ,[Status_Code]
    ,[Status_Name]
    ,[LoadDate])
VALUES
    (
     REPLICATE('0',32)
     ,'Unknown'
     ,'Unknown'
     ,getdate()
    );

SELECT
       [AssetStatusKey]
      ,[Status_Code]
      ,[Status_Name]
      ,[LoadDate]
  FROM [datamart].[dimAssetStatus]
  WHERE AssetStatusKey = '00000000000000000000000000000000'
  ;

DELETE
  FROM [datamart].[dimAssetStatus]
  WHERE AssetStatusKey = '00000000000000000000000000000000'
  ;
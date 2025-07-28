INSERT INTO [datamart].[dimAssetClass]
    ([AssetClassKey]
    ,[Class_Code]
    ,[Class_Name]
    ,[LoadDate])
VALUES
    (
     REPLICATE('0',32)
     ,'Unknown'
     ,'Unknown'
     ,getdate()
    );

SELECT
       [AssetClassKey]
      ,[Class_Code]
      ,[Class_Name]
      ,[LoadDate]
  FROM [datamart].[dimAssetClass]
  WHERE AssetClassKey = '00000000000000000000000000000000'
  ;

DELETE
  FROM [datamart].[dimAssetClass]
  WHERE AssetClassKey = '00000000000000000000000000000000'
  ;
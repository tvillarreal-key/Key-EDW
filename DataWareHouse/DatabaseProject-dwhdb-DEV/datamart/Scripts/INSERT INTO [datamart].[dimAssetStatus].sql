INSERT INTO [datamart].[dimAssetStatus]
    ([StatusHashKey]
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
       [StatusHashKey]
      ,[Status_Code]
      ,[Status_Name]
      ,[LoadDate]
  FROM [datamart].[dimAssetStatus]
  WHERE StatusHashKey = '00000000000000000000000000000000'
  ;

DELETE
  FROM [datamart].[dimAssetStatus]
  WHERE StatusHashKey = '00000000000000000000000000000000'
  ;
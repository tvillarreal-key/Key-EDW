INSERT INTO [datamart].[dimLocation]
    ([LocationHashKey]
     ,[Location_Code]
     ,[SourceSystem]
     ,[Yard_Code]
     ,[Yard_Name]
     ,[Loco_Code]
     ,[Loco_Name]
     ,[Loca_Code]
     ,[Loca_Name]
     ,[MKTP_Code]
     ,[MKTP_Name]
     ,[LoadDate])
VALUES
    (
     REPLICATE('0',32)
     ,'?'
     ,'?'
     ,'Unknown'
     ,'Unknown'
     ,'Unknown'
     ,'Unknown'
     ,'Unknown'
     ,'Unknown'
     ,'Unknown'
     ,'Unknown'
     ,getdate()
    );

SELECT
      [LocationHashKey]
      ,[Location_Code]
      ,[SourceSystem]
      ,[Yard_Code]
      ,[Yard_Name]
      ,[Loco_Code]
      ,[Loco_Name]
      ,[Loca_Code]
      ,[Loca_Name]
      ,[MKTP_Code]
      ,[MKTP_Name]
      ,[LoadDate]
  FROM [datamart].[dimLocation]
  WHERE LocationHashKey = '00000000000000000000000000000000'
  ;

DELETE
  FROM [datamart].[dimLocation]
  WHERE LocationHashKey = '00000000000000000000000000000000'
  ;
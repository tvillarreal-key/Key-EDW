INSERT INTO [datamart].[dimYard]
    ([YardHashKey]
    ,[Yard_Code]
    ,[SourceSystem]
    ,[Yard_Name]
    ,[LoadDate])
VALUES
    (
     REPLICATE('0',32)
     ,'Unknown'
     ,'?'
     ,'Unknown'
     ,getdate()
    );

SELECT
       [YardHashKey]
      ,[Yard_Code]
      ,[SourceSystem]
      ,[Yard_Name]
      ,[LoadDate]
  FROM [datamart].[dimYard]
  WHERE YardHashKey = '00000000000000000000000000000000'
  ;

DELETE
  FROM [datamart].[dimYard]
  WHERE YardHashKey = '00000000000000000000000000000000'
  ;
INSERT INTO [datamart].[dimLOB]
    ([LOBHashKey]
    ,[LOB_Key_Code]
    ,[SourceSystem]
    ,[Yard_Code]
    ,[Yard_Name]
    ,[Lvl1_Code]
    ,[Lvl1_Name]
    ,[Lob_Code]
    ,[Lob_Name]
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
     ,getdate()
    );

SELECT
     [LOBHashKey]
    ,[LOB_Key_Code]
    ,[SourceSystem]
    ,[Yard_Code]
    ,[Yard_Name]
    ,[Lvl1_Code]
    ,[Lvl1_Name]
    ,[Lob_Code]
    ,[Lob_Name]
    ,[LoadDate]  
  FROM [datamart].[dimLOB]
  WHERE LOBHashKey = '00000000000000000000000000000000'
  ;

DELETE
  FROM [datamart].[dimLOB]
  WHERE LOBHashKey = '00000000000000000000000000000000'
  ;
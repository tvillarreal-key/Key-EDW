SELECT TOP (1000) 
       [Dim_ChildRelType_Id]
      ,[Child_Relationship_Type]
      ,[LoadDate]
  FROM [datamart].[dimChildRelType];

INSERT INTO [datamart].[dimChildRelType]
    ([Dim_ChildRelType_Id]
    ,[Child_Relationship_Type]
    ,[LoadDate])
VALUES
    (
     REPLICATE('0',32)
     ,'Unknown'
     ,getdate()
    );
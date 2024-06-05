INSERT INTO [datamart].[dimAssets]
    ([AssetsHashKey]
    ,[ID]
    ,[Asset_Num]
    ,[Asset_Desc]
    ,[Manufacturer]
    ,[Model]
    ,[Model_Year]
    ,[Series]
    ,[Serial_Num]
    ,[Source]
    ,[Marketed]
    ,[Revenue_Track]
    ,[Parent_Asset_Num]
    ,[Child_Relationship_Type]
    ,[W_Status]
    ,[Crew_Needed]
    ,[Avail_Date]
    ,[LastWT_Date]
    ,[Note]
    ,[Customer]
    ,[JobType]
    ,[Supervisor]
    ,[Operator]
    ,[Directions]
    ,[CompanyMan]
    ,[CompanyManPhone]
    ,[Daylight24HR]
    ,[Size]
    ,[UsedByRigYard]
    ,[UsedByRigNum]
    ,[LoadDate])
VALUES
    (
     REPLICATE('0',32)  -- AssetsHashKey
     ,0                 -- ID
     ,'Unknown'         -- Asset_Num
     ,'Unknown'         -- Asset_Desc
     ,'?'               -- Manufacturer
     ,'?'               -- Model
     ,'?'               -- Model_Year
     ,'?'               -- Series
     ,'?'               -- Serial_Num
     ,'?'               -- Source
     ,0                 -- Marketed
     ,0                 -- Revenue_Track
     ,'?'               -- Parent_Asset_Num
     ,'?'               -- Child_Relationship_Type
     ,'?'               -- W_Status
     ,0                 -- Crew_Needed
     ,CONVERT(date, '12/31/2999', 101)      -- Avail_Date
     ,CONVERT(date, '12/31/2999', 101)     -- LastWT_Date
     ,'?'               -- Note
     ,'?'               -- Customer
     ,'?'               -- JobType
     ,'?'               -- Supervisor
     ,'?'               -- Operator
     ,'?'               -- Directions
     ,'?'               -- CompanyMan
     ,'?'               -- CompanyManPhone
     ,'?'               -- Daylight24HR
     ,'?'               -- Size
     ,'?'               -- UsedByRigYard     
     ,'?'               -- UsedByRigNum      
     ,getdate()         -- 
    );

SELECT 
       [AssetsHashKey]
      ,[ID]
      ,[Asset_Num]
      ,[Asset_Desc]
      ,[Manufacturer]
      ,[Model]
      ,[Model_Year]
      ,[Series]
      ,[Serial_Num]
      ,[Source]
      ,[Marketed]
      ,[Revenue_Track]
      ,[Parent_Asset_Num]
      ,[Child_Relationship_Type]
      ,[W_Status]
      ,[Crew_Needed]
      ,[Avail_Date]
      ,[LastWT_Date]
      ,[Note]
      ,[Customer]
      ,[JobType]
      ,[Supervisor]
      ,[Operator]
      ,[Directions]
      ,[CompanyMan]
      ,[CompanyManPhone]
      ,[Daylight24HR]
      ,[Size]
      ,[UsedByRigYard]
      ,[UsedByRigNum]
      ,[LoadDate]      
  FROM [datamart].[dimAssets]
  WHERE AssetsHashKey = '00000000000000000000000000000000'
  ;

DELETE
  FROM [datamart].[dimAssets]
  WHERE AssetsHashKey = '00000000000000000000000000000000'
  ;
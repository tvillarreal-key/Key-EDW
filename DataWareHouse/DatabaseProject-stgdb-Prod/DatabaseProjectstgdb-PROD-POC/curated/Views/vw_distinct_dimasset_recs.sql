CREATE VIEW [curated].[vw_distinct_dimasset_recs] AS
SELECT DISTINCT
    UPPER(CONVERT(char(32), 
        HASHBYTES('MD5',
            UPPER(
                    RTRIM(LTRIM(COALESCE(Asset_Num,'N/A'))
            ))
        ),2
    )) As AssetsHashKey    
    ,UPPER(CONVERT(char(32), 
        HASHBYTES('MD5',
            upper(
                concat(
                    trim(coalesce(Asset_Desc, '')),
                    trim(coalesce(Asset_Class, '')),
                    trim(coalesce(Manufacturer, '')),
                    trim(coalesce(Model, '')),
                    trim(coalesce(Model_Year, '')),
                    trim(coalesce(Series, '')),
                    trim(coalesce(Serial_Num, '')),
                    trim(coalesce(Status, '')),
                    trim(coalesce(Status_Desc, '')),
                    trim(coalesce(Source, '')),
                    coalesce(Marketed, ''),
                    coalesce(Revenue_Track, ''),
                    trim(coalesce(Parent_Asset_Num, '')),
                    trim(coalesce(Child_Relationship_Type, '')),
                    trim(coalesce(W_Status, '')),
                    coalesce(Crew_Needed,''), 
                    coalesce(Avail_Date, '2999-12-31'),
                    coalesce(LastWT_Date, '2999-12-31'),
                    trim(coalesce(Note, '')),
                    trim(coalesce(Customer, '')),
                    trim(coalesce(JobType, '')),
                    trim(coalesce(Supervisor, '')),
                    trim(coalesce(Operator, '')),   
                    trim(coalesce(Directions, '')),
                    trim(coalesce(CompanyMan, '')),
                    trim(coalesce(CompanyManPhone, '')),
                    trim(coalesce(Daylight24HR, '')),
                    trim(coalesce(Size, '')),
                    trim(coalesce(UsedByRigYard, '')),
                    trim(coalesce(UsedByRigNum, '')),
                    coalesce(Source_LastUpdateDate, '2999-12-31'),
                    trim(coalesce(Source_LastUpdateBy, '')) 
                )
            )
        ),2
    )) As AssetsChkSum  
    ,COALESCE(Asset_Num,'N/A') AS Asset_Num
    ,SourceSystem
    ,COALESCE(Asset_Desc,'N/A') AS Asset_Desc
    ,COALESCE(ID,0) AS ID
    ,COALESCE(Manufacturer,'N/A') AS Manufacturer
    ,COALESCE(Model,'N/A') AS Model
    ,COALESCE(Model_Year,'N/A') AS Model_Year
    ,COALESCE(Series,'N/A') AS Series
    ,COALESCE(Serial_Num,'N/A') AS Serial_Num
    ,COALESCE(Source,'N/A') AS Source
    ,COALESCE(Marketed,0) AS Marketed
    ,COALESCE(Revenue_Track,0) AS Revenue_Track
    ,COALESCE(Parent_Asset_Num,'N/A') AS Parent_Asset_Num
    ,COALESCE(Child_Relationship_Type,'N/A') AS Child_Relationship_Type
    ,CASE 
        WHEN [W_Status] = '' OR [W_Status] IS NULL THEN 'N/A'
        ELSE [W_Status]
     END AS [W_Status]    
    ,COALESCE(Crew_Needed,0) AS Crew_Needed
    ,COALESCE(Avail_Date,'2999-12-31') AS Avail_Date
    ,COALESCE(LastWT_Date,'2999-12-31') AS LastWT_Date
    ,CASE 
        WHEN [Note] = '' OR [Note] IS NULL THEN 'N/A'
        ELSE [Note]
     END AS [Note]     
    ,CASE 
        WHEN [Customer] = '' OR [Customer] IS NULL THEN 'N/A'
        ELSE [Customer]
     END AS [Customer]     
    ,CASE 
        WHEN [JobType] = '' OR [JobType] IS NULL THEN 'N/A'
        ELSE [JobType]
     END AS [JobType]
    ,CASE 
        WHEN [Operator] = '' OR [Operator] IS NULL THEN 'N/A'
        ELSE [Operator]
     END AS [Operator]  
    ,CASE 
        WHEN [Supervisor] = '' OR [Supervisor] IS NULL THEN 'N/A'
        ELSE [Supervisor]
     END AS [Supervisor]
    ,COALESCE(Directions,'N/A') AS Directions
    ,COALESCE(CompanyMan,'N/A') AS CompanyMan
    ,COALESCE(CompanyManPhone,'N/A') AS CompanyManPhone
    ,CASE 
        WHEN [Daylight24HR] = '' OR [Daylight24HR] IS NULL THEN 'N/A'
        ELSE [Daylight24HR]
     END AS [Daylight24HR]     
    ,CASE 
        WHEN [Size] = '' OR [Size] IS NULL THEN 'N/A'
        ELSE [Size]
     END AS [Size]
    ,CASE 
        WHEN [UsedByRigYard] = '' OR [UsedByRigYard] IS NULL THEN 'N/A'
        ELSE [UsedByRigYard]
     END AS [UsedByRigYard]
    ,CASE 
        WHEN [UsedByRigNum] = '' OR [UsedByRigNum] IS NULL THEN 'N/A'
        ELSE [UsedByRigNum]
     END AS [UsedByRigNum]
    ,COALESCE(Source_LastUpdateDate,'2999-12-31') AS Source_LastUpdateDate
    ,COALESCE(Source_LastUpdateBy,'N/A') AS Source_LastUpdateBy
    ,getdate() As LoadDate
From staging.Mdm_Assets
;

GO


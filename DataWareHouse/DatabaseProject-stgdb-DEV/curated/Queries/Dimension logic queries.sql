/* 
1. Dim_Location
*/
Select DISTINCT
    UPPER(CONVERT(char(32), 
        HASHBYTES('MD5',
            UPPER(CONCAT(
                    RTRIM(LTRIM(COALESCE(Yard_Code,'N/A'))), ';',
                    RTRIM(LTRIM(COALESCE(Loco_Code,'N/A'))), ';',
                    RTRIM(LTRIM(COALESCE(Loca_Code,'N/A'))), ';',
                    RTRIM(LTRIM(COALESCE(Mktp_Code,'N/A')))
            ))
        ),2
    )) As LocationHashKey    
    ,UPPER(CONVERT(char(32), 
        HASHBYTES('MD5',
            UPPER(CONCAT(
                    RTRIM(LTRIM(COALESCE(Yard_Name,'N/A'))), ';',
                    RTRIM(LTRIM(COALESCE(Loco_Name,'N/A'))), ';',
                    RTRIM(LTRIM(COALESCE(Loca_Name,'N/A'))), ';',
                    RTRIM(LTRIM(COALESCE(Mktp_Name,'N/A')))
            ))
        ),2
    )) As LocationChkSum    
    ,getdate() As LoadDate
    ,NULL As LoadEndDate
    ,COALESCE(Yard_Code,'N/A') AS Yard_Code
    ,COALESCE(Yard_Name,'N/A') AS Yard_Name
    ,COALESCE(Loco_Code,'N/A') AS Loco_Code
    ,COALESCE(Loco_Name,'N/A') AS Loco_Name
    ,COALESCE(Loca_Code,'N/A') AS Loca_Code
    ,COALESCE(Loca_Name,'N/A') AS Loca_Name
    ,COALESCE(Mktp_Code,'N/A') AS Mktp_Code
    ,COALESCE(Mktp_Name,'N/A') AS Mktp_Name
From curated.Mdm_Assets Src
--Where Loca_Code = '3032'
Order By Yard_Code, Loca_Code, Mktp_Code
;

/* 
2. Dim_Lob
*/
Select 
    [Yard_Code] -- 461
    ,[Yard_Name] 
    ,[Lvl1_Code] -- 35
    ,[Lvl1_Name]    
    ,[Lob_Code] --Line_Of_Business 11
    ,[Lob_Name]    
    --,Count(*) Cnt
    ,Getdate() As Load_Dt    
From staging.Mdm_Assets
--Where Loca_Code = '3032'
Group By 
    [Yard_Code]
    ,[Yard_Name] 
    ,[Lvl1_Code]
    ,[Lvl1_Name]    
    ,[Lob_Code] --Line_Of_Business
    ,[Lob_Name] 
--Order By 1,3,5
Having count(*) > 1
;

/* 
3. Dim_Asset
*/
Select 
	[Asset_Num],
	[Manufacturer],
	[Model],
	[Model_Year],
	[Series],
	[Serial_Num],
	[Source],
	[Parent_Asset_Num],
	[Child_Relationship_Type],
    Getdate() As Load_Dt    
From curated.Mdm_Assets
Where Asset_Num In ('2910435','3000381','3139001','1310012','0136630')
;

/* 
4. Dim_Asset_Class 66
*/
Select 
    [Asset_Class],
    [Asset_Desc],
    COUNT(*) CNT
From staging.Mdm_Assets
GROUP BY [Asset_Class],
    [Asset_Desc]
ORDER BY 1 ASC,3 DESC
;

/* 
5. Dim_Asset_Status 18
*/
Select Distinct
	[Status],
	[Status_Desc],
    Getdate() As Load_Dt    
From Dbo.Mdm_Assets
;

/* 
6. Dim_Source 2
*/
Select Distinct
	[Source],
    Getdate() As Load_Dt    
From Dbo.Mdm_Assets
;

/* 
7. Dim_Child_Rel_Type 3
*/
Select Distinct
	[Child_Relationship_Type],
    Getdate() As Load_Dt    
From Dbo.Mdm_Assets
;

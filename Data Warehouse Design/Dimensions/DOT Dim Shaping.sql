/* 
1. DIM_LOCATION
*/
SELECT
    [YARD_CODE]
    ,[YARD_NAME] 
    ,[LOCA_CODE]
    ,[LOCA_NAME]     
    ,[MKTP_CODE]
    ,[MKTP_NAME]
    --,COUNT(*) CNT
    ,getdate() as load_dt    
FROM dbo.MDM_Assets
WHERE LOCA_CODE = '3032'
GROUP BY 
    [YARD_CODE]
    ,[YARD_NAME] 
    ,[LOCA_CODE]
    ,[LOCA_NAME]     
    ,[MKTP_CODE]
    ,[MKTP_NAME]
;

/* 
2. DIM_LOB
*/
SELECT 
    [YARD_CODE]
    ,[YARD_NAME] 
    ,[LVL1_CODE]
    ,[LVL1_NAME]    
    ,[LOB_CODE] --LINE_OF_BUSINESS
    ,[LOB_NAME]    
    --,COUNT(*) CNT
    ,getdate() as load_dt    
FROM dbo.MDM_Assets
WHERE LOCA_CODE = '3032'
GROUP BY 
    [YARD_CODE]
    ,[YARD_NAME] 
    ,[LVL1_CODE]
    ,[LVL1_NAME]    
    ,[LOB_CODE] --LINE_OF_BUSINESS
    ,[LOB_NAME] 
;

/* 
3. DIM_ASSET
*/
SELECT 
	[Asset_Num],
	[Asset_Desc],
	[Asset_Class],
	[Manufacturer],
	[Model],
	[Model_Year],
	[Series],
	[Serial_Num],
	[Status],
	[Status_Desc],
	[Source],
	[Parent_Asset_Num],
	[Child_Relationship_Type],
    getdate() as load_dt    
FROM dbo.MDM_Assets
WHERE ASSET_NUM IN ('2910435','3000381','3139001','1310012','0136630')
;

/* 
4. DIM_ASSET_CLASS 66
*/
SELECT DISTINCT
	[Asset_Class],
    getdate() as load_dt    
FROM dbo.MDM_Assets
;

/* 
5. DIM_ASSET_STATUS 18
*/
SELECT DISTINCT
	[Status],
	[Status_Desc],
    getdate() as load_dt    
FROM dbo.MDM_Assets
;

/* 
6. DIM_SOURCE 2
*/
SELECT DISTINCT
	[Source],
    getdate() as load_dt    
FROM dbo.MDM_Assets
;

/* 
7. DIM_CHILD_REL_TYPE 3
*/
SELECT DISTINCT
	[Child_Relationship_Type],
    getdate() as load_dt    
FROM dbo.MDM_Assets
;



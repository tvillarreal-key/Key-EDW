SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
DROP VIEW IF EXISTS [raw].[vw_chg_raw_assets_recs]
GO
CREATE VIEW [raw].[vw_chg_raw_assets_recs] AS
SELECT 'Insert' process, A.*
FROM [raw].[vw_latest_raw_assets] A 
WHERE A.Asset_Num NOT IN        -- New rec to CDC_Control_Tbl
    (SELECT B.Natural_Key
     FROM [raw].[CDC_Control_Tbl] B
    )
UNION
SELECT 'Update' process,A.*
FROM [raw].[vw_latest_raw_assets] A 
JOIN [raw].[CDC_Control_Tbl] B
    ON A.Asset_Num = B.Natural_Key
WHERE A.Asset_Num IN        -- Updt rec to CDC_Control_Tbl
    (SELECT B.Natural_Key
     FROM 
    )    
;


GO
/*
    ,'RAW_ASSETS' AS Table_Name
    ,[Natural_Key] AS Key_Asset_Num
    ,[HashKey] AS Key_AssetsHashKey
    ,[Update_Date] AS Key_LoadDate
*/
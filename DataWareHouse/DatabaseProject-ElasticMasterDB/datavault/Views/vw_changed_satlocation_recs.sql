SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [datavault].[vw_changed_satlocation_recs] AS
SELECT DISTINCT
    cur.[LocationHashKey]
    ,GETDATE() AS SatLoadDate
    ,cur.[SourceSystem]
    ,CAST(NULL AS DATETIME) AS LoadEndDate
    ,cur.[LocationChkSum]
    ,cur.[LoadDate] AS curExtractDate
    ,cur.[LastSeenDate]
    ,cur.[Yard_Code]
    ,cur.[Yard_Name]
    ,cur.[Loco_Code]
    ,cur.[Loco_Name]
    ,cur.[Loca_Code]
    ,cur.[Loca_Name]
    ,cur.[MKTP_Code]
    ,cur.[MKTP_Name]
,'I' AS Chg_Flag
FROM [curated].[dimLocation] cur 
LEFT JOIN [datavault].[satLocation] sat
ON (cur.LocationHashKey = sat.LocationHashKey
    AND sat.LoadEndDate IS NULL)
WHERE 
    (sat.LocationChkSum IS NULL 
     OR cur.LocationChkSum != sat.LocationChkSum) -- This gets the updated records
;
GO

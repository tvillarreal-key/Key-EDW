SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
DROP VIEW IF EXISTS [datavault].[vw_changed_satasset_recs] 
GO
CREATE VIEW [datavault].[vw_changed_satasset_recs] AS
SELECT DISTINCT
    stg.[AssetsHashKey]
    ,GETDATE() AS SatLoadDate
    ,stg.[SourceSystem]
    ,'' AS LoadEndDate
    ,stg.[AssetsChkSum]
    ,stg.[LoadDate] AS StgExtractDate
    ,stg.[LastSeenDate]
    ,stg.[ID]
    ,stg.[Asset_Num]
    ,stg.[Asset_Desc]
    ,stg.[Asset_Class]
    ,stg.[Manufacturer]
    ,stg.[Model]
    ,stg.[Model_Year]
    ,stg.[Series]
    ,stg.[Serial_Num]
    ,stg.[Status]
    ,stg.[Status_Desc]
    ,stg.[Source]
    ,stg.[Marketed]
    ,stg.[Revenue_Track]
    ,stg.[Parent_Asset_Num]
    ,stg.[Child_Relationship_Type]
    ,stg.[Loco_Code]
    ,stg.[Loco_Name]
    ,stg.[Loca_Code]
    ,stg.[Loca_Name]
    ,stg.[MKTP_Code]
    ,stg.[MKTP_Name]
    ,stg.[LVL1_Code]
    ,stg.[LVL1_Name]
    ,stg.[LOB_Code]
    ,stg.[LOB_Name]
    ,stg.[Dist_Code]
    ,stg.[Dist_Name]
    ,stg.[Mare_Code]
    ,stg.[Mare_Name]
    ,stg.[Yard_Code]
    ,stg.[Yard_Name]
    ,stg.[W_Status]
    ,stg.[Crew_Needed]
    ,stg.[Avail_Date]
    ,stg.[LastWT_Date]
    ,stg.[Mod_Date]
    ,stg.[Mod_User]
    ,stg.[Note]
    ,stg.[Customer]
    ,stg.[JobType]
    ,stg.[Supervisor]
    ,stg.[Operator]
    ,stg.[Directions]
    ,stg.[CompanyMan]
    ,stg.[CompanyManPhone]
    ,stg.[Daylight24HR]
    ,stg.[Size]
    ,stg.[UsedByRigYard]
    ,stg.[UsedByRigNum]
    ,stg.[Source_LastUpdateDate]
    ,stg.[Source_LastUpdateBy]
,'I' AS Chg_Flag
FROM [staging].[MDM_Assets] stg 
LEFT JOIN [datavault].[SatAsset] sat
ON (stg.AssetsHashKey = sat.AssetsHashKey
    AND sat.LoadEndDate IS NULL)
WHERE 
    (sat.AssetsChkSum IS NULL 
     OR stg.AssetsChkSum != sat.AssetsChkSum) -- This gets the updated records
;
GO


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
DROP VIEW IF EXISTS [datavault].[vw_changed_satasset_recs] 
GO
CREATE VIEW [datavault].[vw_changed_satasset_recs] AS
SELECT 
    A.*
,'I' AS Chg_Flag
FROM [staging].[MDM_Assets] A 
LEFT JOIN [datavault].[SatAsset] B
ON A.AssetsHashKey = B.AssetsHashKey
WHERE B.AssetsHashKey IS NULL -- This gets the new records
UNION
SELECT 
    A.[AssetsHashKey]
    ,A.[AssetsChkSum]
    ,A.[LoadDate]
    ,A.[SourceSystem]
    ,A.[LastSeenDate]
    ,A.[ID]
    ,A.[Asset_Num]
    ,A.[Asset_Desc]
    ,A.[Asset_Class]
    ,A.[Manufacturer]
    ,A.[Model]
    ,A.[Model_Year]
    ,A.[Series]
    ,A.[Serial_Num]
    ,A.[Status]
    ,A.[Status_Desc]
    ,A.[Source]
    ,A.[Marketed]
    ,A.[Revenue_Track]
    ,A.[Parent_Asset_Num]
    ,A.[Child_Relationship_Type]
    ,A.[Loco_Code]
    ,A.[Loco_Name]
    ,A.[Loca_Code]
    ,A.[Loca_Name]
    ,A.[MKTP_Code]
    ,A.[MKTP_Name]
    ,A.[LVL1_Code]
    ,A.[LVL1_Name]
    ,A.[LOB_Code]
    ,A.[LOB_Name]
    ,A.[Dist_Code]
    ,A.[Dist_Name]
    ,A.[Mare_Code]
    ,A.[Mare_Name]
    ,A.[Yard_Code]
    ,A.[Yard_Name]
    ,A.[W_Status]
    ,A.[Crew_Needed]
    ,A.[Avail_Date]
    ,A.[LastWT_Date]
    ,A.[Mod_Date]
    ,A.[Mod_User]
    ,A.[Note]
    ,A.[Customer]
    ,A.[JobType]
    ,A.[Supervisor]
    ,A.[Operator]
    ,A.[Directions]
    ,A.[CompanyMan]
    ,A.[CompanyManPhone]
    ,A.[Daylight24HR]
    ,A.[Size]
    ,A.[UsedByRigYard]
    ,A.[UsedByRigNum]
    ,A.[Source_LastUpdateDate]
    ,A.[Source_LastUpdateBy]
,'U' AS Chg_Flag
FROM [staging].[MDM_Assets] A 
LEFT JOIN [datavault].[SatAsset] B
ON A.AssetsHashKey = B.AssetsHashKey
WHERE A.AssetsChkSum != B.AssetsChkSum -- This gets the updated records
;
GO


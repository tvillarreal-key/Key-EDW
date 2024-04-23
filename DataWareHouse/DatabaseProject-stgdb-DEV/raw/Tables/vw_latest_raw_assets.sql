SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
DROP VIEW IF EXISTS [raw].[vw_latest_raw_assets]
GO
CREATE VIEW [raw].[vw_latest_raw_assets] AS
SELECT [AssetsHashKey]
      ,[AssetsChkSum]
      ,[LoadDate]
      ,[SourceSystem]
      ,[LastSeenDate]
      ,[ID]
      ,[Asset_Num]
      ,[Asset_Desc]
      ,[Asset_Class]
      ,[Manufacturer]
      ,[Model]
      ,[Model_Year]
      ,[Series]
      ,[Serial_Num]
      ,[Status]
      ,[Status_Desc]
      ,[Source]
      ,[Marketed]
      ,[Revenue_Track]
      ,[Parent_Asset_Num]
      ,[Child_Relationship_Type]
      ,[Loco_Code]
      ,[Loco_Name]
      ,[Loca_Code]
      ,[Loca_Name]
      ,[MKTP_Code]
      ,[MKTP_Name]
      ,[LVL1_Code]
      ,[LVL1_Name]
      ,[LOB_Code]
      ,[LOB_Name]
      ,[Dist_Code]
      ,[Dist_Name]
      ,[Mare_Code]
      ,[Mare_Name]
      ,[Yard_Code]
      ,[Yard_Name]
      ,[W_Status]
      ,[Crew_Needed]
      ,[Avail_Date]
      ,[LastWT_Date]
      ,[Mod_Date]
      ,[Mod_User]
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
      ,[Source_LastUpdateDate]
      ,[Source_LastUpdateBy]
  FROM [raw].[MDM_Assets]
  WHERE LoadDate IN
    (
        SELECT MAX(LoadDate) MaxLoadDate
        FROM raw.MDM_Assets
    )
;
GO
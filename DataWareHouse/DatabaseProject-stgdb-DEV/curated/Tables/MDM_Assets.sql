SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
DROP TABLE IF EXISTS [curated].[MDM_Assets] 
GO
CREATE TABLE [curated].[MDM_Assets](
	[AssetsHash] [nvarchar](32) NOT NULL,
	[StagingLoadTimestamp] [datetime2](7) NOT NULL,
	[StagingSourceSystem] [nvarchar](50) NOT NULL,
	[RawLoadTimestamp] [datetime2](7) NOT NULL,
	[EffectiveStartDate] [date] NULL,
	[EffectiveEndDate] [date] NULL,
	[CuratedLoadTimestamp] [datetime2](7) NOT NULL,
	[CuratedTransformedBy] [nvarchar](200) NOT NULL,
	[ID] [int] NOT NULL,
	[Asset_Num] [nvarchar](60) NOT NULL,
	[Asset_Desc] [nvarchar](255) NULL,
	[Asset_Class] [nvarchar](255) NULL,
	[Manufacturer] [nvarchar](255) NULL,
	[Model] [nvarchar](255) NULL,
	[Model_Year] [nvarchar](255) NULL,
	[Series] [nvarchar](255) NULL,
	[Serial_Num] [nvarchar](255) NULL,
	[Status] [nvarchar](20) NULL,
	[Status_Desc] [nvarchar](255) NULL,
	[Source] [nvarchar](20) NULL,
	[Marketed] [bit] NULL,
	[Revenue_Track] [bit] NULL,
	[Parent_Asset_Num] [nvarchar](20) NULL,
	[Child_Relationship_Type] [nvarchar](80) NULL,
	[Loco_Code] [nvarchar](20) NULL,
	[Loco_Name] [nvarchar](100) NULL,
	[Loca_Code] [nvarchar](20) NULL,
	[Loca_Name] [nvarchar](100) NULL,
	[MKTP_Code] [nvarchar](20) NULL,
	[MKTP_Name] [nvarchar](100) NULL,
	[LVL1_Code] [nvarchar](20) NULL,
	[LVL1_Name] [nvarchar](100) NULL,
	[LOB_Code] [nvarchar](20) NULL,
	[LOB_Name] [nvarchar](100) NULL,
	[Dist_Code] [nvarchar](20) NULL,
	[Dist_Name] [nvarchar](100) NULL,
	[Mare_Code] [nvarchar](20) NULL,
	[Mare_Name] [nvarchar](100) NULL,
	[Yard_Code] [nvarchar](20) NULL,
	[Yard_Name] [nvarchar](100) NULL,
	[W_Status] [nvarchar](10) NULL,
	[Crew_Needed] [bit] NULL,
	[Avail_Date] [date] NULL,
	[LastWT_Date] [date] NULL,
	[Mod_Date] [date] NULL,
	[Mod_User] [nvarchar](128) NULL,
	[Note] [nvarchar](512) NULL,
	[Customer] [nvarchar](100) NULL,
	[JobType] [nvarchar](50) NULL,
	[Supervisor] [nvarchar](50) NULL,
	[Operator] [nvarchar](50) NULL,
	[Directions] [nvarchar](512) NULL,
	[CompanyMan] [nvarchar](50) NULL,
	[CompanyManPhone] [nvarchar](50) NULL,
	[Daylight24HR] [nvarchar](50) NULL,
	[Size] [nvarchar](50) NULL,
	[UsedByRigYard] [nvarchar](20) NULL,
	[UsedByRigNum] [nvarchar](20) NULL,
	[Source_LastUpdateDate] [datetime2](7) NULL,
	[Source_LastUpdateBy] [nvarchar](128) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
ALTER TABLE [curated].[MDM_Assets] ADD  CONSTRAINT [PK_MDM_Assets] PRIMARY KEY NONCLUSTERED 
(
	[AssetsHash] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO

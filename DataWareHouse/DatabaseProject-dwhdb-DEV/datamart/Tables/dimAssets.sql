SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
DROP TABLE IF EXISTS [datamart].[dimAssets] 
GO
CREATE TABLE [datamart].[Assets](
	[AssetsHashKey] [nvarchar](32) NOT NULL,
	[LoadDate] [datetime2](7) NOT NULL,
	[ID] [int] NOT NULL,
	[Asset_Num] [nvarchar](60) NOT NULL,
	[Asset_Desc] [nvarchar](255) NULL,
	[Manufacturer] [nvarchar](255) NULL,
	[Model] [nvarchar](255) NULL,
	[Model_Year] [nvarchar](255) NULL,
	[Series] [nvarchar](255) NULL,
	[Serial_Num] [nvarchar](255) NULL,
	[Source] [nvarchar](20) NULL,
	[Marketed] [bit] NULL,
	[Revenue_Track] [bit] NULL,
	[Parent_Asset_Num] [nvarchar](20) NULL,
	[Child_Relationship_Type] [nvarchar](80) NULL,
	[W_Status] [nvarchar](10) NULL,
	[Crew_Needed] [bit] NULL,
	[Avail_Date] [date] NULL,
	[LastWT_Date] [date] NULL,
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
CONSTRAINT [PK_MDM_AssetNum] PRIMARY KEY NONCLUSTERED 
(
	[Asset_Num] ASC
) ON [PRIMARY],
) ON [PRIMARY]
GO
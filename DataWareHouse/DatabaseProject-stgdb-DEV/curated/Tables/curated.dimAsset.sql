SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
DROP TABLE IF EXISTS [curated].[dimAsset] 
GO
CREATE TABLE [curated].[dimAsset](
	[AssetsHashKey] [nvarchar](32) NOT NULL,
	[AssetsChkSum] [nvarchar](32) NOT NULL,
	[ID] [int] NOT NULL,
	[Asset_Num] [nvarchar](60) NOT NULL,
	[Asset_Desc] [nvarchar](255) NOT NULL,
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
	[Source_LastUpdateDate] [datetime2](7) NULL,
	[Source_LastUpdateBy] [nvarchar](128) NULL,    
	[LoadDate] [datetime2](7) NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
ALTER TABLE [curated].[dimAsset] ADD  CONSTRAINT [PK_dimAssets] PRIMARY KEY NONCLUSTERED 
(
	[AssetsHashKey] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO

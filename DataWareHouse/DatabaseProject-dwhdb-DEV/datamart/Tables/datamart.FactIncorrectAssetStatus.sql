SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
DROP TABLE IF EXISTS [datamart].[FactIncorrectAssetStatus] 
GO
CREATE TABLE [datamart].[FactIncorrectAssetStatus](
	[AssetsHashKey] [nvarchar](32) NOT NULL,
	[MktPlaceHashKey] [nvarchar](32) NOT NULL,
	[YardHashKey] [nvarchar](32) NOT NULL,
	[AssetClassHashKey] [nvarchar](32) NOT NULL,
	[D365_Status_Code] [nvarchar](20) NULL,
	[D365_Status_Name] [nvarchar](255) NULL,
	[Rig_Status_Code] [nvarchar](10) NULL,
	[Status_Match_Flag] [int] NOT NULL,
	[FactLoadDate] [datetime2](7) NOT NULL
) ON [PRIMARY]
GO

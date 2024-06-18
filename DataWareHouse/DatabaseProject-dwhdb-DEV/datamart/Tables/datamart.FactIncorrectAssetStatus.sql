SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
DROP TABLE IF EXISTS [datamart].[FactIncorrectAssetStatus] 
GO
CREATE TABLE [datamart].[FactIncorrectAssetStatus]
(
    [AssetsHashKey] [nvarchar](32) NOT NULL,
    [MktPlaceHashKey] [nvarchar](32) NOT NULL,
    [YardHashKey] [nvarchar](32) NOT NULL,
    [AssetClassHashKey] [nvarchar](32) NOT NULL,
 	[Status] [nvarchar](20) NULL,
	[Status_Desc] [nvarchar](255) NULL,
	[W_Status] [nvarchar](10) NULL,
	[LoadDate] [datetime2](7) NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO


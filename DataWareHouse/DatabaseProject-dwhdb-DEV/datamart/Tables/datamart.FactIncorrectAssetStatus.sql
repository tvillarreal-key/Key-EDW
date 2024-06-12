CREATE TABLE [datamart].[FactIncorrectAssetStatus]
    [MktPlaceHashKey] [nvarchar](32) NOT NULL,
    [YardHashKey] [nvarchar](32) NOT NULL,
    [AssetClassHashKey] [nvarchar](32) NOT NULL,
    [AssetStatusHashKey] [nvarchar](32) NOT NULL,
	[W_Status] [nvarchar](10) NULL,
 	[Status] [nvarchar](20) NULL,
	[Status_Desc] [nvarchar](255) NULL,
    [LastWT_Date] [date] NULL,
    CONSTRAINT [PK_dimAssetClass] PRIMARY KEY NONCLUSTERED 
(
	[AssetClassKey] ASC
) ON [PRIMARY],
CONSTRAINT [UK_AssetClass] UNIQUE NONCLUSTERED 
(
	[Class_Code] ASC,
    [Class_Name] ASC
) ON [PRIMARY],
) ON [PRIMARY]
GO

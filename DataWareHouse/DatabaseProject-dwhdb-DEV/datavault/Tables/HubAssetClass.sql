SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
DROP TABLE IF EXISTS [datavault].[HubAssetClass] 
GO
CREATE TABLE [datavault].[HubAssetClass](
	[AssetClassHashKey] [nvarchar](32) NOT NULL,
	[LoadDate] [datetime2](7) NOT NULL,
	[SourceSystem] [nvarchar](50) NOT NULL,
    [AssetClass_Code] [nvarchar](20) NOT NULL,
	[LastSeenDate] [datetime2](7) NOT NULL,
CONSTRAINT [PK_HubAssetClass] PRIMARY KEY NONCLUSTERED 
(
	[AssetClassHashKey] ASC
) ON [PRIMARY],
CONSTRAINT [UK_HubAssetClass] UNIQUE NONCLUSTERED 
(
    [AssetClass_Code] ASC
    ,[LoadDate] ASC
    ,[SourceSystem] ASC	
) ON [PRIMARY],
) ON [PRIMARY]
GO
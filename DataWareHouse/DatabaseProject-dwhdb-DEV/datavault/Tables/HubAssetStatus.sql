SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
DROP TABLE IF EXISTS [datavault].[HubAssetStatus] 
GO
CREATE TABLE [datavault].[HubAssetStatus](
	[AssetStatusHashKey] [nvarchar](32) NOT NULL,
	[LoadDate] [datetime2](7) NOT NULL,
	[SourceSystem] [nvarchar](50) NOT NULL,
	[Status_Code] [nvarchar](20) NOT NULL,
	[LastSeenDate] [datetime2](7) NOT NULL,
CONSTRAINT [PK_HubAssetStatus] PRIMARY KEY NONCLUSTERED 
(
	[AssetStatusHashKey] ASC
) ON [PRIMARY],
CONSTRAINT [UK_HubAssetStatus] UNIQUE NONCLUSTERED 
(
    [Status_Code] ASC
) ON [PRIMARY],
) ON [PRIMARY]
GO
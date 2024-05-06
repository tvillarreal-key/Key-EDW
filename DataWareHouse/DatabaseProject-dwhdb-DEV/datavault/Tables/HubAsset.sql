SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
DROP TABLE IF EXISTS [datavault].[HubAsset] 
GO
CREATE TABLE [datavault].[HubAsset](
	[AssetsHashKey] [nvarchar](32) NOT NULL,
	[AssetsChkSum] [nvarchar](32) NOT NULL,
	[LoadDate] [datetime2](7) NOT NULL,
	[SourceSystem] [nvarchar](50) NOT NULL,
	[LastSeenDate] [datetime2](7) NOT NULL,
	[ID] [int] NOT NULL,
	[Asset_Num] [nvarchar](60) NOT NULL,
CONSTRAINT [PK_HubAsset] PRIMARY KEY NONCLUSTERED 
(
	[AssetsHashKey] ASC
) ON [PRIMARY],
) ON [PRIMARY]
GO
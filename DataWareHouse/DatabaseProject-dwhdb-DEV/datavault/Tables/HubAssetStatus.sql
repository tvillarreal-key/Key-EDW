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
	[Yard_Code] [nvarchar](20) NOT NULL,
	[Loco_Code] [nvarchar](20) NULL,
	[Loca_Code] [nvarchar](20) NOT NULL,
	[Mktp_Code] [nvarchar](20) NOT NULL,
	[LastSeenDate] [datetime2](7) NOT NULL,
CONSTRAINT [PK_HubAssetClass] PRIMARY KEY NONCLUSTERED 
(
	[AssetClassHashKey] ASC
) ON [PRIMARY],
CONSTRAINT [UK_HubAssetClass] UNIQUE NONCLUSTERED 
(
	[Yard_Code] ASC,
    [Loco_Code] ASC,
    [Loca_Code] ASC,
    [Mktp_Code] ASC
) ON [PRIMARY],
) ON [PRIMARY]
GO
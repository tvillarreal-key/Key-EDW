SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
DROP TABLE IF EXISTS [invalidated].[MDM_AssetAttr] 
GO
CREATE TABLE [invalidated].[MDM_AssetAttr](
	[AssetAttrHash] [nvarchar](32) NOT NULL,
	[AssetAttrChkSum] [nvarchar](32) NOT NULL,
	[StagingLoadTimestamp] [datetime2](7) NOT NULL,
	[StagingSourceSystem] [nvarchar](50) NOT NULL,
	[RawLoadTimestamp] [datetime2](7) NOT NULL,
	[EffectiveStartDate] [date] NULL,
	[EffectiveEndDate] [date] NULL,
	[CuratedLoadTimestamp] [datetime2](7) NOT NULL,
	[CuratedTransformedBy] [nvarchar](200) NOT NULL,
	[Asset_ID] [int] NOT NULL,
	[Asset_Num] [nvarchar](60) NOT NULL,
	[AttrCode] [nvarchar](50) NOT NULL,
	[AttrValue] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
ALTER TABLE [invalidated].[MDM_AssetAttr] ADD  CONSTRAINT [PK_MDM_AssetAttr] PRIMARY KEY NONCLUSTERED 
(
	[AssetAttrHash] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO

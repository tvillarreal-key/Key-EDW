SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
DROP TABLE IF EXISTS [raw].[MDM_AssetAttr] 
GO
CREATE TABLE [raw].[MDM_AssetAttr](
	[AssetAttrHashKey] [nvarchar](32) NOT NULL,
	[LoadDate] [datetime2](7) NOT NULL,
	[SourceSystem] [nvarchar](50) NOT NULL,
	[LastSeenDate] [datetime2](7) NOT NULL,
	[Asset_ID] [int] NOT NULL,
	[Asset_Num] [nvarchar](60) NOT NULL,
	[AttrCode] [nvarchar](50) NOT NULL,
	[AttrValue] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
ALTER TABLE [raw].[MDM_AssetAttr] ADD  CONSTRAINT [PK_MDM_AssetAttr] PRIMARY KEY NONCLUSTERED 
(
	[AssetAttrHashKey] ASC,
	[LoadDate] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO

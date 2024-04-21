SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
DROP TABLE IF EXISTS [raw].[MDM_AssetAttr] 
GO
CREATE TABLE [raw].[MDM_AssetAttr](
	[AssetAttrHashKey] [nvarchar](32) NOT NULL,
	[AssetAttrChkSum] [nvarchar](32) NOT NULL,
	[LoadDate] [datetime2](7) NOT NULL,
	[SourceSystem] [nvarchar](50) NOT NULL,
	[LastSeenDate] [datetime2](7) NOT NULL,
	[Asset_ID] [int] NOT NULL,
	[Asset_Num] [nvarchar](60) NOT NULL,
	[AttrCode] [nvarchar](50) NOT NULL,
	[AttrValue] [nvarchar](max) NULL,
CONSTRAINT [PK_MDM_AssetAttr] PRIMARY KEY NONCLUSTERED 
(
	[Asset_Num] ASC,
    [AttrCode] ASC
) ON [PRIMARY],
CONSTRAINT [UK_MDM_AssetAttr] UNIQUE NONCLUSTERED 
(
	[AssetAttrHashKey] ASC,
    [LoadDate] ASC
) ON [PRIMARY]
) ON [PRIMARY]
GO

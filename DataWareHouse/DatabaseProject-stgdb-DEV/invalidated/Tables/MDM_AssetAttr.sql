SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- DROP TABLE [invalidated].[MDM_AssetAttr] 
CREATE TABLE [invalidated].[MDM_AssetAttr](
	[AssetAttrHash]  AS (CONVERT([nvarchar](32),hashbytes('MD5',upper(concat(rtrim(ltrim(coalesce([Asset_ID],''))),';',rtrim(ltrim(coalesce([Asset_Num],''))),';',rtrim(ltrim(coalesce([AttrCode],'')))))),(2))),
	[StagingLoadTimestamp] [datetime2](7) NULL,
	[StagingSourceSystem] [nvarchar](50) NULL,
	[RawLoadTimestamp] [datetime2](7) NULL,
	[EffectiveStartDate] [date] NULL,
	[EffectiveEndDate] [date] NULL,
	[CuratedLoadTimestamp] [datetime2](7) NULL,
	[CuratedTransformedBy] [nvarchar](200) NULL,
	[Asset_ID] [int] NOT NULL,
	[Asset_Num] [nvarchar](60) NOT NULL,
	[AttrCode] [nvarchar](50) NOT NULL,
	[AttrValue] [nvarchar](max) NULL
) ON [PRIMARY] 
GO

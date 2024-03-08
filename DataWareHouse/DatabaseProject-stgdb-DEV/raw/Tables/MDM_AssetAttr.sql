SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- DROP TABLE [raw].[MDM_AssetAttr]
CREATE TABLE [raw].[MDM_AssetAttr](
    [AssetAttrHash]            
        AS (CONVERT([nvarchar](32),hashbytes('MD5',
		UPPER(CONCAT(
			RTRIM(LTRIM(COALESCE(Asset_ID, ''))), ';',
			RTRIM(LTRIM(COALESCE(Asset_Num,''))), ';',
			RTRIM(LTRIM(COALESCE(AttrCode,'')))
			))
		),2)),
    [StagingLoadTimestamp]    DATETIME2 (7)  NULL,
    [StagingSourceSystem]     NVARCHAR (50)  NULL,
    [RawLoadTimestamp]        DATETIME2 (7)  NULL,
    [EffectiveStartDate]      DATE           NULL,
    [EffectiveEndDate]        DATE           NULL,
    [CuratedLoadTimestamp]    DATETIME2 (7)  NULL,
    [CuratedTransformedBy]    NVARCHAR (200) NULL,
	[Asset_ID] [int] NOT NULL,
	[Asset_Num] [nvarchar](60) NOT NULL,
	[AttrCode] [nvarchar](50) NOT NULL,
	[AttrValue] [nvarchar](max) NULL
) ON [PRIMARY] 
GO
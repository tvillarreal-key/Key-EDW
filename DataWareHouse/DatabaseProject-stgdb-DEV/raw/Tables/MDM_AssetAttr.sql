SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
DROP TABLE IF EXISTS [raw].[MDM_AssetAttr]
GO
CREATE TABLE [raw].[MDM_AssetAttr](
    [AssetsAttrHash]          NVARCHAR(32)   NOT NULL,
    [StagingLoadTimestamp]    DATETIME2 (7)  NOT NULL,
    [StagingSourceSystem]     NVARCHAR (50)  NOT NULL,
    [RawLoadTimestamp]        DATETIME2 (7)  NOT NULL,
    [EffectiveStartDate]      DATE           NULL,
    [EffectiveEndDate]        DATE           NULL,
    [CuratedLoadTimestamp]    DATETIME2 (7)  NULL,
    [CuratedTransformedBy]    NVARCHAR (200) NULL,
	[Asset_ID] 				  INT	 		 NOT NULL,
	[Asset_Num] 			  NVARCHAR (60)  NOT NULL,
	[AttrCode] 				  NVARCHAR (50)  NOT NULL,
	[AttrValue] 			  NVARCHAR (max) NULL,
    CONSTRAINT [PK_MDM_AssetAttr] PRIMARY KEY NONCLUSTERED
    (
        [AssetsAttrHash] ASC
    )
)
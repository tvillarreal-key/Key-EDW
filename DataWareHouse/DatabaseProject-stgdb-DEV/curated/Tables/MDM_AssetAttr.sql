SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
DROP TABLE IF EXISTS [curated].[MDM_AssetAttr]
GO
CREATE TABLE [curated].[MDM_AssetAttr](
    [AssetsHash]              NVARCHAR(32)   NOT NULL,
    [StagingLoadTimestamp]    DATETIME2 (7)  NOT NULL,
    [StagingSourceSystem]     NVARCHAR (50)  NOT NULL,
    [RawLoadTimestamp]        DATETIME2 (7)  NOT NULL,
    [EffectiveStartDate]      DATE           NULL,
    [EffectiveEndDate]        DATE           NULL,
    [CuratedLoadTimestamp]    DATETIME2 (7)  NOT NULL,
    [CuratedTransformedBy]    NVARCHAR (200) NOT NULL,
	[Asset_ID] 				  INT	 		 NOT NULL,
	[Asset_Num] 			  NVARCHAR (60)  NOT NULL,
	[AttrCode] 				  NVARCHAR (50)  NOT NULL,
	[AttrValue] 			  NVARCHAR (max) NULL,
    CONSTRAINT [PK_MDM_AssetAttr] PRIMARY KEY NONCLUSTERED
    (
        [Asset_ID], [Asset_Num], [AttrCode] ASC
    )
)
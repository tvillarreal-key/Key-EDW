CREATE TABLE [invalidated].[MDM_AssetAttr] (
    [AssetAttrHash]        NVARCHAR (32)  NOT NULL,
    [AssetAttrChkSum]      NVARCHAR (32)  NOT NULL,
    [StagingLoadTimestamp] DATETIME2 (7)  NOT NULL,
    [StagingSourceSystem]  NVARCHAR (50)  NOT NULL,
    [RawLoadTimestamp]     DATETIME2 (7)  NOT NULL,
    [EffectiveStartDate]   DATE           NULL,
    [EffectiveEndDate]     DATE           NULL,
    [CuratedLoadTimestamp] DATETIME2 (7)  NOT NULL,
    [CuratedTransformedBy] NVARCHAR (200) NOT NULL,
    [Asset_ID]             INT            NOT NULL,
    [Asset_Num]            NVARCHAR (60)  NOT NULL,
    [AttrCode]             NVARCHAR (50)  NOT NULL,
    [AttrValue]            NVARCHAR (MAX) NULL,
    CONSTRAINT [PK_MDM_AssetAttr] PRIMARY KEY NONCLUSTERED ([AssetAttrHash] ASC)
);


GO


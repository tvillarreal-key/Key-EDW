CREATE TABLE [curated].[MDM_AssetAttr] (
    [AssetAttrHashKey] NVARCHAR (32)  NOT NULL,
    [AssetAttrChkSum]  NVARCHAR (32)  NOT NULL,
    [LoadDate]         DATETIME2 (7)  NOT NULL,
    [SourceSystem]     NVARCHAR (50)  NOT NULL,
    [LastSeenDate]     DATETIME2 (7)  NOT NULL,
    [Asset_ID]         INT            NOT NULL,
    [Asset_Num]        NVARCHAR (60)  NOT NULL,
    [AttrCode]         NVARCHAR (50)  NOT NULL,
    [AttrValue]        NVARCHAR (MAX) NULL,
    CONSTRAINT [PK_MDM_AssetAttr] PRIMARY KEY NONCLUSTERED ([Asset_Num] ASC, [AttrCode] ASC)
);


GO


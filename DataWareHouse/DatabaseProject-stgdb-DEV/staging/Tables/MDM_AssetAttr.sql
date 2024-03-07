CREATE TABLE [staging].[MDM_AssetAttr] (
    [Asset_ID]  INT            NOT NULL,
    [Asset_Num] NVARCHAR (60)  NOT NULL,
    [AttrCode]  NVARCHAR (50)  NOT NULL,
    [AttrValue] NVARCHAR (MAX) NULL,
    CONSTRAINT [PK_MDM_AssetAttr] PRIMARY KEY CLUSTERED ([Asset_Num] ASC, [AttrCode] ASC, [Asset_ID] ASC)
);


GO


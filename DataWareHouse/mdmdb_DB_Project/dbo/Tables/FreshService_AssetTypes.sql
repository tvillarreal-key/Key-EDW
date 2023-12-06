CREATE TABLE [dbo].[FreshService_AssetTypes] (
    [id]                   NVARCHAR (20)  NOT NULL,
    [name]                 NVARCHAR (MAX) NULL,
    [parent_asset_type_id] NVARCHAR (20)  NULL,
    [visible]              NVARCHAR (20)  NULL,
    [description]          NVARCHAR (MAX) NULL,
    [created_at]           NVARCHAR (20)  NULL,
    [updated_at]           NVARCHAR (20)  NULL
);
GO

ALTER TABLE [dbo].[FreshService_AssetTypes]
    ADD CONSTRAINT [PK_FreshService_AssetTypes] PRIMARY KEY CLUSTERED ([id] ASC);
GO


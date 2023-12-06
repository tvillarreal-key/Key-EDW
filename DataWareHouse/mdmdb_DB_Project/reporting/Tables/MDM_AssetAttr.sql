CREATE TABLE [reporting].[MDM_AssetAttr] (
    [asset_id]    INT            NOT NULL,
    [asset_num]   NVARCHAR (60)  NOT NULL,
    [attr_code]   NVARCHAR (50)  NOT NULL,
    [attr_value]  NVARCHAR (MAX) NULL,
    [upload_date] DATETIME       NULL
);
GO


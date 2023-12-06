CREATE TABLE [reporting].[D365_AssetAttachments] (
    [document_id]             NVARCHAR (50)  NOT NULL,
    [default_attachment]      NVARCHAR (MAX) NULL,
    [file_name]               NVARCHAR (MAX) NULL,
    [file_type]               NVARCHAR (MAX) NULL,
    [asset_num]               NVARCHAR (MAX) NULL,
    [kex_expiration_datetime] DATETIME       NULL,
    [name]                    NVARCHAR (MAX) NULL,
    [notes]                   NVARCHAR (MAX) NULL,
    [parent_asset_num]        NVARCHAR (MAX) NULL,
    [path]                    NVARCHAR (MAX) NULL,
    [restriction]             NVARCHAR (MAX) NULL,
    [type_id]                 NVARCHAR (MAX) NULL,
    [upload_date]             DATETIME       NULL
);
GO


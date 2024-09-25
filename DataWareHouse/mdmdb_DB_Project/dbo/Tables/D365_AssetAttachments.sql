CREATE TABLE [dbo].[D365_AssetAttachments] (
    [DOCUMENTID]             NVARCHAR (50)  NOT NULL,
    [DEFAULTATTACHMENT]      TEXT           NULL,
    [FILENAME]               TEXT           NULL,
    [FILETYPE]               TEXT           NULL,
    [FIXEDASSETID]           TEXT           NULL,
    [KEX_EXPIRATIONDATETIME] DATETIME       NULL,
    [NAME]                   TEXT           NULL,
    [NOTES]                  NVARCHAR (MAX) NULL,
    [OBJECTID]               TEXT           NULL,
    [PATH]                   TEXT           NULL,
    [RESTRICTION]            TEXT           NULL,
    [TYPEID]                 TEXT           NULL,
    [MODIFIEDDATETIME]       DATETIME       NULL,
    [MODIFIEDBY]             TEXT           NULL,
    [ExecutionRunId]         NVARCHAR (100) NULL,
    CONSTRAINT [PK_D365_AssetAttachments] PRIMARY KEY CLUSTERED ([DOCUMENTID] ASC)
);
GO

ALTER TABLE [dbo].[D365_AssetAttachments]
    ADD CONSTRAINT [PK_D365_AssetAttachments] PRIMARY KEY CLUSTERED ([DOCUMENTID] ASC);
GO


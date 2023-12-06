CREATE TABLE [dbo].[D365_POHeaderAttachments2] (
    [DOCUMENTID]                 NVARCHAR (50) NOT NULL,
    [ACCESSRESTRICTION]          TEXT          NULL,
    [ATTACHMENTDESCRIPTION]      TEXT          NULL,
    [DOCUMENTATTACHMENTTYPECODE] TEXT          NULL,
    [FILENAME]                   TEXT          NULL,
    [FILETYPE]                   TEXT          NULL,
    [ISDEFAULTATTACHMENT]        TEXT          NULL,
    [NOTES]                      TEXT          NULL,
    [PATH]                       TEXT          NULL,
    [PURCHASEORDERNUMBER]        INT           NULL,
    [AttachmentFileName]         TEXT          NULL
);
GO

ALTER TABLE [dbo].[D365_POHeaderAttachments2]
    ADD CONSTRAINT [PK_D365_POHeaderAttachments2] PRIMARY KEY CLUSTERED ([DOCUMENTID] ASC);
GO


CREATE TABLE [dbo].[D365_POHeaderAttachments] (
    [DOCUMENTID]                 NVARCHAR (50) NOT NULL,
    [ACCESSRESTRICTION]          VARCHAR (20)  NULL,
    [ATTACHMENTDESCRIPTION]      VARCHAR (MAX) NULL,
    [DOCUMENTATTACHMENTTYPECODE] VARCHAR (20)  NULL,
    [FILENAME]                   VARCHAR (MAX) NULL,
    [FILETYPE]                   VARCHAR (10)  NULL,
    [ISDEFAULTATTACHMENT]        VARCHAR (10)  NULL,
    [NOTES]                      VARCHAR (MAX) NULL,
    [PATH]                       VARCHAR (MAX) NULL,
    [PURCHASEORDERNUMBER]        VARCHAR (50)  NULL,
    [AttachmentFileName]         VARCHAR (50)  NULL
);
GO


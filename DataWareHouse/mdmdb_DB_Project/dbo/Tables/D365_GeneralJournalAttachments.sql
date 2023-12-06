CREATE TABLE [dbo].[D365_GeneralJournalAttachments] (
    [DOCUMENTID]           NVARCHAR (50) NOT NULL,
    [DEFAULTATTACHMENT]    TEXT          NULL,
    [FILENAME]             TEXT          NULL,
    [FILETYPE]             TEXT          NULL,
    [JOURNALBATCHNUMBER]   TEXT          NULL,
    [NAME]                 TEXT          NULL,
    [NOTES]                TEXT          NULL,
    [RESTRICTION]          TEXT          NULL,
    [TYPEID]               TEXT          NULL,
    [FileContentsFileName] TEXT          NULL,
    [PATH]                 TEXT          NULL
);
GO

ALTER TABLE [dbo].[D365_GeneralJournalAttachments]
    ADD CONSTRAINT [PK_D365_GeneralJournalAttachments] PRIMARY KEY CLUSTERED ([DOCUMENTID] ASC);
GO


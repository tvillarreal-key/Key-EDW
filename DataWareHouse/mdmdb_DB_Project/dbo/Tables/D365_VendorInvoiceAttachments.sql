CREATE TABLE [dbo].[D365_VendorInvoiceAttachments] (
    [DOCUMENTID]           VARCHAR (50) NOT NULL,
    [DEFAULTATTACHMENT]    TEXT         NOT NULL,
    [FILENAME]             TEXT         NULL,
    [FILETYPE]             TEXT         NULL,
    [HEADERREFERENCE]      TEXT         NOT NULL,
    [NAME]                 TEXT         NOT NULL,
    [NOTES]                TEXT         NOT NULL,
    [ORDERACCOUNT]         INT          NOT NULL,
    [PATH]                 TEXT         NULL,
    [RESTRICTION]          TEXT         NOT NULL,
    [TYPEID]               TEXT         NOT NULL,
    [FileContentsFileName] TEXT         NULL,
    [Insert_Date]          VARCHAR (50) NULL,
    [Insert_CorrID]        VARCHAR (50) NULL
);
GO

ALTER TABLE [dbo].[D365_VendorInvoiceAttachments]
    ADD CONSTRAINT [PK_D365_VendorInvoiceAttachments] PRIMARY KEY CLUSTERED ([DOCUMENTID] ASC);
GO


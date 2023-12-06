CREATE TABLE [dbo].[D365_VendorJournalLines] (
    [JOURNALBATCHNUMBER]           VARCHAR (50)    NULL,
    [LINENUMBER]                   NUMERIC (18, 3) NULL,
    [ACCOUNTDISPLAYVALUE]          VARCHAR (50)    NULL,
    [ASSETID]                      VARCHAR (50)    NULL,
    [ASSETTRANSTYPE]               VARCHAR (50)    NULL,
    [CREDIT]                       NUMERIC (18, 6) NULL,
    [CURRENCY]                     VARCHAR (10)    NULL,
    [DATE]                         VARCHAR (20)    NULL,
    [DEFAULTDIMENSIONDISPLAYVALUE] VARCHAR (50)    NULL,
    [DELIVERYDATE]                 VARCHAR (20)    NULL,
    [DESCRIPTION]                  VARCHAR (MAX)   NULL,
    [DUEDATE]                      VARCHAR (20)    NULL,
    [INVOICE]                      VARCHAR (50)    NULL,
    [INVOICEDATE]                  VARCHAR (20)    NULL,
    [OFFSETACCOUNTDISPLAYVALUE]    VARCHAR (50)    NULL,
    [TRANSACTIONTYPE]              VARCHAR (50)    NULL,
    [VOUCHER]                      VARCHAR (50)    NULL
);
GO


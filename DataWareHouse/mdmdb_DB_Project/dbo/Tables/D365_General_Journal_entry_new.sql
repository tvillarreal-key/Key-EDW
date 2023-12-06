CREATE TABLE [dbo].[D365_General_Journal_entry_new] (
    [GENERALJOURNALACCOUNTENTRYRECID] FLOAT (53)    NOT NULL,
    [ACCOUNTDISPLAYVALUE]             TEXT          NOT NULL,
    [ACCOUNTINGCURRENCYAMOUNT]        FLOAT (53)    NOT NULL,
    [ACCOUNTINGDATE]                  DATETIME2 (7) NOT NULL,
    [CUSTOMERACCOUNT]                 TEXT          NULL,
    [CUSTOMERNAME]                    TEXT          NULL,
    [DESCRIPTION]                     TEXT          NULL,
    [DOCUMENTDATE]                    DATETIME2 (7) NOT NULL,
    [DOCUMENTNUMBER]                  TEXT          NULL,
    [ISCORRECTION]                    TEXT          NOT NULL,
    [ISCREDIT]                        TEXT          NOT NULL,
    [JOURNALCATEGORY]                 TEXT          NOT NULL,
    [JOURNALNUMBER]                   TEXT          NOT NULL,
    [LEDGERACCOUNT]                   TEXT          NOT NULL,
    [LEDGERNAME]                      TEXT          NOT NULL,
    [POSTINGLAYER]                    TEXT          NOT NULL,
    [POSTINGTYPE]                     TEXT          NOT NULL,
    [QUANTITY]                        FLOAT (53)    NOT NULL,
    [REPORTINGCURRENCYAMOUNT]         FLOAT (53)    NOT NULL,
    [TRANSACTIONCURRENCYAMOUNT]       FLOAT (53)    NOT NULL,
    [TRANSACTIONCURRENCYCODE]         TEXT          NOT NULL,
    [TRANSACTIONCURRENCYCREDITAMOUNT] FLOAT (53)    NOT NULL,
    [TRANSACTIONCURRENCYDEBITAMOUNT]  FLOAT (53)    NOT NULL,
    [VENDORACCOUNT]                   INT           NULL,
    [VENDORNAME]                      TEXT          NULL,
    [VOUCHER]                         TEXT          NOT NULL
);
GO

ALTER TABLE [dbo].[D365_General_Journal_entry_new]
    ADD CONSTRAINT [PK_D365_General_Journal_entry_new] PRIMARY KEY CLUSTERED ([GENERALJOURNALACCOUNTENTRYRECID] ASC);
GO


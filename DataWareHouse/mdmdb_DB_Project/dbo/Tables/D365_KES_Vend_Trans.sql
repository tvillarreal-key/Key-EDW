CREATE TABLE [dbo].[D365_KES_Vend_Trans] (
    [JOURNALNUM]              VARCHAR (50)   NULL,
    [ACCOUNTNUM]              INT            NULL,
    [AMOUNTCUR]               FLOAT (53)     NULL,
    [AMOUNTMST]               FLOAT (53)     NULL,
    [APPROVED]                TEXT           NULL,
    [APPROVEDDATE]            DATETIME2 (7)  NULL,
    [APPROVER]                TEXT           NULL,
    [ARRIVAL]                 TEXT           NULL,
    [CANCEL]                  TEXT           NULL,
    [CLOSED]                  DATETIME2 (7)  NULL,
    [COMPANYBANKACCOUNTID]    TEXT           NULL,
    [CORRECT]                 TEXT           NULL,
    [CREATEDBY1]              TEXT           NULL,
    [CREATEDDATETIME1]        DATETIME2 (7)  NULL,
    [CREATEDTRANSACTIONID1]   FLOAT (53)     NULL,
    [CURRENCYCODE]            TEXT           NULL,
    [DATAAREAID1]             TEXT           NULL,
    [DOCUMENTDATE]            DATETIME2 (7)  NULL,
    [DOCUMENTNUM]             VARCHAR (50)   NULL,
    [DUEDATE]                 DATETIME2 (7)  NULL,
    [EXCHADJUSTMENT]          FLOAT (53)     NULL,
    [EXCHRATE]                FLOAT (53)     NULL,
    [INVOICE]                 VARCHAR (50)   NULL,
    [INVOICEPROJECT]          TEXT           NULL,
    [LASTSETTLEACCOUNTNUM]    INT            NULL,
    [LASTSETTLECOMPANY]       TEXT           NULL,
    [LASTSETTLEDATE]          DATETIME2 (7)  NULL,
    [LASTSETTLEVOUCHER]       TEXT           NULL,
    [MODIFIEDBY1]             TEXT           NULL,
    [MODIFIEDDATETIME1]       DATETIME2 (7)  NULL,
    [MODIFIEDTRANSACTIONID1]  FLOAT (53)     NULL,
    [PAYMMODE]                TEXT           NULL,
    [PAYMREFERENCE]           TEXT           NULL,
    [PAYMSPEC]                TEXT           NULL,
    [PAYMTERM]                TEXT           NULL,
    [POSTINGPROFILE]          TEXT           NULL,
    [PREPAYMENT]              TEXT           NULL,
    [PROMISSORYNOTESTATUS]    TEXT           NULL,
    [RECID1]                  FLOAT (53)     NOT NULL,
    [SETTLEAMOUNTCUR]         FLOAT (53)     NULL,
    [SETTLEAMOUNTMST]         FLOAT (53)     NULL,
    [THIRDPARTYBANKACCOUNTID] TEXT           NULL,
    [TRANSDATE]               DATETIME2 (7)  NULL,
    [TRANSTYPE]               TEXT           NULL,
    [TXT]                     TEXT           NULL,
    [VOUCHER]                 TEXT           NULL,
    [BATCH_LOADED]            NVARCHAR (100) NULL,
    [ExecutionRunId]          NVARCHAR (100) NULL,
    CONSTRAINT [PK_D365_KES_Vend_Trans] PRIMARY KEY CLUSTERED ([RECID1] ASC)
);
GO

ALTER TABLE [dbo].[D365_KES_Vend_Trans]
    ADD CONSTRAINT [PK_D365_KES_Vend_Trans] PRIMARY KEY CLUSTERED ([RECID1] ASC);
GO


CREATE TABLE [dbo].[LOAD_D365_EXPENSE_TBL] (
    [JOURNALNUMBER]           TEXT           NOT NULL,
    [VOUCHER]                 TEXT           NOT NULL,
    [ACCOUNTINGDATE]          DATETIME2 (7)  NOT NULL,
    [LEDGERACCOUNT]           TEXT           NOT NULL,
    [YARD]                    VARCHAR (3)    NULL,
    [YARD_NAME]               VARCHAR (MAX)  NULL,
    [LOCATION]                VARCHAR (4)    NULL,
    [LOB_ID]                  VARCHAR (4)    NULL,
    [FUTURE]                  VARCHAR (4)    NULL,
    [GL_ACCOUNT]              VARCHAR (6)    NULL,
    [LEGAL_ENTITY]            VARCHAR (3)    NULL,
    [MarketPlace]             VARCHAR (MAX)  NULL,
    [LOB]                     VARCHAR (MAX)  NULL,
    [Level1]                  NVARCHAR (50)  NULL,
    [Level2]                  NVARCHAR (50)  NULL,
    [Level3]                  NVARCHAR (100) NULL,
    [Level_Of_Detail]         VARCHAR (1)    NULL,
    [NAME]                    VARCHAR (MAX)  NULL,
    [DESCRIPTION]             TEXT           NULL,
    [REPORTINGCURRENCYAMOUNT] FLOAT (53)     NOT NULL,
    [POSTINGTYPE]             TEXT           NOT NULL,
    [DOCUMENTNUMBER]          TEXT           NULL,
    [QUANTITY]                FLOAT (53)     NOT NULL,
    [VENDORACCOUNT]           TEXT           NULL,
    [VENDORNAME]              TEXT           NULL
);
GO


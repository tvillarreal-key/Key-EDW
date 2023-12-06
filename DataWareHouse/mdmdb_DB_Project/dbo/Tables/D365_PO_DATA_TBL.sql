CREATE TABLE [dbo].[D365_PO_DATA_TBL] (
    [PURCHASEORDERNUMBER]        VARCHAR (20)    NULL,
    [ACCOUNTINGDATE]             DATETIME2 (7)   NULL,
    [YARD]                       VARCHAR (3)     NULL,
    [ORDERVENDORNUMBER]          NVARCHAR (MAX)  NULL,
    [VENDOR]                     VARCHAR (MAX)   NULL,
    [VENDORORDERREFERENCE]       VARCHAR (MAX)   NULL,
    [MarketPlace]                VARCHAR (MAX)   NULL,
    [YARD_NAME]                  VARCHAR (MAX)   NULL,
    [GL_Account]                 INT             NULL,
    [ACCOUNTCATEGORYDESCRIPTION] VARCHAR (MAX)   NULL,
    [NAME]                       VARCHAR (MAX)   NULL,
    [INVOICE_AMOUNT]             FLOAT (53)      NULL,
    [PO_AMOUNT]                  NUMERIC (18, 6) NULL,
    [NON_PO_AMOUNT]              FLOAT (53)      NOT NULL
);
GO


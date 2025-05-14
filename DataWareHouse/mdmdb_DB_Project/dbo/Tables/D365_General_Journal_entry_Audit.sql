CREATE TABLE [dbo].[D365_General_Journal_entry_Audit] (
    [PostDate]                  VARCHAR (50)    NULL,
    [MainAccount]               VARCHAR (50)    NULL,
    [Journal_number]            VARCHAR (50)    NULL,
    [Voucher]                   VARCHAR (50)    NULL,
    [Document]                  VARCHAR (50)    NULL,
    [Document_date]             VARCHAR (50)    NULL,
    [Posting_type]              VARCHAR (50)    NULL,
    [Account_entry_description] VARCHAR (200)   NULL,
    [Ledger_account]            VARCHAR (50)    NULL,
    [Main_account]              VARCHAR (50)    NULL,
    [Main_account_name]         VARCHAR (50)    NULL,
    [Amount]                    DECIMAL (18, 2) NULL,
    [Currency]                  VARCHAR (50)    NULL,
    [Monetary_amount]           DECIMAL (18, 2) NULL,
    [Document_type]             VARCHAR (50)    NULL,
    [Transaction_type]          VARCHAR (50)    NULL
);
GO


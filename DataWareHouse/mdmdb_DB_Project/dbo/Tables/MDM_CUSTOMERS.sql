CREATE TABLE [dbo].[MDM_CUSTOMERS] (
    [ID]               INT            NOT NULL,
    [TYPE]             NVARCHAR (50)  NULL,
    [CUST_NUMBER]      NVARCHAR (50)  NULL,
    [NAME]             NVARCHAR (250) NULL,
    [STATUS]           TINYINT        NULL,
    [CURRENCY]         NVARCHAR (50)  NULL,
    [AVAILABLE_CREDIT] NUMERIC (18)   NULL,
    [PAYMENT_MODE]     NVARCHAR (50)  NULL,
    [PHONE]            NVARCHAR (50)  NULL,
    [FAX]              NVARCHAR (50)  NULL,
    [PARENT_ID]        INT            NULL,
    [SOURCE]           NVARCHAR (50)  NULL,
    [KEYOPS_ID]        NVARCHAR (50)  NULL,
    [SF_ID]            NVARCHAR (50)  NULL,
    [SF_MDM_ROWID]     INT            NULL,
    [SF_ID2]           NVARCHAR (50)  NULL,
    [SF_STATUS]        NVARCHAR (50)  NULL
);
GO

ALTER TABLE [dbo].[MDM_CUSTOMERS]
    ADD CONSTRAINT [PK_MDM_CUSTOMERS] PRIMARY KEY CLUSTERED ([ID] ASC);
GO


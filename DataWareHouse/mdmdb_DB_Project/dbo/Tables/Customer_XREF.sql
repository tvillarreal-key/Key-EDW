CREATE TABLE [dbo].[Customer_XREF] (
    [RowID]           INT           IDENTITY (1, 1) NOT NULL,
    [CustomerNumber]  NVARCHAR (20) NULL,
    [CustomerName]    NVARCHAR (50) NULL,
    [DUNSNumber]      NVARCHAR (10) NULL,
    [HOLD]            NVARCHAR (4)  NULL,
    [EDIFlag]         INT           NULL,
    [Routing]         NVARCHAR (10) NULL,
    [KeyContactName]  NVARCHAR (50) NULL,
    [KeyContactEmail] NVARCHAR (50) NULL,
    [BldInvoiceImage] NVARCHAR (6)  NULL
);
GO

ALTER TABLE [dbo].[Customer_XREF]
    ADD CONSTRAINT [PK_ttpuser.Customer_XREF] PRIMARY KEY CLUSTERED ([RowID] ASC);
GO


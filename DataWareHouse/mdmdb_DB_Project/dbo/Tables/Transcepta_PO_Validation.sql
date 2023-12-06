CREATE TABLE [dbo].[Transcepta_PO_Validation] (
    [Last_Update_Date] DATETIME        NULL,
    [PO_Number]        VARCHAR (7)     NULL,
    [Vendor_Number]    VARCHAR (10)    NULL,
    [Vendor_Name]      VARCHAR (50)    NULL,
    [PO_Status]        VARCHAR (10)    NULL,
    [PO_Amount]        NUMERIC (10, 2) NULL,
    [Currency]         VARCHAR (3)     NULL
);
GO


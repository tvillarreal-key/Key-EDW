CREATE TABLE [dbo].[D365_POLines] (
    [PURCHASEORDERNUMBER]            VARCHAR (20)    NULL,
    [LINENUMBER]                     INT             NULL,
    [ITEMNUMBER]                     VARCHAR (50)    NULL,
    [LINEAMOUNT]                     NUMERIC (18, 6) NULL,
    [PROCUREMENTPRODUCTCATEGORYNAME] VARCHAR (MAX)   NULL
);
GO


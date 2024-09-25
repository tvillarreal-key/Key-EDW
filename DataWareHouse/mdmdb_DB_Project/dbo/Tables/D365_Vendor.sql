CREATE TABLE [dbo].[D365_Vendor] (
    [VENDORACCOUNTNUMBER]                    VARCHAR (20)   NULL,
    [DEFAULTOFFSETLEDGERACCOUNTDISPLAYVALUE] VARCHAR (20)   NULL,
    [INVOICEVENDORACCOUNTNUMBER]             VARCHAR (MAX)  NULL,
    [NAMECONTROL]                            VARCHAR (MAX)  NULL,
    [VENDORKNOWNASNAME]                      VARCHAR (MAX)  NULL,
    [VENDORORGANIZATIONNAME]                 VARCHAR (MAX)  NULL,
    [VENDORPARTYTYPE]                        VARCHAR (20)   NULL,
    [VENDORSEARCHNAME]                       VARCHAR (MAX)  NULL,
    [ExecutionRunId]                         NVARCHAR (100) NULL
);
GO


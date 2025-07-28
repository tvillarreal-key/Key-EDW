CREATE TABLE [dbo].[Basis_TicketAccruals] (
    [office]                        VARCHAR (20)    NULL,
    [ticket Number]                 VARCHAR (50)    NULL,
    [closeddate]                    VARCHAR (30)    NULL,
    [ddate]                         VARCHAR (30)    NULL,
    [manual Accrual Amount]         NUMERIC (18, 2) NULL,
    [invno]                         VARCHAR (50)    NULL,
    [invdate]                       VARCHAR (30)    NULL,
    [invc_approved]                 VARCHAR (10)    NULL,
    [closed]                        VARCHAR (10)    NULL,
    [invc_voided]                   VARCHAR (10)    NULL,
    [processed_True_False]          VARCHAR (10)    NULL,
    [customer]                      VARCHAR (100)   NULL,
    [job_type]                      VARCHAR (100)   NULL,
    [tick_type]                     VARCHAR (50)    NULL,
    [location]                      VARCHAR (50)    NULL,
    [loB_ERP]                       VARCHAR (50)    NULL,
    [le]                            VARCHAR (50)    NULL,
    [department]                    VARCHAR (50)    NULL,
    [invoiceStatus]                 VARCHAR (50)    NULL,
    [corpCustNum]                   VARCHAR (50)    NULL,
    [corpCustName]                  VARCHAR (100)   NULL,
    [invoice_Pre_Tax_Total_Rounded] NUMERIC (18, 2) NULL,
    [posted_on]                     DATETIME        NULL,
    [pe_date]                       VARCHAR (10)    NULL
);
GO


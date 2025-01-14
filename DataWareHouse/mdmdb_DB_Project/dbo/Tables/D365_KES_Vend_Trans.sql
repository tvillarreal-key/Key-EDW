SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[D365_KES_Vend_Trans](
	[JOURNALNUM] [varchar](50) NULL,
	[ACCOUNTNUM] [int] NULL,
	[AMOUNTCUR] [float] NULL,
	[AMOUNTMST] [float] NULL,
	[APPROVED] [text] NULL,
	[APPROVEDDATE] [datetime2](7) NULL,
	[APPROVER] [text] NULL,
	[ARRIVAL] [text] NULL,
	[CANCEL] [text] NULL,
	[CLOSED] [datetime2](7) NULL,
	[COMPANYBANKACCOUNTID] [text] NULL,
	[CORRECT] [text] NULL,
	[CREATEDBY1] [text] NULL,
	[CREATEDDATETIME1] [datetime2](7) NULL,
	[CREATEDTRANSACTIONID1] [float] NULL,
	[CURRENCYCODE] [text] NULL,
	[DATAAREAID1] [text] NULL,
	[DOCUMENTDATE] [datetime2](7) NULL,
	[DOCUMENTNUM] [varchar](50) NULL,
	[DUEDATE] [datetime2](7) NULL,
	[EXCHADJUSTMENT] [float] NULL,
	[EXCHRATE] [float] NULL,
	[INVOICE] [varchar](50) NULL,
	[INVOICEPROJECT] [text] NULL,
	[LASTSETTLEACCOUNTNUM] [int] NULL,
	[LASTSETTLECOMPANY] [text] NULL,
	[LASTSETTLEDATE] [datetime2](7) NULL,
	[LASTSETTLEVOUCHER] [text] NULL,
	[MODIFIEDBY1] [text] NULL,
	[MODIFIEDDATETIME1] [datetime2](7) NULL,
	[MODIFIEDTRANSACTIONID1] [float] NULL,
	[PAYMMODE] [text] NULL,
	[PAYMREFERENCE] [text] NULL,
	[PAYMSPEC] [text] NULL,
	[PAYMTERM] [text] NULL,
	[POSTINGPROFILE] [text] NULL,
	[PREPAYMENT] [text] NULL,
	[PROMISSORYNOTESTATUS] [text] NULL,
	[RECID1] [float] NOT NULL,
	[SETTLEAMOUNTCUR] [float] NULL,
	[SETTLEAMOUNTMST] [float] NULL,
	[THIRDPARTYBANKACCOUNTID] [text] NULL,
	[TRANSDATE] [datetime2](7) NULL,
	[TRANSTYPE] [text] NULL,
	[TXT] [text] NULL,
	[VOUCHER] [text] NULL,
	[BATCH_LOADED] [nvarchar](100) NULL,
	[ExecutionRunId] [nvarchar](100) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[D365_KES_Vend_Trans] ADD  CONSTRAINT [PK_D365_KES_Vend_Trans] PRIMARY KEY CLUSTERED 
(
	[RECID1] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
CREATE NONCLUSTERED INDEX [IDX_NC_D365_KES_Vend_Trans_ExecutionRunId] ON [dbo].[D365_KES_Vend_Trans]
(
	[ExecutionRunId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO

ALTER TABLE dbo.D365_KES_Vend_Trans
ADD VOUCHER_VARCHAR AS CAST(VOUCHER AS VARCHAR(50)); -- Adjust the length as needed

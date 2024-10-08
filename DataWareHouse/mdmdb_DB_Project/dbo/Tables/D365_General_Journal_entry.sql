SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[D365_General_Journal_entry](
	[GENERALJOURNALACCOUNTENTRYRECID] [float] NOT NULL,
	[ACCOUNTDISPLAYVALUE] [text] NOT NULL,
	[ACCOUNTINGCURRENCYAMOUNT] [float] NOT NULL,
	[ACCOUNTINGDATE] [datetime2](7) NOT NULL,
	[CUSTOMERACCOUNT] [text] NULL,
	[CUSTOMERNAME] [text] NULL,
	[DESCRIPTION] [text] NULL,
	[DOCUMENTDATE] [datetime2](7) NOT NULL,
	[DOCUMENTNUMBER] [text] NULL,
	[ISCORRECTION] [text] NOT NULL,
	[ISCREDIT] [text] NOT NULL,
	[JOURNALCATEGORY] [text] NOT NULL,
	[JOURNALNUMBER] [text] NOT NULL,
	[LEDGERACCOUNT] [text] NOT NULL,
	[LEDGERNAME] [text] NOT NULL,
	[POSTINGLAYER] [text] NOT NULL,
	[POSTINGTYPE] [text] NOT NULL,
	[QUANTITY] [float] NOT NULL,
	[REPORTINGCURRENCYAMOUNT] [float] NOT NULL,
	[TRANSACTIONCURRENCYAMOUNT] [float] NOT NULL,
	[TRANSACTIONCURRENCYCODE] [text] NOT NULL,
	[TRANSACTIONCURRENCYCREDITAMOUNT] [float] NOT NULL,
	[TRANSACTIONCURRENCYDEBITAMOUNT] [float] NOT NULL,
	[VENDORACCOUNT] [int] NULL,
	[VENDORNAME] [text] NULL,
	[VOUCHER] [text] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[D365_General_Journal_entry] ADD  CONSTRAINT [PK_D365_General_Journal_entry] PRIMARY KEY CLUSTERED 
(
	[GENERALJOURNALACCOUNTENTRYRECID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
CREATE FULLTEXT INDEX ON [dbo].[D365_General_Journal_entry](
[LEDGERACCOUNT] LANGUAGE 'English')
KEY INDEX [PK_D365_General_Journal_entry]ON ([GeneralJournalCatalog], FILEGROUP [PRIMARY])
WITH (CHANGE_TRACKING = AUTO, STOPLIST = SYSTEM)

GO

ALTER TABLE dbo.D365_General_Journal_entry
ADD GL_ACCOUNT AS SUBSTRING(LEDGERACCOUNT, 20, 6) PERSISTED;

CREATE INDEX IDX_D365_General_Journal_entry_GL_ACCOUNT
ON dbo.D365_General_Journal_entry (GL_ACCOUNT);

ALTER TABLE dbo.D365_General_Journal_entry
ADD VOUCHER_VARCHAR AS CAST(VOUCHER AS VARCHAR(MAX)) PERSISTED;

CREATE INDEX IDX_D365_General_Journal_entry_VOUCHER_VARCHAR
ON dbo.D365_General_Journal_entry (VOUCHER_VARCHAR);



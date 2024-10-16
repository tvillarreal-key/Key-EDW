SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[D365_MainAccount](
	[CHARTOFACCOUNTS] [varchar](20) NULL,
	[MAINACCOUNTID] [varchar](20) NULL,
	[ACCOUNTCATEGORYDESCRIPTION] [varchar](max) NULL,
	[ACTIVEFROM] [varchar](20) NULL,
	[ACTIVETO] [varchar](20) NULL,
	[BALANCECONTROL] [varchar](20) NULL,
	[CHARTOFACCOUNTSRECID] [varchar](20) NULL,
	[CLOSING] [varchar](20) NULL,
	[DEBITCREDITDEFAULT] [varchar](20) NULL,
	[DEBITCREDITREQUIREMENT] [varchar](20) NULL,
	[DEFAULTCONSOLIDATIONACCOUNT] [varchar](50) NULL,
	[DEFAULTCURRENCY] [varchar](10) NULL,
	[DONOTALLOWMANUALENTRY] [varchar](10) NULL,
	[EXCHANGEADJUSTMENTRATETYPE] [varchar](50) NULL,
	[FINANCIALREPORTINGCURRENCYTRANSLATIONTYPE] [varchar](50) NULL,
	[FINANCIALREPORTINGEXCHANGERATETYPE] [varchar](50) NULL,
	[FOREIGNCURRENCYREVALUATION] [varchar](50) NULL,
	[ISSUSPENDED] [varchar](50) NULL,
	[MAINACCOUNTCATEGORY] [varchar](50) NULL,
	[MAINACCOUNTRECID] [varchar](50) NULL,
	[MAINACCOUNTTYPE] [varchar](50) NULL,
	[MONETARY] [varchar](50) NULL,
	[NAME] [varchar](max) NULL,
	[OFFSETACCOUNTDISPLAYVALUE] [varchar](50) NULL,
	[OPENINGACCOUNTID] [varchar](50) NULL,
	[POSTINGTYPE] [varchar](50) NULL,
	[REPORTINGEXCHANGEADJUSTMENTRATETYPE] [varchar](50) NULL,
	[USER] [varchar](50) NULL,
	[VALIDATECURRENCY] [varchar](20) NULL,
	[VALIDATEPOSTINGTYPE] [varchar](20) NULL,
	[VALIDATEUSER] [varchar](20) NULL,
	[ExecutionRunId] [nvarchar](100) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

CREATE INDEX IDX_D365_MainAccount_MAINACCOUNTID
ON dbo.D365_MainAccount (MAINACCOUNTID);


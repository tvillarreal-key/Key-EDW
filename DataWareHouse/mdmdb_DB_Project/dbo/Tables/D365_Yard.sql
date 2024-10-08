SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[D365_Yard](
	[FUNCTIONALLOCATIONID] [varchar](10) NULL,
	[FUNCTIONALLOCATIONLIFECYCLESTATEID] [varchar](10) NULL,
	[FUNCTIONALLOCATIONTYPEID] [varchar](10) NULL,
	[NAME] [varchar](max) NULL,
	[NOTES] [varchar](max) NULL,
	[XXLOB_CUSTOM] [varchar](max) NULL,
	[XXMKT_CUSTOM] [varchar](max) NULL,
	[XXACCTSEG_CUSTOM] [varchar](50) NULL,
	[XXCITY_CUSTOM] [varchar](max) NULL,
	[XXFULLADDRESS_CUSTOM] [varchar](max) NULL,
	[XXSTATE_CUSTOM] [varchar](10) NULL,
	[XXSTREET_CUSTOM] [varchar](max) NULL,
	[XXZIP_CUSTOM] [varchar](20) NULL,
	[KES_AcctSegments] [varchar](50) NULL,
	[KES_LineOfBusiness] [varchar](50) NULL,
	[KES_Marketplace] [varchar](50) NULL,
	[INSERTED] [datetime] NULL,
	[ExecutionRunId] [varchar](100) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

CREATE INDEX IDX_d365_yard_FunctionalLocationID
ON dbo.d365_yard (FunctionalLocationID);


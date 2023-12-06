
-- Create the stored procedure in the specified schema
CREATE PROCEDURE [dbo].[SP_D365_REVENUE_TBL]
AS
BEGIN

DROP TABLE [dbo].[LOAD_D365_REVENUE_TBL]

SELECT [JOURNALNUMBER]
      ,[VOUCHER]
      ,[ACCOUNTINGDATE]
      ,[LEDGERACCOUNT]
      ,[YARD]
      ,[YARD_NAME]
      ,[LOCATION]
      ,[LOB_ID]
      ,[FUTURE]
      ,[GL_ACCOUNT]
      ,[LEGAL_ENTITY]
      ,[MarketPlace]
      ,[LOB]
      ,[Level1]
      ,[Level2]
      ,[Level3]
      ,[Level_Of_Detail]
      ,[NAME]
      ,[DESCRIPTION]
      ,[REPORTINGCURRENCYAMOUNT]
      ,[POSTINGTYPE]
      ,[DOCUMENTNUMBER]
      ,[QUANTITY]
      ,[CUSTOMERACCOUNT]
      ,[CUSTOMERNAME]
	  INTO LOAD_D365_REVENUE_TBL
  FROM [dbo].[REVENUE_DATA_VIEW]

END
GO


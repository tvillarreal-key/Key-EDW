
-- Create the stored procedure in the specified schema
CREATE PROCEDURE [dbo].[LOAD_D365_PO_DATA_TBL]
AS
BEGIN

DROP TABLE [dbo].[D365_PO_DATA_TBL]

SELECT [PURCHASEORDERNUMBER]
      ,[ACCOUNTINGDATE]
      ,[YARD]
      ,[ORDERVENDORNUMBER]
      ,[VENDOR]
      ,[VENDORORDERREFERENCE]
      ,[MarketPlace]
      ,[YARD_NAME]
      ,[GL_Account]
      ,[ACCOUNTCATEGORYDESCRIPTION]
      ,[NAME]
      ,[INVOICE_AMOUNT]
      ,[PO_AMOUNT]
      ,[NON_PO_AMOUNT]
  INTO [dbo].[D365_PO_DATA_TBL]
  FROM [dbo].[PO_DATA_VIEW]
END
GO


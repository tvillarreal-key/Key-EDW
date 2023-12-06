/****** Script for SelectTopNRows command from SSMS  ******/
Create View JOURNALBATCHNUM_VOUCHER AS (
SELECT DISTINCT [JOURNALBATCHNUMBER], [VOUCHER]
  FROM [dbo].[D365_VendorJournalLines])
GO


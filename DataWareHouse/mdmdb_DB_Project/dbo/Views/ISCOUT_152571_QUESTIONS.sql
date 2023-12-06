
CREATE VIEW [dbo].[ISCOUT_152571_QUESTIONS]
AS
SELECT I.report_number, I.report_date, A01.question as A01_Q, I.A01, A02.question as A02_Q, I.A02, A03.question as A03_Q, I.A03
FROM [dbo].[IScout_152571] I
JOIN [dbo].[IScout_XREF] A01 on 'A01' = A01.fieldname and A01.tablename='IScout_152571'
JOIN [dbo].[IScout_XREF] A02 on 'A02' = A02.fieldname and A01.tablename='IScout_152571'
JOIN [dbo].[IScout_XREF] A03 on 'A03' = A03.fieldname and A01.tablename='IScout_152571'
GO


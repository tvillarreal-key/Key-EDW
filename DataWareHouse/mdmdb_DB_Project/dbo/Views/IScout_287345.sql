--DROP View [dbo].[Motus_View]
Create View [dbo].[IScout_287345] AS (
select *
FROM [dbo].[IScout_287345A] A
JOIN [dbo].[IScout_287345B] B on B.[S003_Report_Number_B] = A.[S003_Report_Number]
JOIN [dbo].[IScout_287345C] C on C.[S003_Report_Number_C] = A.[S003_Report_Number]
JOIN [dbo].[IScout_287345D] D on D.[S003_Report_Number_D] = A.[S003_Report_Number])
GO


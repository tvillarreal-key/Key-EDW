--DROP View [dbo].[Motus_View]
Create View [dbo].[IScout_280343] AS (
select *
FROM [dbo].[IScout_280343A] A
JOIN [dbo].[IScout_280343B] B on B.[S003_Report_Number_B] = A.[S003_Report_Number]
JOIN [dbo].[IScout_280343C] C on C.[S003_Report_Number_C] = A.[S003_Report_Number]
JOIN [dbo].[IScout_280343D] D on D.[S003_Report_Number_D] = A.[S003_Report_Number])
GO


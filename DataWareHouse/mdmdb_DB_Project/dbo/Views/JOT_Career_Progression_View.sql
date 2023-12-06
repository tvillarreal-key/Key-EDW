--DROP View [dbo].[JOT_Career_Progression_View]
Create View [dbo].[JOT_Career_Progression_View] AS (
SELECT f.title as Form_Title, s.*, e.FIRST_NAME, e.LAST_NAME, s.ein + '-' + e.LAST_NAME + ', '+ e.FIRST_NAME as person
FROM [dbo].[JOT_Submissions] s
JOIN [dbo].[JOT_Forms] f ON s.form_id = f.id
JOIN [dbo].[Employees] e on e.ein = s.ein
WHERE f.id = '211176658553158')
GO


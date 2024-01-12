--DROP View [dbo].[JOT_1_Year_Check_In_v
Create View [dbo].[JOT_1_Year_Check_In_v] AS (
select ein, [162],[227],[221],[222],[223],[228],[173],[216],[184],[183],[231],[207],[218],[234],[233],[235],[236]
from 
(select answer, ein, question_id from JOT_Submissions WHERE form_id = '211886044278159' and ein is not null) J
PIVOT
(
 MAX(answer)   
 FOR question_id IN ([162],[227],[221],[222],[223],[228],[173],[216],[184],[183],[231],[207],[218],[234],[233],[235],[236])
) AS PVT)
GO


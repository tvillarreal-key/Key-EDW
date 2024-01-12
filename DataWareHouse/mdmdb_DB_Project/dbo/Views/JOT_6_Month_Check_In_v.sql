--DROP View [dbo].[JOT_6_Month_Check_In_v]
Create View [dbo].[JOT_6_Month_Check_In_v] AS (
select ein, [162],[223],[224],[225],[226],[228],[235],[236],[215],[213],[238],[184],[237],[214],[232],[231],[240],[239],[221]
from 
(select answer, ein, question_id from JOT_Submissions WHERE form_id = '211886276453161' and ein is not null) J
PIVOT
(
 MAX(answer)   
 FOR question_id IN ([162],[223],[224],[225],[226],[228],[235],[236],[215],[213],[238],[184],[237],[214],[232],[231],[240],[239],[221])
) AS PVT)
GO


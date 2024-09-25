--DROP View [dbo].[JOT_Career_Progression_v]
Create View [dbo].[JOT_Career_Progression_v] AS (
select ein, [162] as "Date", [231] as "Employee Name",[235] as "Job Title", [233] as "Marketplace", [234] as "Work Location", [236] as "Date of Hire",[260] as "Does Key meet your long term career goals?",
[237] as "What are two things you LIKE most about working for Key and why?",[238] as "What are two things you DISLIKE most about working for Key and why?",
[213] as "Why do you choose to work for Key as opposed to a competitor? (check all that apply)]",[173] as "What skills/exp do you have that you may not be using in your current role or that we may not know about?",
[218] as "What is one skill you would like to improve on or develop in your current role?",[191] as "What role do you see yourself in a year from now?",
[240] as "What position would you like to have at Key 5 years from now?", [241] as "Name a top job you would like to have in your career at Key?",
[175] as "Do you feel like you have a coach or mentor in your current role?",[228] as "Please list coach's name(s).", [203] as "Would you like a coach or mentor assigned?",
[176] as "Is there anyone in the company that you feel would be a good coach/mentor?", [227] as "Please list names of employees you feel would make a good coach.",
[204] as "Can I name a coach/mentor for you?", [216] as "If you have been employed with Key for at least 1 year, please answer the following: Would you like to be a coach or mentor?",
[207] as "Do you know Key's core values?",[217] as "Do you know Key's goals for the year?", [184] as "If a new opportunity became available for advancement, would you be willing to relocate?",
[184] as "Are there any locations you would not be willing to relocate to (y/n)?", [266] as "Are there any locations you would not be willing to relocate to?",
[209] as "Can we discuss your progress in the next 6 months?",[219] as "Employee Email",[220] as "Manager Email",[267] as "Manager Name",[214] as "Please select a time and date for 6 month check-in.",
[252] as "Name of Person Completing Form"
from 
(select id, answer, ein, question_id from JOT_Submissions WHERE form_id = '211176658553158' and ein is not null) J
PIVOT
(
 MAX(answer)   
 FOR question_id IN ([162], [231],[235],[233],[234],[236],[260],[237],[238],[213],[173],[218],[191],[240],[241],[175],[228],[203],[176],[227],[204],[216],[207],[217],[184],[183],[266],
 [209],[219],[220],[267],[214],[252])
) AS PVT)
GO


CREATE VIEW Asset_Utilization_Calendar_VW AS
WITH 
-- Get the distinct asset numbers
ASSETS AS (
    SELECT DISTINCT [marketplace], [office], [ticket_asset_number] 
    FROM Salesforce_Rig_Ticket_Utilization
    WHERE omit=0
    AND day_exception is null
),
-- Get the date range (first day of the earliest month to last day of the latest month)
DATE_RANGE AS (
    SELECT 
        DATEADD(DAY, 1-DAY(MIN([ticket_date])), MIN([ticket_date])) AS first_day,
        EOMONTH(MAX([ticket_date])) AS last_day
    FROM Salesforce_Rig_Ticket_Utilization
),
-- Generate all days in the date range
CALENDAR AS (
    SELECT
        DATEADD(DAY, n.number, dr.first_day) AS calendar_date
    FROM DATE_RANGE dr
    CROSS JOIN (
        SELECT TOP (1830) ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) - 1 AS number  --limit to 5 years
        FROM sys.objects s1
        CROSS JOIN sys.objects s2
    ) n
    WHERE DATEADD(DAY, n.number, dr.first_day) <= dr.last_day
),

-- Cross join calendar with assets to get all combinations
ASSET_CALENDAR AS (
    SELECT 
        c.calendar_date AS [ticket_date],
        a.[marketplace],
        a.[office],
        a.[ticket_asset_number]
    FROM CALENDAR c
    CROSS JOIN ASSETS a
)
-- Final query joining with the original data
SELECT 
    DISTINCT
    ac.[ticket_date],
    ac.[marketplace],
    ac.[office],   
    ac.[ticket_asset_number],
    CASE 
        WHEN sru.[ticket_date] IS NOT NULL THEN 1
        ELSE 0
    END AS [Active]
FROM ASSET_CALENDAR ac
LEFT JOIN Salesforce_Rig_Ticket_Utilization sru ON 
    ac.[ticket_date] = sru.[ticket_date] AND 
    ac.[marketplace] = sru.[marketplace] AND
    ac.[office] = sru.[office] AND  
    ac.[ticket_asset_number] = sru.[ticket_asset_number] AND
    sru.[omit] = 0 AND
    sru.[day_exception] is null
WHERE ac.[ticket_date] NOT IN (select distinct(ticket_date) from Salesforce_Rig_Ticket_Utilization where day_exception ='1')

-- ORDER BY 
--     ac.[ticket_asset_number],
--     ac.[ticket_date];
;
GO


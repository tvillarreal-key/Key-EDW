CREATE VIEW [dbo].[SF_RIG_COUNT_VW] AS 

/*****************

Business Rules/ Definitions:

1) Get unique days per month excluding Sat/SUN
2) Rig Down: Last Activity End Time for the Last Rig Down on a Job

*******************/
/* GET MAIN DATA TABLES */

WITH TICKET_DAYS AS (
    SELECT distinct(ticket_date)
    FROM dbo.Salesforce_Rig_Ticket_Utilization
    WHERE omit=0
    and FORMAT(ticket_date, 'yyyy-MM') = '2025-02'
    and DATENAME(dw, ticket_date) NOT IN ('Saturday', 'Sunday')
),

RIG_COUNT AS (
   SELECT ticket_date, FORMAT(ticket_date, 'yyyy-MM') as YearMo, marketplace, office, COUNT(DISTINCT ticket_asset_number) as AssetCount
    FROM dbo.Salesforce_Rig_Ticket_Utilization
    WHERE omit=0
    and FORMAT(ticket_date, 'yyyy-MM') = '2025-02'
    and DATENAME(dw, ticket_date) NOT IN ('Saturday', 'Sunday')
    group by ticket_date, FORMAT(ticket_date, 'yyyy-MM'), marketplace, office
)

SELECT 
    D.ticket_date,
    C.YearMo, C.marketplace, C.office, C.AssetCount
FROM TICKET_DAYS D
LEFT JOIN RIG_COUNT C ON (D.ticket_date = C.ticket_date)

;
GO


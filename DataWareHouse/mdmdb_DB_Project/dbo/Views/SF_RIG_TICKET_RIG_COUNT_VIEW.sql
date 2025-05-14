--DROP View [dbo].[SF_RIG_TICKET_RIG_COUNT_VIEW]
Create View [dbo].[SF_RIG_TICKET_RIG_COUNT_VIEW] AS (
SELECT ticket_date, FORMAT(ticket_date, 'yyyy-MM') as YearMo, marketplace, office, COUNT(DISTINCT ticket_asset_number) as AssetCount
FROM dbo.Salesforce_Rig_Ticket_Utilization
WHERE omit=0
and FORMAT(ticket_date, 'yyyy-MM') = '2025-02'
and DATENAME(dw, ticket_date) NOT IN ('Saturday', 'Sunday')
group by ticket_date, FORMAT(ticket_date, 'yyyy-MM'), marketplace, office
)
GO


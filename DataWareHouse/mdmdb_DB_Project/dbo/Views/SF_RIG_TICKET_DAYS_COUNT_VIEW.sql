--DROP View [dbo].[SF_RIG_TICKET_DAYS_COUNT_VIEW]

Create View [dbo].[SF_RIG_TICKET_DAYS_COUNT_VIEW] AS (
SELECT FORMAT(ticket_date, 'yyyy-MM') as ticket_date, item_asset_number, marketplace, COUNT(DISTINCT ticket_date) as Days
--SELECT FORMAT(ticket_date, 'yyyy-MM') as ticket_date, ticket_asset_number, marketplace, COUNT(DISTINCT ticket_date) as Days
FROM dbo.Salesforce_Rig_Ticket_Utilization
WHERE omit=0
group by FORMAT(ticket_date, 'yyyy-MM'), item_asset_number, marketplace
--group by FORMAT(ticket_date, 'yyyy-MM'), ticket_asset_number, marketplace
)
GO


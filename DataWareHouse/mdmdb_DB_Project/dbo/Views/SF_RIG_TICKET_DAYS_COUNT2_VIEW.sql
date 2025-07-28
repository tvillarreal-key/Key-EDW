--DROP View [dbo].[SF_RIG_TICKET_DAYS_COUNT2_VIEW]

Create View [dbo].[SF_RIG_TICKET_DAYS_COUNT2_VIEW] AS (
SELECT FORMAT(r.ticket_date, 'yyyy-MM') as ticket_date, r.item_asset_number, r.marketplace, l.NA_STATE, r.lco, COUNT(DISTINCT ticket_date) as Days
FROM dbo.Salesforce_Rig_Ticket_Utilization r
LEFT OUTER JOIN dbo.MDM_Locations l ON l.CODE = r.lco
WHERE omit=0 and FORMAT(r.ticket_date, 'yyyy-MM') >= '2025-02'
group by FORMAT(ticket_date, 'yyyy-MM'), item_asset_number, marketplace, l.NA_STATE, lco
)
GO


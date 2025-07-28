--DROP View [dbo].[SF_RIG_TICKET_UTILIZATION_VIEW]

Create View [dbo].[SF_RIG_TICKET_UTILIZATION_VIEW] AS (
select  [ticket_id],[ticket_name],[ticket_date],[customer],[marketplace],[ticket_status],[ticket_number],[office]
,[office_loco],[office_lob],[ticket_asset_number],[ticket_asset_id],[ticket_asset_name],[item_id],[item_name]
,[item_code],[item_code_description],[item_asset_number],[item_asset_description],[utilization_hours],[lco]
,[level1],[level2],[type],[omit],[item_sf_asset_id],[item_sf_asset_number],[item_sf_asset_name],[item_revenue_total]
,[invoice_number],[well_name]
from dbo.Salesforce_Rig_Ticket_Utilization rig
where omit=0)
GO



CREATE VIEW [dbo].[INSPECTION_WO_VIEW]
AS
  select t1.workorder_id, description, cost_type, expected_start, expected_end, [workorder_lifecycle_state_id], t2.asset_num, t4.Status_Desc, ma_functional_location_id, t3.YARD_NAME
  FROM [reporting].[D365_WorkOrders] t1
  LEFT OUTER JOIN [reporting].[D365_WorkOrderJobs] t2 ON t1.workorder_id = t2.workorder_id
  LEFT OUTER JOIN [dbo].[LOCO_Hierarchy] t3 ON t2.ma_functional_location_id = t3.YARD_CODE
  LEFT OUTER JOIN [dbo].[MDM_Assets] t4 ON t2.asset_num = t4.Asset_Num
  where [workorder_lifecycle_state_id] = 'Released'
  and description in ('RIG-TUBING-LINE-1', 'RIG - 2 YEAR CATEGORY III INSPECTION', 'RIG - 10 YEAR CATEGORY IV INSPECTION', 'ANNUAL-DOT', 'RIG - 1 YEAR LIFTING EQUIPMENT INSPECTION', 'RIG - 5 YEAR TRAVELING BLOCK INSPECTION', '5 YEAR EXTERNAL TANK INSPECTION', 'LICENSE - 1 YEAR RENEWAL')
  and t4.Status_Desc not in ('EXPIRED', 'STACKED', 'NEEDS REPAIR', 'LEGAL HOLD', 'AWAITING PROCEEDS', 'INTENT TO SALVAGE', 'INTENT TO RETIRE')
GO







CREATE VIEW [reporting].[DFR_ASSETS_WO_WORKORDERS_VIEW]
AS

SELECT DISTINCT t3.asset_num
	  ,t3.[asset_id]
	  ,t3.asset_class
	  ,t3.[asset_desc]
	  ,t3.status
	  ,t3.status_desc
	  ,t3.[loco_code]
      ,t3.[loco_name]
      ,t3.[loca_code]
      ,t3.[loca_name]
      ,t3.[mktp_code]
      ,t3.[mktp_name]
	  ,t3.source
      , WorkOrderStatus = CASE
			WHEN CAST([WORKORDERLIFECYCLESTATEID] AS VARCHAR) IS NULL THEN 'No Work Order'
			WHEN CAST([WORKORDERLIFECYCLESTATEID] AS VARCHAR) IN ('Closed', 'Complete', 'Cancelled') THEN 'No Active Work Order'
			ELSE CAST([WORKORDERLIFECYCLESTATEID] AS VARCHAR)
		END


  FROM [reporting].[MDM_Assets] t3
  LEFT OUTER JOIN [dbo].[D365_WorkOrderJobs] t2 ON cast(t3.[asset_num] as varchar)= cast (t2.[MA_ID] as varchar)
  LEFT OUTER JOIN [dbo].[D365_WorkOrders] t1 ON t2.[WORKORDERID] = t1.[WORKORDERID]
  --where asset_num = '0557933' AND ([WORKORDERLIFECYCLESTATEID] IS NULL OR cast([WORKORDERLIFECYCLESTATEID] as varchar) <> 'Released')
  WHERE t3.status = 'DFR' AND cast(t3.[asset_num] as varchar) NOT IN
  (select distinct cast(t2.MA_ID as varchar) as MA_ID
  from [dbo].[D365_WorkOrders] t1,
  [dbo].[D365_WorkOrderJobs] t2 
  WHERE t2.[WORKORDERID] = t1.[WORKORDERID]
  and cast(t1.[WORKORDERLIFECYCLESTATEID] as varchar) = 'Released')
GO


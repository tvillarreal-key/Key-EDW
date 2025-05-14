


CREATE VIEW [dbo].[LTVL_WORK_ORDER_AGING_VIEW]
AS
SELECT T2.[MA_ID] 
      ,T1.[WORKORDERID]
      ,[ACTIVE]
      ,[DESCRIPTION]
      ,[EXPECTEDSTART]
      ,[WORKORDERLIFECYCLESTATEID]
	  , (DATEDIFF(dd, CURRENT_DATE, [EXPECTEDSTART]) * -1) AS AGING_IN_DAYS
	  	  ,t3.asset_num
	  ,t3.lob_code
	  ,t3.lob_name
	  ,t3.loca_code
	  ,t3.loca_name
	  ,t3.loco_code
	  ,t3.loco_name
	  ,t3.manufacturer
	  ,t3.yard_code
	  ,t3.yard_name
	  ,t3.mare_code
	  ,t3.mare_name
	  ,t3.model
	  ,t3.model_year
	  ,t3.serial_num
	  ,t3.lvl1_code
	  ,t3.lvl1_name
	  ,t3.License_Plate
	  ,t3.mktp_code
	  ,t3.mktp_name
	  ,t3.status
	  ,t3.status_desc
	  ,t4.[attr_value]
  FROM [dbo].[D365_WorkOrders] T1,
       [dbo].[D365_WorkOrderJobs] T2
	   LEFT OUTER JOIN [reporting].[MDM_Assets] t3 ON convert(varchar, [MA_ID]) = convert(varchar, t3.[asset_num])
	   LEFT OUTER JOIN [reporting].[MDM_AssetAttr] t4 ON convert(varchar, [MA_ID]) = convert(varchar, t4.[asset_num]) AND t4.[attr_code] = 'Leasing Company'
  WHERE T1.[WORKORDERID] = T2.[WORKORDERID]
  AND convert(varchar, [WORKORDERLIFECYCLESTATEID]) = 'Released'
  AND [EXPECTEDSTART] < CURRENT_DATE
  AND DATEDIFF(dd, CURRENT_DATE, [EXPECTEDSTART])<-1
  AND description = 'LTVL - OIL CHANGE'
  --ORDER BY [EXPECTEDSTART] DESC
GO


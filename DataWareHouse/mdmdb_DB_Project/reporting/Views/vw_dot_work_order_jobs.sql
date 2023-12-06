CREATE VIEW [reporting].[vw_dot_work_order_jobs] AS 
SELECT  workorder_id, forecast_hour_qty, job_type_id ,ma_functional_location_id, 
        asset_num, scheduled_end_datetime, scheduled_start_datetime, 
        scheduled_worker_personnel_number, schedule_work_order_job, wo_job_description
FROM reporting.D365_WorkOrderJobs
GO


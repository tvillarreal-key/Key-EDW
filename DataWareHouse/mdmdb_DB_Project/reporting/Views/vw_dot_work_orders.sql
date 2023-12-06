CREATE VIEW reporting.vw_dot_work_orders AS 
SELECT  workorder_id, active, actual_end, actual_start, cost_type, [description], 
        expected_end, expected_start, parent_workorder_id, scheduled_end, 
        scheduled_start, workorder_lifecycle_state_id, workorder_type_id
FROM reporting.D365_WorkOrders
GO


CREATE VIEW [reporting].[vw_dot_dvir] AS
SELECT  report_number, report_date, updated, [version], observer, observer_emp_num, duration, 
        latitude, longitude, temperature, wind_speed, weather, score_percent, marketplace, lco, 
        district_manager, supervisor, inspection_type, asset_num,is_trailer_pulled, trailer_asset_num, 
        reparir_cost_greater_than_50_dollars_or_repair_time_greater_than_1_hour, can_repairs_be_made_by_driver, 
        repairs_made_by_driver, driver_name, defects_corrected, deffect_correction_date, work_order_id
        ,link, upload_date, q_all_defects
FROM reporting.IScout_159094
GO


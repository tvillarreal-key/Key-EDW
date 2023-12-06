CREATE PROCEDURE [reporting].[sp_dot_reload_tables] 
AS
BEGIN 

        /* -------------------------------------------------- UPDATE THE ASSETS TABLE ---------------------------------------------------- */
        TRUNCATE TABLE reporting.MDM_Assets

        INSERT INTO reporting.MDM_Assets    (asset_id, asset_num, asset_desc, asset_class, manufacturer, model, 
                                        model_year, series, serial_num, [status], status_desc, source, marketed, 
                                        revenue_track, parent_asset_num, child_relationship_type, loco_code, 
                                        loco_name, loca_code, loca_name, mktp_code, mktp_name, lvl1_code, lvl1_name, 
                                        lob_code, lob_name, dist_code, dist_name, mare_code, mare_name, yard_code, yard_name)
        SELECT *
        FROM dbo.MDM_Assets

        -- UPDATE THE UPLOAD DATE
        UPDATE reporting.MDM_Assets
        SET reporting.MDM_Assets.upload_date = GETDATE()

        /* ----------------------------------------------- UPDATE THE ASSET ATTRIBUTES TABLE ---------------------------------------------- */
        TRUNCATE TABLE reporting.MDM_AssetAttr

        INSERT INTO reporting.MDM_AssetAttr (asset_id, asset_num, attr_code, attr_value)
        SELECT *
        FROM dbo.MDM_AssetAttr

        -- UPDATE THE UPLOAD DATE
        UPDATE reporting.MDM_AssetAttr
        SET reporting.MDM_AssetAttr.upload_date = GETDATE()

        /* ------------------------------------------------ UPDATE THE MOTIVE MILES TABLE -------------------------------------------------- */
        TRUNCATE TABLE reporting.MotiveMiles

        INSERT INTO reporting.MotiveMiles   ([date], asset_num, jurisdiction, distance_mi, odometer_start, odometer_end, 
                                        manual_odo_edit, latitude_start, longitude_start, latitude_end, longitude_end, insert_on)
        SELECT  [Date], CAST(Vehicle AS nvarchar(255)), Jurisdiction, Distance_mi, Odometer_Start, Odometer_End, 
                Manual_Odo_Edit, Latitude_Start, Longitude_Start, Latitude_End, Longitude_End, InsertOn
        FROM dbo.MotiveMiles

        -- UPDATE THE UPLOAD DATE
        UPDATE reporting.MotiveMiles
        SET reporting.MotiveMiles.upload_date = GETDATE()

        /* ---------------------------------------------- UPDATE THE MOTIVE IFTA TRIPS TABLE ----------------------------------------------- */
        TRUNCATE TABLE reporting.Motive_IFTA_Trips

        INSERT INTO reporting.Motive_IFTA_Trips (id, [date], jurisdiction, vehicle_id, asset_num, [year], 
                                                make, model, vin, metric_units, start_odometer, end_odometer, 
                                                start_lat, start_lon, end_lat, end_lon, distance, time_zone)
        SELECT  Id, CAST([Date] AS DATE), Jurisdiction, Vehicle_Id, Vehicle_number, CAST([Year] AS INT), 
                Make, Model, VIN, Metric_Units, Start_Odometer, End_Odometer, 
                Start_Lat, Start_Lon, End_Lat, End_Lon, Distance, Time_Zone
        FROM dbo.Motive_IFTA_Trips

        -- UPDATE THE UPLOAD DATE
        UPDATE reporting.Motive_IFTA_Trips
        SET reporting.Motive_IFTA_Trips.upload_date = GETDATE()

        /* ---------------------------------------------- UPDATE D365 WORK ORDERS TABLE ---------------------------------------------------- */
        TRUNCATE TABLE reporting.d365_workOrders

        INSERT INTO reporting.D365_WorkOrders   (workorder_id,active, actual_end, actual_start, cost_type, [description],
                                                expected_end, expected_start, is_workorder_scheduled_for_single_worker,
                                                next_workorder_lifecycle_stateid, order_billing_customer_account_number,
                                                order_project_contract_id, parent_workorder_id, responsible_worker_personnel_number,
                                                scheduled_end, scheduled_start, scheduled_worker_personnel_number, service_level,
                                                worker_group_id, workorder_lifecycle_state_id, workorder_maintenance_asset_criticality_name,
                                                workorder_maintenance_asset_criticality_value, workorder_type_id)
        SELECT  WORKORDERID, CAST(ACTIVE AS nvarchar(255)), ACTUALEND, ACTUALSTART, CAST(COSTTYPE AS nvarchar(255)), DESCRIPTION, EXPECTEDEND, 
                EXPECTEDSTART, CAST(ISWORKORDERSCHEDULEDFORSINGLEWORKER AS nvarchar(255)), CAST(NEXTWORKORDERLIFECYCLESTATEID AS nvarchar(255)),
                CAST(ORDERBILLINGCUSTOMERACCOUNTNUMBER AS nvarchar(255)), CAST(ORDERPROJECTCONTRACTID AS nvarchar(255)), CAST(PARENTWORKORDERID AS nvarchar(255)), 
                CAST(RESPONSIBLEWORKERPERSONNELNUMBER AS nvarchar(255)), SCHEDULEDEND, SCHEDULEDSTART, CAST(SCHEDULEDWORKERPERSONNELNUMBER AS nvarchar(255)),
                CAST(SERVICELEVEL AS nvarchar(255)), CAST(WORKERGROUPID AS nvarchar(255)), CAST(WORKORDERLIFECYCLESTATEID AS nvarchar(255)), 
                CAST(WORKORDERMAINTENANCEASSETCRITICALITYNAME AS nvarchar(255)), CAST(WORKORDERMAINTENANCEASSETCRITICALITYVALUE AS nvarchar(255)), CAST(WORKORDERTYPEID AS nvarchar(255))
        FROM dbo.d365_workOrders

        -- UPDATE THE UPLOAD DATE
        UPDATE reporting.d365_workOrders
        SET reporting.d365_workOrders.upload_date = GETDATE()

        /* ----------------------------------------------- UPDATE D365 WORK ORDER JOBS TABLE ----------------------------------------------- */
        TRUNCATE TABLE reporting.d365_workOrderJobs

        INSERT INTO reporting.D365_WorkOrderJobs    (workorder_id, line_number, address_latitude, address_longitude, forecast_hour_qty,
                                                job_schedule_link_type, job_trade_id, job_type_id, job_variant_id, ma_functional_location_id,
                                                asset_num, rma_functional_location_id, rma_id,scheduled_end_datetime, scheduled_start_datetime,
                                                scheduled_worker_personnel_number, schedule_work_order_job, wo_job_description, wo_job_internal_note,
                                                wo_job_maintenance_worker_remarks)
        SELECT  WORKORDERID, LINENUMBER, ADDRESSLATITUDE, ADDRESSLONGITUDE, FORECASTHOURQTY, 
                CAST(JOBSCHEDULELINKTYPE AS nvarchar(255)), CAST(JOBTRADEID AS nvarchar(255)), CAST(JOBTYPEID AS nvarchar(255)), 
                CAST(JOBVARIANTID AS nvarchar(255)), CAST(MA_FUNCTIONALLOCATIONID AS nvarchar(255)), CAST(MA_ID AS nvarchar(255)), 
                CAST(RMA_FUNCTIONALLOCATIONID AS nvarchar(255)), CAST(RMA_ID AS nvarchar(255)), SCHEDULEDENDDATETIME, SCHEDULEDSTARTDATETIME, 
                CAST(SCHEDULEDWORKERPERSONNELNUMBER AS nvarchar(255)), CAST(SCHEDULEWORKORDERJOB AS nvarchar(255)), CAST(WO_JOBDESCRIPTION AS nvarchar(255)), 
                CAST(WO_JOBINTERNALNOTE AS nvarchar(255)), CAST(WO_JOBMAINTENANCEWORKERREMARKS AS nvarchar(255))
        FROM dbo.D365_WorkOrderJobs

        -- UPDATE THE UPLOAD DATE
        UPDATE reporting.d365_workOrderJobs
        SET reporting.d365_workOrderJobs.upload_date = GETDATE()

        /* ---------------------------------------------- UPDATE D365 ASSET ATTACHMENTS ----------------------------------------------------- */
        TRUNCATE TABLE reporting.D365_AssetAttachments

        INSERT INTO reporting.D365_AssetAttachments (document_id, default_attachment, file_name, 
                                                file_type, asset_num, kex_expiration_datetime, 
                                                [name], notes, parent_asset_num, [path], restriction, 
                                                type_id)
        SELECT  DOCUMENTID, CAST(DEFAULTATTACHMENT AS nvarchar(255)), CAST([FILENAME] AS nvarchar(255)), 
                CAST(FILETYPE AS nvarchar(255)), CAST(FIXEDASSETID AS nvarchar(255)), KEX_EXPIRATIONDATETIME, 
                CAST([NAME] AS nvarchar(255)), NOTES, CAST(OBJECTID AS nvarchar(255)), CAST([PATH] AS nvarchar(255)), 
                CAST(RESTRICTION AS nvarchar(255)), CAST(TYPEID AS nvarchar(255))
        FROM dbo.D365_AssetAttachments

        -- UPDATE THE UPLOAD DATE
        UPDATE reporting.D365_AssetAttachments
        SET reporting.D365_AssetAttachments.upload_date = GETDATE()

        /* ----------------------------------------------------- UPDATE THE DVIR DATA -------------------------------------------------------- */
        TRUNCATE TABLE reporting.IScout_159094

        INSERT INTO reporting.IScout_159094 (link, report, report_number, report_date, updated, updated_time, [version], 
                                        observer, observer_emp_num, duration,latitude, longitude, temperature, wind_speed, 
                                        weather, score_percent, general_information, date_time, date_time_lat, date_time_lon, 
                                        marketplace, lco, district_manager, supervisor, inspection_type, tractor_truck_information, 
                                        asset_num, odometer_reading, safety_critical_items_requiring_inspection_prior_to_vehicle_use,
                                        description_1, air_compressor, air_lines, clutch, fifth_wheel, coupling_device, clearance_marker_lights,
                                        tire_chains, battery, defroster, engine, drive_line, front_axle, fuel_tank, heater, horn, 
                                        lights_head_stop_tail_dash_turn_indicators, mirrors, muffler, oil_pressure, radiator, rear_end, 
                                        reflectors, safety_equipment_fire_extinguisher_flags_flares_fuses_spare_bulbs, springs, starter, 
                                        steering, tachometer, tires, transmission, wheels, [windows], windshield_wipers_washer, trailer_information, 
                                        is_trailer_pulled, trailer_asset_num, trailer_brake_connections, tailer_brakes, tailer_tires, 
                                        tailer_wheels, tailer_lights_all, trailer_springs, trailer_hitch, tailer_landing_gear, 
                                        step1_driver_completing_inspection, description_2, yes_condition_of_vehicle_is_satisfactory_in_working_order,
                                        no_condition_of_vehicle_is_not_satisfactory_all_issues_defects_noted, above_issues_defects_require_correction, 
                                        reparir_cost_greater_than_50_dollars_or_repair_time_greater_than_1_hour, can_repairs_be_made_by_driver, 
                                        repairs_made_by_driver, driver_name, driver_signature, maintenance_department_requirements, description_3, 
                                        defects_corrected, deffect_correction_date, repair_company, third_party_mechanic_name, mechanic_name, 
                                        mechanics_signature, oncoming_driver_signature_requirement, driver_signature_date, 
                                        signature_driver_name, [signature], r01_comments, r01_inserted_on, r01_batch_id, r02_pre_trip, 
                                        r02_post_trip, r02_satisfactory, r02_defective, r02_na, r02_yes, r02_no, r02_kes, r02_3rd_party,
                                        work_order_id)
        SELECT  link, report, report_number, CAST(report_date AS datetime), CAST(updated AS datetime), updated_time, [version],
                observer, observer_emp_num, duration, CAST(latitude AS float), CAST(longitude AS float), CAST(temperature AS float), 
                wind_speed, weather, score_percent, Q01, CAST(Q02 AS datetime), CAST(Q02_LAT AS float), CAST(Q02_LON AS float), 
                Q03, Q04, Q05, Q06, Q07, Q08, Q09, Q10, Q11, Q12, Q13, Q14, Q15, Q16, Q17, Q18, Q19, Q20, Q21, Q22, Q23, Q24, 
                Q25, Q26, Q27, Q28, Q29, Q30, Q41, Q42, Q43, Q44, Q45, Q46, Q47, Q48, Q49, Q50, Q51, Q52, Q53, Q54, Q55, Q56, 
                Q57, Q58, Q59, Q60, Q61, Q62, Q63, Q64, Q65, Q66, Q67, Q68, Q69, Q70, Q71, Q72, Q73, Q74, Q75, Q76, Q77, Q78, 
                CAST(Q79 AS datetime), Q80, Q81, Q82, Q83, Q84, CAST(Q85 AS datetime), Q86, Q87, R01_COMMENTS, R01_InsertedOn, 
                R01_BatchID, R02_PRETRIP, R02_POSTTRIP, R02_SATISFACTORY, R02_DEFECTIVE, R02_NA, R02_YES, R02_NO, R02_KES, R02_3RDPARTY,
                Q88_WorkOrderNum
        FROM dbo.IScout_159094

        -- UPDATE THE UPLOAD DATE
        UPDATE reporting.IScout_159094
        SET reporting.IScout_159094.upload_date = GETDATE()

        /* ----------------------------------------------------- SELECT TABLE OUTPUT -------------------------------------------------------- */

        /*This Select statement is used to trigger run of reporting.sp_dot_populate_bi_fields*/
        SELECT TOP 10 * FROM reporting.MDM_Assets
END;
GO


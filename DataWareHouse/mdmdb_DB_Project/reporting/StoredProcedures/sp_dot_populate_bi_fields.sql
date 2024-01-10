SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--DROP PROCEDURE [reporting].[sp_dot_populate_bi_fields];
CREATE PROCEDURE [reporting].[sp_dot_populate_bi_fields] 
AS
BEGIN

    /* ---------------------------------------------------------------- 
    POPULATE TIRE SIZE COLUMN 
    -----------------------------------------------------------------*/

    /*Update Tire Size column in reporting.MDM_Assets table with tire 
    value listed in reporting.MDM_AssetAttr*/

    UPDATE reporting.MDM_Assets 
    SET reporting.MDM_Assets.tire_size = tire_attr.attr_value
    FROM reporting.MDM_Assets
    JOIN    (SELECT * 
            FROM reporting.MDM_AssetAttr
            WHERE attr_code = 'TireSize') AS tire_attr
    ON reporting.MDM_Assets.asset_num = tire_attr.asset_num

  /* ---------------------------------------------------------------- 
    POPULATE TIRE SIZE 2 COLUMN 
    -----------------------------------------------------------------*/

    /*Update Tire Size column in reporting.MDM_Assets table with tire 
    value listed in reporting.MDM_AssetAttr*/

    UPDATE reporting.MDM_Assets 
    SET reporting.MDM_Assets.tire_size2 = tire_attr2.attr_value
    FROM reporting.MDM_Assets
    JOIN    (SELECT * 
            FROM reporting.MDM_AssetAttr
            WHERE attr_code = 'TireSize2') AS tire_attr2
    ON reporting.MDM_Assets.asset_num = tire_attr2.asset_num

/* ---------------------------------------------------------------- 
    POPULATE NUMBER OF AXLES COLUMN 
    -----------------------------------------------------------------*/

    /*Update Tire Size column in reporting.MDM_Assets table with
    value listed in reporting.MDM_AssetAttr*/

    UPDATE reporting.MDM_Assets 
    SET reporting.MDM_Assets.number_of_axles = number_of_axles.attr_value
    FROM reporting.MDM_Assets
    JOIN    (SELECT * 
            FROM reporting.MDM_AssetAttr
            WHERE attr_code = 'Number of Axles') AS number_of_axles
    ON reporting.MDM_Assets.asset_num = number_of_axles.asset_num


/* ---------------------------------------------------------------- 
    POPULATE LICENSE PLATE COLUMN 
    -----------------------------------------------------------------*/

    /*Update Tire Size column in reporting.MDM_Assets table with
    value listed in reporting.MDM_AssetAttr*/

    UPDATE reporting.MDM_Assets 
    SET reporting.MDM_Assets.license_plate = license_plate.attr_value
    FROM reporting.MDM_Assets
    JOIN    (SELECT * 
            FROM reporting.MDM_AssetAttr
            WHERE attr_code = 'License Plate') AS license_plate
    ON reporting.MDM_Assets.asset_num = license_plate.asset_num

    /* ---------------------------------------------------------------- 
    POPULATE 5TH WHEEL COLUMN
    -----------------------------------------------------------------*/
    
    /*Update 5th Wheel column in reporting.MDM_Assets table with 5th 
    Wheel value listed in reporting.MDM_AssetAttr*/

    UPDATE reporting.MDM_Assets 
    SET reporting.MDM_Assets.fifth_wheel = fifth_wheel.attr_value
    FROM reporting.MDM_Assets
    JOIN    (SELECT * 
            FROM reporting.MDM_AssetAttr
            WHERE attr_code = '5THWHEEL') AS fifth_wheel
    ON reporting.MDM_Assets.asset_num = fifth_wheel.asset_num


    /* ---------------------------------------------------------------- 
    POPULATE GrossVehicleWeight COLUMN *****
    -----------------------------------------------------------------*/
    
    /*Update 5th Wheel column in reporting.MDM_Assets table with 5th 
    Wheel value listed in reporting.MDM_AssetAttr*/

    UPDATE reporting.MDM_Assets 
    SET reporting.MDM_Assets.Gross_Vehicle_Weight = 
        REPLACE(REPLACE(GrossVehicleWeight.attr_value,' LBS',''),',','') 
    FROM reporting.MDM_Assets
    JOIN    (SELECT * 
            FROM reporting.MDM_AssetAttr
            WHERE attr_code = 'GrossVehicleWeight') AS GrossVehicleWeight
    ON reporting.MDM_Assets.asset_num = GrossVehicleWeight.asset_num

/* ---------------------------------------------------------------- 
FLAG IF AN ASSET CROSSES STATE LINES
-----------------------------------------------------------------*/

/*There are currently two Motive reporting tables. reporting.Motive_IFTA_Trips
will be used moving forward, but reporting.MotiveMiles must be used for all
historical reporting prior to 08/01/23

motive_jurs is a full list of assets and their locations between both the 
Motive_IFTA_Trips table and the Motive Miles table. Motive Miles jurisdictions
must be cast as state abbreviations*/

/*Update crossed_state_lines flag in reporting.MDM_Assets. Set flag equal
to one if one asset exists accross one or more jurisdictions in the MotiveMiles
table.*/

UPDATE reporting.MDM_Assets
SET reporting.MDM_Assets.crosses_state_lines = 0
-- updated 77 total
UPDATE reporting.MDM_Assets
    SET reporting.MDM_Assets.crosses_state_lines = 1
    FROM reporting.MDM_Assets
    JOIN (
        -- UNIT 1 with a UNIT 2 that crosses state lines  
        select distinct asset_num 
        from (
            select asset_num, trailer_asset_num, report_date, count(*) cnt
            from (
                select distinct t1.[asset_num], t3.[asset_class], [jurisdiction], t2.trailer_asset_num, CAST ([REPORT_DATE] as DATE) AS REPORT_DATE
                FROM [reporting].[vw_dot_motive] t1, 
                [reporting].[vw_dot_dvir] t2,
                reporting.MDM_Assets t3
                WHERE t1.[asset_num] = t2.asset_num
                and t3.asset_num = t1.asset_num
                and t2.trailer_asset_num is not null
                and t2.trailer_asset_num != 'none_found'
            ) x
            group by asset_num, trailer_asset_num, report_date
            having count(*) > 1
        ) y
        UNION
        -- UNIT 2 pulled by a UNIT 1 that crosses state lines  
        select distinct trailer_asset_num 
        from (
            select asset_num, trailer_asset_num, report_date, count(*) cnt
            from (
                select distinct t1.[asset_num], t3.[asset_class], [jurisdiction], t2.trailer_asset_num, CAST ([REPORT_DATE] as DATE) AS REPORT_DATE
                FROM [reporting].[vw_dot_motive] t1, 
                [reporting].[vw_dot_dvir] t2,
                reporting.MDM_Assets t3
                WHERE t1.[asset_num] = t2.asset_num
                and t3.asset_num = t1.asset_num
                and t2.trailer_asset_num is not null
                and t2.trailer_asset_num != 'none_found'
            ) x
            group by asset_num, trailer_asset_num, report_date
            having count(*) > 1
        ) y
        union
        -- UNIT 1 without a UNIT 2 that crosses state lines
        select distinct asset_num 
        from (
            select asset_num, report_date, count(*) cnt
            from (
                select distinct t1.[asset_num], t3.[asset_class], [jurisdiction], t2.trailer_asset_num, CAST ([REPORT_DATE] as DATE) AS REPORT_DATE
                FROM [reporting].[vw_dot_motive] t1, 
                [reporting].[vw_dot_dvir] t2,
                reporting.MDM_Assets t3
                WHERE t1.[asset_num] = t2.asset_num
                and t3.asset_num = t1.asset_num
                and t2.trailer_asset_num is null
            ) x
            group by asset_num, report_date
            having count(*) > 1
        ) y
    ) AS u1
    ON reporting.MDM_Assets.asset_num = u1.asset_num


                /* ---------------------------------------------------------------- 
FLAG IF AN ASSET CROSSES STATE LINES WITH TRAILER
-----------------------------------------------------------------*/

/*There are currently two Motive reporting tables. reporting.Motive_IFTA_Trips
will be used moving forward, but reporting.MotiveMiles must be used for all
historical reporting prior to 08/01/23

motive_jurs is a full list of assets and their locations between both the 
Motive_IFTA_Trips table and the Motive Miles table. Motive Miles jurisdictions
must be cast as state abbreviations*/

/*Update crossed_state_lines flag in reporting.MDM_Assets. Set flag equal
to one if one asset exists accross one or more jurisdictions in the MotiveMiles
table.*/

UPDATE reporting.MDM_Assets
SET reporting.MDM_Assets.crosses_state_lines_with_trailer = 0
-- updated 77 total
UPDATE reporting.MDM_Assets
    SET reporting.MDM_Assets.crosses_state_lines_with_trailer = 1
    FROM reporting.MDM_Assets
    JOIN (
        -- UNIT 1 with a UNIT 2 that crosses state lines  
        select distinct asset_num 
        from (
            select asset_num, trailer_asset_num, report_date, count(*) cnt
            from (
                select distinct t1.[asset_num], t3.[asset_class], [jurisdiction], t2.trailer_asset_num, CAST ([REPORT_DATE] as DATE) AS REPORT_DATE
                FROM [reporting].[vw_dot_motive] t1, 
                [reporting].[vw_dot_dvir] t2,
                reporting.MDM_Assets t3
                WHERE t1.[asset_num] = t2.asset_num
                and t3.asset_num = t1.asset_num
                and t2.trailer_asset_num is not null
                and t2.trailer_asset_num != 'none_found'
            ) x
            group by asset_num, trailer_asset_num, report_date
            having count(*) > 1
        ) y
        UNION
        -- UNIT 2 pulled by a UNIT 1 that crosses state lines  
        select distinct trailer_asset_num 
        from (
            select asset_num, trailer_asset_num, report_date, count(*) cnt
            from (
                select distinct t1.[asset_num], t3.[asset_class], [jurisdiction], t2.trailer_asset_num, CAST ([REPORT_DATE] as DATE) AS REPORT_DATE
                FROM [reporting].[vw_dot_motive] t1, 
                [reporting].[vw_dot_dvir] t2,
                reporting.MDM_Assets t3
                WHERE t1.[asset_num] = t2.asset_num
                and t3.asset_num = t1.asset_num
                and t2.trailer_asset_num is not null
                and t2.trailer_asset_num != 'none_found'
            ) x
            group by asset_num, trailer_asset_num, report_date
            having count(*) > 1
        ) y
    ) AS u1
    ON reporting.MDM_Assets.asset_num = u1.asset_num
    /* Add section to populate trailers that cross state lines regardless of date *****/


    /* ---------------------------------------------------------------- 
    FLAG IF HAS TRAILER ATTACHED ON DVIR
    -----------------------------------------------------------------*/

    /*If asset is ever listed as having a trailer attached in DVIR report
    set the trailer_attached_dvir flag in reporting.MDM_Assets equal to 1.
    The is_trailer_pulled field in the DVIR report indicates if a trailer
    is attached.*/

    UPDATE reporting.MDM_Assets
    SET reporting.MDM_Assets.trailer_attached_dvir = 0

    UPDATE reporting.MDM_Assets
    SET reporting.MDM_Assets.trailer_attached_dvir = 1
    WHERE EXISTS (
        SELECT 1
        FROM reporting.IScout_159094
        WHERE reporting.MDM_Assets.asset_num = reporting.IScout_159094.asset_num
        AND reporting.IScout_159094.is_trailer_pulled = 'Yes'
    )

    /* ---------------------------------------------------------------- 
    FLAG IF ATTACHED AS TRAILER ON DVIR
    -----------------------------------------------------------------*/
    
    /*If asset is ever listed as being attached as trailer in DVIR report
    set the attached_as_trailer_dvir flag in reporting.MDM_Assets equal to 1.
    If an asset is attached as a trailer in a DVIR the trailer_asset_num
    field in the DVIR report will be populated with the asset number.*/

    UPDATE reporting.MDM_Assets
    SET reporting.MDM_Assets.attached_as_trailer_dvir = 0

    UPDATE reporting.MDM_Assets
    SET reporting.MDM_Assets.attached_as_trailer_dvir = 1
    WHERE EXISTS (
        SELECT 1
        FROM reporting.IScout_159094
        WHERE reporting.MDM_Assets.asset_num = reporting.IScout_159094.trailer_asset_num
    )

    /* ---------------------------------------------------------------- 
    CREATE DOT FIELDS POPULATED FLAG
    -----------------------------------------------------------------*/

    /*All DOT Assets must have the fields manufacturer, serial number
    and tire size populated. Set dot_fields_populated flag equal to 1
    if an asset has all DOT fields populated.*/

    UPDATE reporting.MDM_Assets
    SET reporting.MDM_Assets.dot_fields_populated = 0

    UPDATE reporting.MDM_Assets
    SET reporting.MDM_Assets.dot_fields_populated = 1
    WHERE   manufacturer IS NOT NULL 
            AND serial_num IS NOT NULL 
            AND tire_size IS NOT NULL


    /* ---------------------------------------------------------------- 
    CREATE DOT ROADSIDE INSPECTION FLAG
    -----------------------------------------------------------------*/

    /* If asset has a roadside inspection listed in the USDOT_Inspections report 
       then the dot_roadside_inspection flag is set to 1. */

    UPDATE reporting.MDM_Assets
    SET reporting.MDM_Assets.dot_roadside_inspection = 0

    UPDATE reporting.MDM_Assets
    SET reporting.MDM_Assets.dot_roadside_inspection = 1
    FROM reporting.MDM_Assets
    JOIN (
        SELECT distinct asset_num
        FROM reporting.MDM_Assets
        JOIN [dbo].[USDOT_Inspections] 
        ON [V1VIN] = reporting.MDM_Assets.serial_num 
            OR [V2VIN] = reporting.MDM_Assets.serial_num
        WHERE ([V1VIN] = serial_num OR [V2VIN] = serial_num)
        AND status_desc IN ('WORKING', 'DOWN FOR REPAIR', 'IDLE', 'AVAILABLE', 'NEEDS REPAIR', 'DEPLOYED')
    ) AS x
    ON reporting.MDM_Assets.asset_num = x.asset_num

    /* ---------------------------------------------------------------- 
    CREATE FLAG FOR ASSETS WITH WORK ORDERS IN THE LAST 120 DAYS
    -----------------------------------------------------------------*/

    /*The work orders table only contains work orders from the last 120 days.
    Update the work_order flag in reporting.MDM_Assets if the asset has a 
    corresponding work order in the Work Order Jobs table. We use the Work 
    Order Jobs table because it contains asset number information.*/

    UPDATE reporting.MDM_Assets
    SET reporting.MDM_Assets.work_order = 0

    UPDATE reporting.MDM_Assets
    SET reporting.MDM_Assets.work_order = 1
    WHERE EXISTS (
        SELECT 1
        FROM reporting.d365_workOrderJobs
        WHERE reporting.MDM_Assets.asset_num = reporting.d365_workOrderJobs.asset_num
    )

    /* ---------------------------------------------------------------- 
    CREATE FLAG FOR MOTIVE DATA WITH DVIR
    -----------------------------------------------------------------*/

    /*Create a flag in the Motive tables if the Motive record has a corresponding
    DVIR record DVIR and Motive tables are joined by Asset number and Date.
    This is perfomred on both the Motive_IFTA_Trips table and Motive Miles
    table.*/

    UPDATE reporting.Motive_IFTA_Trips
    SET reporting.Motive_IFTA_Trips.dvir_record = 0

    UPDATE reporting.Motive_IFTA_Trips
    SET reporting.Motive_IFTA_Trips.dvir_record = 1
    WHERE EXISTS (
        SELECT 1
        FROM reporting.IScout_159094
        WHERE   reporting.Motive_IFTA_Trips.asset_num = reporting.IScout_159094.asset_num AND
                reporting.Motive_IFTA_Trips.date = CAST(reporting.IScout_159094.report_date as date)
    )

    UPDATE reporting.MotiveMiles
    SET reporting.MotiveMiles.dvir_record = 0

    UPDATE reporting.MotiveMiles
    SET reporting.MotiveMiles.dvir_record = 1
    WHERE EXISTS (
        SELECT 1
        FROM reporting.IScout_159094
        WHERE   reporting.MotiveMiles.asset_num = reporting.IScout_159094.asset_num AND
                reporting.MotiveMiles.date = CAST(reporting.IScout_159094.report_date as date)
    )

    /* ---------------------------------------------------------------- 
    CREATE FLAG FOR PROPER DOT ATTACHMENTS
    -----------------------------------------------------------------*/

    /*All DOT Assets need to have the following attachments:
    - DOT Registration that is not expired
    - DOT Inspection with an expiration date not expired
    - DOT DVIR with a link to a DVIR (kpa) file
    Set the has_documentation flag equal to 1 if all of these requirements
    are fullfilled.
    
    Parent Asset Num and Asset Num are both the same in the AssetAttachment
    table. Here Parent Asset Num is used because it is more regularly populated.*/

    UPDATE reporting.mdm_Assets
    SET reporting.mdm_Assets.has_documentation = 0

    UPDATE reporting.MDM_Assets
    SET reporting.MDM_Assets.has_documentation = 1
    WHERE reporting.MDM_Assets.asset_num IN (
        SELECT parent_asset_num
        FROM reporting.D365_AssetAttachments
        WHERE   (type_id = 'DOT-Registration' AND kex_expiration_datetime > GETDATE()) 
                OR (type_id = 'DOT-Yearly Inspec' AND kex_expiration_datetime > GETDATE())
                OR (type_id = 'DOT-DVIR' AND notes LIKE '%kpaehs%')
        GROUP BY parent_asset_num
        HAVING COUNT(DISTINCT type_id) = 3
    )

END;
GO

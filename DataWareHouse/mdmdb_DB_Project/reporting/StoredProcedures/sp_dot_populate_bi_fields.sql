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

    ;WITH motive_jurs AS (
        SELECT asset_num, jurisdiction
        FROM reporting.Motive_IFTA_Trips
        UNION
        SELECT  asset_num,  
                jurisdiction =
                CASE 
                    WHEN jurisdiction = 'Alabama' THEN 'AL'
                    WHEN jurisdiction = 'Alaska' THEN 'AK' 
                    WHEN jurisdiction = 'Arizona' THEN 'AZ' 
                    WHEN jurisdiction = 'Arkansas' THEN 'AR' 
                    WHEN jurisdiction = 'California' THEN 'CA' 
                    WHEN jurisdiction = 'Colorado' THEN 'CO' 
                    WHEN jurisdiction = 'Connecticut' THEN 'CT' 
                    WHEN jurisdiction = 'Delaware' THEN 'DE' 
                    WHEN jurisdiction = 'District of Columbia' THEN 'DC' 
                    WHEN jurisdiction = 'Florida' THEN 'FL' 
                    WHEN jurisdiction = 'Georgia' THEN 'GA' 
                    WHEN jurisdiction = 'Hawaii' THEN 'HI' 
                    WHEN jurisdiction = 'Idaho' THEN 'ID' 
                    WHEN jurisdiction = 'Illinois' THEN 'IL' 
                    WHEN jurisdiction = 'Indiana' THEN 'IN' 
                    WHEN jurisdiction = 'Iowa' THEN 'IA' 
                    WHEN jurisdiction = 'Kansas' THEN 'KS' 
                    WHEN jurisdiction = 'Kentucky' THEN 'KY' 
                    WHEN jurisdiction = 'Louisiana' THEN 'LA' 
                    WHEN jurisdiction = 'Maine' THEN 'ME' 
                    WHEN jurisdiction = 'Maryland' THEN 'MD' 
                    WHEN jurisdiction = 'Massachusetts' THEN 'MA' 
                    WHEN jurisdiction = 'Michigan' THEN 'MI' 
                    WHEN jurisdiction = 'Minnesota' THEN 'MN' 
                    WHEN jurisdiction = 'Mississippi' THEN 'MS' 
                    WHEN jurisdiction = 'Missouri' THEN 'MO' 
                    WHEN jurisdiction = 'Montana' THEN 'MT' 
                    WHEN jurisdiction = 'Nebraska' THEN 'NE' 
                    WHEN jurisdiction = 'Nevada' THEN 'NV' 
                    WHEN jurisdiction = 'New Hampshire' THEN 'NH' 
                    WHEN jurisdiction = 'New Jersey' THEN 'NJ' 
                    WHEN jurisdiction = 'New Mexico' THEN 'NM' 
                    WHEN jurisdiction = 'New York' THEN 'NY' 
                    WHEN jurisdiction = 'North Carolina' THEN 'NC' 
                    WHEN jurisdiction = 'North Dakota' THEN 'ND' 
                    WHEN jurisdiction = 'Ohio' THEN 'OH' 
                    WHEN jurisdiction = 'Oklahoma' THEN 'OK' 
                    WHEN jurisdiction = 'Oregon' THEN 'OR' 
                    WHEN jurisdiction = 'Pennsylvania' THEN 'PA' 
                    WHEN jurisdiction = 'Rhode Island' THEN 'RI' 
                    WHEN jurisdiction = 'South Carolina' THEN 'SC' 
                    WHEN jurisdiction = 'South Dakota' THEN 'SD' 
                    WHEN jurisdiction = 'Tennessee' THEN 'TN' 
                    WHEN jurisdiction = 'Texas' THEN 'TX' 
                    WHEN jurisdiction = 'Utah' THEN 'UT' 
                    WHEN jurisdiction = 'Vermont' THEN 'VT' 
                    WHEN jurisdiction = 'Virginia' THEN 'VA' 
                    WHEN jurisdiction = 'Washington' THEN 'WA' 
                    WHEN jurisdiction = 'West Virginia' THEN 'WV' 
                    WHEN jurisdiction = 'Wisconsin' THEN 'WI' 
                    WHEN jurisdiction = 'Wyoming' THEN 'WY'
                    WHEN jurisdiction = 'México' THEN 'MX' 
                    ELSE NULL
                END
        FROM reporting.MotiveMiles
    )
    UPDATE reporting.MDM_Assets
    SET reporting.MDM_Assets.crosses_state_lines = 1
    FROM reporting.MDM_Assets
    JOIN (
        SELECT  asset_num, 
                COUNT(DISTINCT jurisdiction) as jur_count
        FROM motive_jurs
        GROUP BY asset_num
        HAVING COUNT(DISTINCT jurisdiction) > 1) AS csl_motive
    ON reporting.MDM_Assets.asset_num = csl_motive.asset_num

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


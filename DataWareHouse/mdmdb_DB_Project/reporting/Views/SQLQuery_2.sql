SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE EXTERNAL TABLE [dbo].[MDM_Assets]
(
    -- column definitions here should match the MDM_Assets table
)
WITH
(
    DATA_SOURCE = RemoteReferenceData,
    SCHEMA_NAME = 'dbo',
    OBJECT_NAME = 'MDM_Assets'
);

CREATE PROCEDURE [raw].[sp_dot_reload_tables] 
AS
BEGIN 

        /* -------------------------------------------------- UPDATE THE ASSETS TABLE ---------------------------------------------------- */
        TRUNCATE TABLE [raw].[MDM_Assets]

        INSERT INTO [raw].[MDM_Assets] (asset_id, asset_num, asset_desc, asset_class, manufacturer, model, 
                                        model_year, series, serial_num, [status], status_desc, source, marketed, 
                                        revenue_track, parent_asset_num, child_relationship_type, loco_code, 
                                        loco_name, loca_code, loca_name, mktp_code, mktp_name, lvl1_code, lvl1_name, 
                                        lob_code, lob_name, dist_code, dist_name, mare_code, mare_name, yard_code, yard_name)
        SELECT *
        FROM [mdmdb].[dbo].[MDM_Assets]

        -- UPDATE THE UPLOAD DATE
        UPDATE [raw].[MDM_Assets]
        SET [raw].[MDM_Assets].upload_date = GETDATE()

        /* ----------------------------------------------- UPDATE THE ASSET ATTRIBUTES TABLE ---------------------------------------------- */
        TRUNCATE TABLE reporting.MDM_AssetAttr

        INSERT INTO reporting.MDM_AssetAttr (asset_id, asset_num, attr_code, attr_value)
        SELECT *
        FROM dbo.MDM_AssetAttr

        -- UPDATE THE UPLOAD DATE
        UPDATE reporting.MDM_AssetAttr
        SET reporting.MDM_AssetAttr.upload_date = GETDATE()

        /* ----------------------------------------------------- SELECT TABLE OUTPUT -------------------------------------------------------- */

        /*This Select statement is used to trigger run of reporting.sp_dot_populate_bi_fields*/
        SELECT TOP 10 * FROM raw.MDM_Assets
END;
GO

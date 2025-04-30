SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- DROP TABLE [reporting].[MDM_Assets]
CREATE TABLE [reporting].[MDM_Assets] (
    [asset_id]                         INT            NOT NULL,
    [asset_num]                        NVARCHAR (60)  NOT NULL,
    [asset_desc]                       NVARCHAR (255) NULL,
    [asset_class]                      NVARCHAR (255) NULL,
    [manufacturer]                     NVARCHAR (255) NULL,
    [model]                            NVARCHAR (255) NULL,
    [model_year]                       NVARCHAR (255) NULL,
    [series]                           NVARCHAR (255) NULL,
    [serial_num]                       NVARCHAR (255) NULL,
    [status]                           NVARCHAR (20)  NULL,
    [status_desc]                      NVARCHAR (255) NULL,
    [source]                           NVARCHAR (20)  NULL,
    [marketed]                         BIT            NULL,
    [revenue_track]                    BIT            NULL,
    [parent_asset_num]                 NVARCHAR (20)  NULL,
    [child_relationship_type]          NVARCHAR (80)  NULL,
    [loco_code]                        NVARCHAR (20)  NULL,
    [loco_name]                        NVARCHAR (100) NULL,
    [loca_code]                        NVARCHAR (20)  NULL,
    [loca_name]                        NVARCHAR (100) NULL,
    [mktp_code]                        NVARCHAR (20)  NULL,
    [mktp_name]                        NVARCHAR (100) NULL,
    [lvl1_code]                        NVARCHAR (20)  NULL,
    [lvl1_name]                        NVARCHAR (100) NULL,
    [lob_code]                         NVARCHAR (20)  NULL,
    [lob_name]                         NVARCHAR (100) NULL,
    [dist_code]                        NVARCHAR (20)  NULL,
    [dist_name]                        NVARCHAR (100) NULL,
    [mare_code]                        NVARCHAR (20)  NULL,
    [mare_name]                        NVARCHAR (100) NULL,
    [yard_code]                        NVARCHAR (20)  NULL,
    [yard_name]                        NVARCHAR (100) NULL,
    [tire_size]                        NVARCHAR (255) NULL,
    [tire_size2]                       NVARCHAR (255) NULL,
    [fifth_wheel]                      NVARCHAR (255) NULL,
    [License_Plate]                    NVARCHAR (50)  NULL,
    [Number_of_Axles]                  NVARCHAR (5)   NULL,
    [Gross_Vehicle_Weight]             INT            NULL,
    [dot_roadside_inspection]          BIT            NULL,
    [crosses_state_lines]              BIT            NULL,
    [crosses_state_lines_with_trailer] BIT            NULL,
    [trailer_attached_dvir]            BIT            NULL,
    [attached_as_trailer_dvir]         BIT            NULL,
    [dot_fields_populated]             BIT            NULL,
    [work_order]                       NVARCHAR (255) NULL,
    [has_documentation]                BIT            NULL,
    [upload_date]                      DATETIME       NULL
);
GO

CREATE NONCLUSTERED INDEX [idx_MDM_Assets_serial_num]
    ON [reporting].[MDM_Assets]([serial_num] ASC)
    INCLUDE([asset_num], [asset_desc], [asset_class]);
GO


CREATE NONCLUSTERED INDEX [idx_MDM_Assets_status]
    ON [reporting].[MDM_Assets]([status] ASC);
GO


CREATE NONCLUSTERED INDEX [idx_MDM_Assets_status_desc]
    ON [reporting].[MDM_Assets]([status_desc] ASC)
    INCLUDE([asset_num], [asset_class], [mktp_name], [yard_code], [Gross_Vehicle_Weight], [dot_roadside_inspection], [crosses_state_lines], [crosses_state_lines_with_trailer], [attached_as_trailer_dvir]);
GO


CREATE NONCLUSTERED INDEX [IX_reporting_MDM_Assets_asset_class]
    ON [reporting].[MDM_Assets]([asset_class] ASC, [status_desc] ASC)
    INCLUDE([asset_num], [asset_desc], [manufacturer], [serial_num], [status], [loco_code], [loco_name], [mktp_code], [mktp_name], [yard_code], [yard_name], [Gross_Vehicle_Weight], [dot_roadside_inspection], [crosses_state_lines], [crosses_state_lines_with_trailer], [attached_as_trailer_dvir]);
GO


CREATE NONCLUSTERED INDEX [IX_reporting_MDM_Assets_asset_num]
    ON [reporting].[MDM_Assets]([asset_num] ASC);
GO


CREATE NONCLUSTERED INDEX [IX_reporting_MDM_Assets_attached_as_trailer_dvir]
    ON [reporting].[MDM_Assets]([asset_num] ASC)
    INCLUDE([attached_as_trailer_dvir]);
GO


CREATE NONCLUSTERED INDEX [IX_reporting_MDM_Assets_Gross_Vehicle_Weight]
    ON [reporting].[MDM_Assets]([asset_num] ASC)
    INCLUDE([Gross_Vehicle_Weight]);
GO


CREATE NONCLUSTERED INDEX [IX_reporting_MDM_Assets_status_desc2]
    ON [reporting].[MDM_Assets]([status_desc] ASC)
    INCLUDE([asset_num], [asset_class], [loco_code], [loca_name], [yard_code], [Gross_Vehicle_Weight], [dot_roadside_inspection], [crosses_state_lines], [crosses_state_lines_with_trailer], [attached_as_trailer_dvir]);
GO


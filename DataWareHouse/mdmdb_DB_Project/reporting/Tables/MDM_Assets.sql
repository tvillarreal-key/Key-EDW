--DROP TABLE [reporting].[MDM_Assets];
CREATE TABLE [reporting].[MDM_Assets] (    
    [asset_id]                 INT            NOT NULL,
    [asset_num]                NVARCHAR (60)  NOT NULL,
    [asset_desc]               NVARCHAR (255) NULL,
    [asset_class]              NVARCHAR (255) NULL,
    [manufacturer]             NVARCHAR (255) NULL,
    [model]                    NVARCHAR (255) NULL,
    [model_year]               NVARCHAR (255) NULL,
    [series]                   NVARCHAR (255) NULL,
    [serial_num]               NVARCHAR (255) NULL,
    [status]                   NVARCHAR (20)  NULL,
    [status_desc]              NVARCHAR (255) NULL,
    [source]                   NVARCHAR (20)  NULL,
    [marketed]                 BIT            NULL,
    [revenue_track]            BIT            NULL,
    [parent_asset_num]         NVARCHAR (20)  NULL,
    [child_relationship_type]  NVARCHAR (80)  NULL,
    [loco_code]                NVARCHAR (20)  NULL,
    [loco_name]                NVARCHAR (100) NULL,
    [loca_code]                NVARCHAR (20)  NULL,
    [loca_name]                NVARCHAR (100) NULL,
    [mktp_code]                NVARCHAR (20)  NULL,
    [mktp_name]                NVARCHAR (100) NULL,
    [lvl1_code]                NVARCHAR (20)  NULL,
    [lvl1_name]                NVARCHAR (100) NULL,
    [lob_code]                 NVARCHAR (20)  NULL,
    [lob_name]                 NVARCHAR (100) NULL,
    [dist_code]                NVARCHAR (20)  NULL,
    [dist_name]                NVARCHAR (100) NULL,
    [mare_code]                NVARCHAR (20)  NULL,
    [mare_name]                NVARCHAR (100) NULL,
    [yard_code]                NVARCHAR (20)  NULL,
    [yard_name]                NVARCHAR (100) NULL,
    [tire_size]                NVARCHAR (255) NULL,
    [tire_size2]               NVARCHAR (255) NULL,
    [fifth_wheel]              NVARCHAR (255) NULL,
    [License_Plate]            NVARCHAR (25) NULL,
    [Number_of_Axles]          NVARCHAR (5) NULL,
    [Gross_Vehicle_Weight]     NVARCHAR (20)  NULL,
    [crosses_state_lines]               BIT            NULL,
    [crosses_state_lines_with_trailer]  BIT            NULL,
    [trailer_attached_dvir]             BIT            NULL,
    [attached_as_trailer_dvir] BIT            NULL,
    [dot_fields_populated]     BIT            NULL,
    [work_order]               NVARCHAR (255) NULL,
    [has_documentation]        BIT            NULL,
    [upload_date]              DATETIME       NULL
);
GO


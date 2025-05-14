CREATE TABLE [dbo].[Motive_Vehicles] (
    [ID]                           INT            NOT NULL,
    [company_id]                   INT            NULL,
    [number]                       NVARCHAR (50)  NULL,
    [status]                       NVARCHAR (50)  NULL,
    [ifta]                         NVARCHAR (5)   NULL,
    [vin]                          NVARCHAR (50)  NULL,
    [make]                         NVARCHAR (50)  NULL,
    [model]                        NVARCHAR (50)  NULL,
    [year]                         NVARCHAR (50)  NULL,
    [license_plate_state]          NVARCHAR (50)  NULL,
    [license_plate_number]         NVARCHAR (50)  NULL,
    [metric_units]                 NVARCHAR (5)   NULL,
    [fuel_type]                    NVARCHAR (50)  NULL,
    [prevent_auto_odometer_entry]  NVARCHAR (5)   NULL,
    [notes]                        NVARCHAR (MAX) NULL,
    [driver_facing_camera]         INT            NULL,
    [incab_audio_recording]        INT            NULL,
    [group_ids]                    NVARCHAR (100) NULL,
    [created_at]                   NVARCHAR (50)  NULL,
    [updated_at]                   NVARCHAR (50)  NULL,
    [permDriver_id]                INT            NULL,
    [PermDriver_firstname]         NVARCHAR (50)  NULL,
    [PermDriver_lastname]          NVARCHAR (50)  NULL,
    [eld_id]                       INT            NULL,
    [eld_identifier]               NVARCHAR (50)  NULL,
    [eld_model]                    NVARCHAR (50)  NULL,
    [CurrDriver_id]                INT            NULL,
    [CurrDriver_firstname]         NVARCHAR (50)  NULL,
    [CurrDriver_lastname]          NVARCHAR (50)  NULL,
    [CurrDriver_username]          NVARCHAR (50)  NULL,
    [CurrDriver_email]             NVARCHAR (50)  NULL,
    [CurrDriver_dirver_company_id] NVARCHAR (50)  NULL,
    [CurrDriver_status]            NVARCHAR (50)  NULL,
    [CurrDriver_role]              NVARCHAR (50)  NULL,
    [external_ids]                 NVARCHAR (100) NULL
);
GO

ALTER TABLE [dbo].[Motive_Vehicles]
    ADD CONSTRAINT [PK_Motive_Vehicles] PRIMARY KEY CLUSTERED ([ID] ASC);
GO


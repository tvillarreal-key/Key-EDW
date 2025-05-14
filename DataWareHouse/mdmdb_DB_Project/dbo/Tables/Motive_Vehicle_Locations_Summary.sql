CREATE TABLE [dbo].[Motive_Vehicle_Locations_Summary] (
    [vehicle_id]             INT              NOT NULL,
    [summary_date]           DATE             NOT NULL,
    [asset_number]           VARCHAR (20)     NULL,
    [asset_class]            VARCHAR (50)     NULL,
    [count_location_records] INT              NULL,
    [motive_status]          VARCHAR (20)     NULL,
    [mdm_status]             VARCHAR (20)     NULL,
    [start_odometer]         DECIMAL (20, 11) NULL,
    [end_odometer]           DECIMAL (20, 11) NULL,
    [dif_odometer]           DECIMAL (20, 11) NULL,
    [start_engine_hrs]       DECIMAL (20, 11) NULL,
    [end_engine_hrs]         DECIMAL (20, 11) NULL,
    [dif_engine_hrs]         DECIMAL (20, 11) NULL,
    [start_true_odometer]    DECIMAL (20, 11) NULL,
    [end_true_odometer]      DECIMAL (20, 11) NULL,
    [dif_true_odometer]      DECIMAL (20, 11) NULL,
    [start_true_engine_hrs]  DECIMAL (20, 11) NULL,
    [end_true_engine_hrs]    DECIMAL (20, 11) NULL,
    [dif_true_engine_hrs]    DECIMAL (20, 11) NULL,
    [start_fuel]             DECIMAL (20, 11) NULL,
    [end_fuel]               DECIMAL (20, 11) NULL,
    [dif_fuel]               DECIMAL (20, 11) NULL,
    [created_on]             DATETIME2 (7)    NULL,
    [updated_on]             DATETIME2 (7)    NULL,
    [posted_on]              DATETIME2 (7)    NULL
);
GO

ALTER TABLE [dbo].[Motive_Vehicle_Locations_Summary]
    ADD CONSTRAINT [PK_Motive_Vehicle_Locations_Summary] PRIMARY KEY CLUSTERED ([vehicle_id] ASC, [summary_date] ASC);
GO


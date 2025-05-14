CREATE TABLE [dbo].[EngineHours_Stage] (
    [company_from]       VARCHAR (50)    NOT NULL,
    [external_id]        VARCHAR (50)    NULL,
    [external_id2]       VARCHAR (50)    NULL,
    [asset_name]         VARCHAR (100)   NULL,
    [asset_number]       VARCHAR (100)   NULL,
    [key_asset_number]   VARCHAR (20)    NULL,
    [latitude]           DECIMAL (18, 8) NULL,
    [longitude]          DECIMAL (18, 8) NULL,
    [position_datetime]  DATETIME2 (3)   NULL,
    [telemetry_datetime] DATETIME2 (3)   NULL,
    [total_engine_hours] DECIMAL (18, 1) NULL,
    [daily_engine_hours] DECIMAL (18, 1) NULL,
    [inserted_on]        DATETIME2 (3)   NULL
);
GO


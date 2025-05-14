CREATE TABLE [dbo].[Motive_Utilization] (
    [vehicle_id]      INT              NOT NULL,
    [start_date]      NVARCHAR (10)    NOT NULL,
    [end_date]        NVARCHAR (10)    NOT NULL,
    [vehicle_number]  NVARCHAR (50)    NULL,
    [year_model]      NVARCHAR (10)    NULL,
    [make]            NVARCHAR (50)    NULL,
    [model]           NVARCHAR (50)    NULL,
    [vin]             NVARCHAR (50)    NULL,
    [metric_units]    NVARCHAR (10)    NULL,
    [utilization]     NUMERIC (20, 14) NULL,
    [idle_time]       NUMERIC (18)     NULL,
    [idle_fuel]       NUMERIC (20, 14) NULL,
    [driving_time]    NUMERIC (18)     NULL,
    [driving_fuel]    NUMERIC (20, 14) NULL,
    [inserted_on]     DATETIME         NULL,
    [updated_on]      DATETIME         NULL,
    [mdm_asset_class] VARCHAR (50)     NULL
);
GO

CREATE NONCLUSTERED INDEX [missing_index_3071_3070]
    ON [dbo].[Motive_Utilization]([vehicle_number] ASC)
    INCLUDE([year_model], [make], [model], [vin], [idle_time], [driving_time]);
GO

ALTER TABLE [dbo].[Motive_Utilization]
    ADD CONSTRAINT [PK_Motive_Utilization] PRIMARY KEY CLUSTERED ([vehicle_id] ASC, [start_date] ASC, [end_date] ASC);
GO


CREATE TABLE [reporting].[Motive_IFTA_Trips] (
    [id]             INT              NOT NULL,
    [date]           DATE             NULL,
    [jurisdiction]   NVARCHAR (5)     NOT NULL,
    [vehicle_id]     INT              NOT NULL,
    [asset_num]      NVARCHAR (20)    NOT NULL,
    [year]           INT              NULL,
    [make]           NVARCHAR (20)    NULL,
    [model]          NVARCHAR (50)    NULL,
    [vin]            NVARCHAR (20)    NULL,
    [metric_units]   NVARCHAR (5)     NULL,
    [start_odometer] NUMERIC (20, 12) NULL,
    [end_odometer]   NUMERIC (20, 12) NULL,
    [start_lat]      NUMERIC (12, 7)  NULL,
    [start_lon]      NUMERIC (12, 7)  NULL,
    [end_lat]        NUMERIC (12, 7)  NULL,
    [end_lon]        NUMERIC (12, 7)  NULL,
    [distance]       NUMERIC (20, 12) NULL,
    [time_zone]      NVARCHAR (50)    NULL,
    [dvir_record]    BIT              NULL,
    [upload_date]    DATETIME         NULL
);
GO


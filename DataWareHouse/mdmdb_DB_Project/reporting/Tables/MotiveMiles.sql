CREATE TABLE [reporting].[MotiveMiles] (
    [date]            DATE           NULL,
    [asset_num]       NVARCHAR (255) NULL,
    [jurisdiction]    NVARCHAR (50)  NULL,
    [distance_mi]     FLOAT (53)     NULL,
    [odometer_start]  INT            NULL,
    [odometer_end]    INT            NULL,
    [manual_odo_edit] NVARCHAR (50)  NULL,
    [latitude_start]  FLOAT (53)     NULL,
    [longitude_start] FLOAT (53)     NULL,
    [latitude_end]    FLOAT (53)     NULL,
    [longitude_end]   FLOAT (53)     NULL,
    [insert_on]       DATE           NULL,
    [dvir_record]     BIT            NULL,
    [upload_date]     DATETIME       NULL
);
GO


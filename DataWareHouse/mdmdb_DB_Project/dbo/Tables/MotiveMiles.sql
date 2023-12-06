CREATE TABLE [dbo].[MotiveMiles] (
    [Date]            DATE          NULL,
    [Vehicle]         VARCHAR (10)  NULL,
    [Jurisdiction]    NVARCHAR (50) NULL,
    [Distance_mi]     FLOAT (53)    NULL,
    [Odometer_Start]  INT           NULL,
    [Odometer_End]    INT           NULL,
    [Manual_Odo_Edit] NVARCHAR (50) NULL,
    [Latitude_Start]  FLOAT (53)    NULL,
    [Longitude_Start] FLOAT (53)    NULL,
    [Latitude_End]    FLOAT (53)    NULL,
    [Longitude_End]   FLOAT (53)    NULL,
    [InsertOn]        DATE          NULL
);
GO


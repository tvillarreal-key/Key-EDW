CREATE TABLE [dbo].[Motive_IFTA_Trips] (
    [Id]             INT              NOT NULL,
    [Date]           NVARCHAR (10)    NOT NULL,
    [Jurisdiction]   NVARCHAR (5)     NOT NULL,
    [Vehicle_Id]     INT              NOT NULL,
    [Vehicle_number] NVARCHAR (20)    NOT NULL,
    [Year]           NVARCHAR (4)     NULL,
    [Make]           NVARCHAR (20)    NULL,
    [Model]          NVARCHAR (50)    NULL,
    [VIN]            NVARCHAR (20)    NULL,
    [Metric_Units]   NVARCHAR (5)     NULL,
    [Start_Odometer] NUMERIC (20, 12) NULL,
    [End_Odometer]   NUMERIC (20, 12) NULL,
    [Start_Lat]      NUMERIC (12, 7)  NULL,
    [Start_Lon]      NUMERIC (12, 7)  NULL,
    [End_Lat]        NUMERIC (12, 7)  NULL,
    [End_Lon]        NUMERIC (12, 7)  NULL,
    [Distance]       NUMERIC (20, 12) NULL,
    [Time_Zone]      NVARCHAR (50)    NULL
);
GO


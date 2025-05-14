CREATE TABLE [dbo].[KeyView_Sensor_Type] (
    [SENSOR_TYPE_ID]  NUMERIC (18)  NOT NULL,
    [DESCRIPTION]     VARCHAR (100) NULL,
    [UNIT_OF_MEASURE] VARCHAR (20)  NULL,
    [SERVICE_LEVEL]   INT           NULL,
    [VIEW_ORDER]      INT           NULL,
    [ACCURACY]        INT           NULL,
    [METRIC_UOM]      VARCHAR (20)  NULL
);
GO

ALTER TABLE [dbo].[KeyView_Sensor_Type]
    ADD CONSTRAINT [PK_KeyView_Sensor_Type] PRIMARY KEY CLUSTERED ([SENSOR_TYPE_ID] ASC);
GO


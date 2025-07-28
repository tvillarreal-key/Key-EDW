CREATE TABLE [dbo].[KeyView_SensorData] (
    [rig_id]           VARCHAR (20)  NOT NULL,
    [sensor_timestamp] VARCHAR (30)  NOT NULL,
    [sensor_type_id]   VARCHAR (50)  NOT NULL,
    [sensor_value]     VARCHAR (50)  NULL,
    [transmitted]      DATETIME2 (7) NULL,
    [extracted]        SMALLINT      NULL
);
GO

ALTER TABLE [dbo].[KeyView_SensorData]
    ADD CONSTRAINT [PK_KeyView_SensorData] PRIMARY KEY CLUSTERED ([rig_id] ASC, [sensor_timestamp] ASC, [sensor_type_id] ASC);
GO


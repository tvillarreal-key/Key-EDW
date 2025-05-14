CREATE TABLE [dbo].[KVP_SensorData] (
    [JOB_ID]           NUMERIC (18)  NOT NULL,
    [rig_id]           VARCHAR (20)  NOT NULL,
    [sensor_timestamp] VARCHAR (30)  NOT NULL,
    [sensor_type_id]   VARCHAR (50)  NOT NULL,
    [sensor_value]     VARCHAR (50)  NULL,
    [extracted]        DATETIME2 (7) NULL,
    [transmitted]      DATETIME2 (7) NULL
);
GO


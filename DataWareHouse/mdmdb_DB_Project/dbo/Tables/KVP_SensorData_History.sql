CREATE TABLE [dbo].[KVP_SensorData_History] (
    [loadFile]             VARCHAR (128) NULL,
    [rig_id]               INT           NULL,
    [min_sensor_timestamp] DATETIME2 (3) NULL,
    [max_sensor_timestamp] DATETIME2 (3) NULL
);
GO


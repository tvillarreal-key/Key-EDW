CREATE TABLE [dbo].[KeyView_SensorData_Stg2] (
    [rig_id]             INT           NULL,
    [sensor_timestamp]   DATETIME2 (3) NULL,
    [sensor_type_id]     INT           NULL,
    [sensor_value]       FLOAT (53)    NULL,
    [sensor_timestamp_s] VARCHAR (30)  NULL
);
GO

CREATE NONCLUSTERED INDEX [Index_KeyView_SensorData_Stg2_1]
    ON [dbo].[KeyView_SensorData_Stg2]([rig_id] ASC, [sensor_timestamp] ASC, [sensor_type_id] ASC);
GO


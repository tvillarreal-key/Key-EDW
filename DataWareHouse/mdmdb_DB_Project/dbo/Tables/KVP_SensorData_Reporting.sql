CREATE TABLE [dbo].[KVP_SensorData_Reporting] (
    [rig_id]             INT           NOT NULL,
    [sensor_timestamp]   DATETIME2 (3) NOT NULL,
    [sensor_type_id]     INT           NOT NULL,
    [sensor_value]       FLOAT (53)    NULL,
    [sensor_timestamp_s] VARCHAR (30)  NULL,
    [record_id]          INT           NULL,
    [extracted]          SMALLINT      NULL,
    [job_id]             NUMERIC (18)  NULL,
    [customer_ou_id]     NUMERIC (18)  NULL,
    [cu_org_unit]        VARCHAR (100) NULL
);
GO

ALTER TABLE [dbo].[KVP_SensorData_Reporting]
    ADD CONSTRAINT [PK_KVP_SensorData_Reporting] PRIMARY KEY CLUSTERED ([rig_id] ASC, [sensor_timestamp] ASC, [sensor_type_id] ASC);
GO


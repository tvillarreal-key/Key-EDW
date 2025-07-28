CREATE TABLE [dbo].[KeyView_JobSensorData_STG] (
    [rig_id]           VARCHAR (20)  NOT NULL,
    [sensor_timestamp] VARCHAR (30)  NOT NULL,
    [sensor_type_id]   VARCHAR (10)  NOT NULL,
    [sensor_value]     VARCHAR (50)  NULL,
    [job_id]           NUMERIC (18)  NULL,
    [DESCRIPTION]      VARCHAR (100) NULL,
    [UNIT_OF_MEASURE]  VARCHAR (20)  NULL,
    [SERVICE_LEVEL]    INT           NULL,
    [VIEW_ORDER]       INT           NULL,
    [ACCURACY]         INT           NULL,
    [METRIC_UOM]       VARCHAR (20)  NULL
);
GO

CREATE NONCLUSTERED INDEX [Index_KeyView_JobSensorData_STG_1]
    ON [dbo].[KeyView_JobSensorData_STG]([job_id] ASC);
GO


CREATE TABLE [dbo].[PBI_Dataset_Datasources] (
    [dataset_id]     VARCHAR (50)   NULL,
    [datasource_id]  NVARCHAR (50)  NULL,
    [gatewayId]      NVARCHAR (50)  NULL,
    [updated_at]     DATETIME       NULL,
    [datasourceType] NVARCHAR (50)  NULL,
    [serverName]     NVARCHAR (512) NULL,
    [databaseName]   NVARCHAR (512) NULL,
    [pathName]       NVARCHAR (512) NULL,
    [url]            NVARCHAR (512) NULL,
    [loginServer]    NVARCHAR (512) NULL,
    [classInfo]      NVARCHAR (50)  NULL
);
GO


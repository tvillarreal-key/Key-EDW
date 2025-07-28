CREATE TABLE [bronze].[freshservice_roles] (
    [roles.description]    VARCHAR (8000) NULL,
    [roles.privileges]     VARCHAR (8000) NULL,
    [roles.id]             BIGINT         NULL,
    [roles.name]           VARCHAR (8000) NULL,
    [roles.created_at]     VARCHAR (8000) NULL,
    [roles.updated_at]     VARCHAR (8000) NULL,
    [roles.default]        BIT            NULL,
    [roles.role_type]      BIGINT         NULL,
    [_ingestion_timestamp] VARCHAR (8000) NULL,
    [_pipeline_run_id]     VARCHAR (8000) NULL,
    [_source_name]         VARCHAR (8000) NULL
);


GO


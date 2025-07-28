CREATE TABLE [dbo].[silver.freshservice_roles_curated] (
    [id]                   BIGINT         NULL,
    [name]                 VARCHAR (8000) NULL,
    [description]          VARCHAR (8000) NULL,
    [role_type]            BIGINT         NULL,
    [default]              BIT            NULL,
    [created_at]           DATETIME2 (6)  NULL,
    [updated_at]           DATETIME2 (6)  NULL,
    [_ingestion_timestamp] DATETIME2 (6)  NULL,
    [_pipeline_run_id]     VARCHAR (8000) NULL,
    [_source_name]         VARCHAR (8000) NULL
);


GO


CREATE TABLE [dbo].[silver.freshservice_locations_curated] (
    [id]                   BIGINT         NULL,
    [name]                 VARCHAR (8000) NULL,
    [created_at]           DATETIME2 (6)  NULL,
    [updated_at]           DATETIME2 (6)  NULL,
    [_ingestion_timestamp] DATETIME2 (6)  NULL,
    [_pipeline_run_id]     VARCHAR (8000) NULL,
    [_source_name]         VARCHAR (8000) NULL
);


GO


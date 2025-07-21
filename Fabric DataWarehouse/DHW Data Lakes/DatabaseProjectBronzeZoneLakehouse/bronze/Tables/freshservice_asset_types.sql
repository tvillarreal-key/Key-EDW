CREATE TABLE [bronze].[freshservice_asset_types] (
    [asset_types.id]                   BIGINT         NULL,
    [asset_types.name]                 VARCHAR (8000) NULL,
    [asset_types.parent_asset_type_id] BIGINT         NULL,
    [asset_types.visible]              BIT            NULL,
    [asset_types.description]          VARCHAR (8000) NULL,
    [asset_types.created_at]           VARCHAR (8000) NULL,
    [asset_types.updated_at]           VARCHAR (8000) NULL,
    [_ingestion_timestamp]             VARCHAR (8000) NULL,
    [_pipeline_run_id]                 VARCHAR (8000) NULL,
    [_source_name]                     VARCHAR (8000) NULL
);


GO


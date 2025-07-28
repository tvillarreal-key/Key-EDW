CREATE TABLE [bronze].[freshservice_products] (
    [products.description]          VARCHAR (8000) NULL,
    [products.description_text]     VARCHAR (8000) NULL,
    [products.id]                   BIGINT         NULL,
    [products.created_at]           VARCHAR (8000) NULL,
    [products.updated_at]           VARCHAR (8000) NULL,
    [products.name]                 VARCHAR (8000) NULL,
    [products.manufacturer]         VARCHAR (8000) NULL,
    [products.asset_type_id]        BIGINT         NULL,
    [products.depreciation_type_id] VARCHAR (8000) NULL,
    [products.status]               VARCHAR (8000) NULL,
    [products.mode_of_procurement]  VARCHAR (8000) NULL,
    [_ingestion_timestamp]          VARCHAR (8000) NULL,
    [_pipeline_run_id]              VARCHAR (8000) NULL,
    [_source_name]                  VARCHAR (8000) NULL
);


GO


CREATE TABLE [bronze].[freshservice_locations] (
    [locations.address.line1]      VARCHAR (8000) NULL,
    [locations.address.line2]      VARCHAR (8000) NULL,
    [locations.address.city]       VARCHAR (8000) NULL,
    [locations.address.state]      VARCHAR (8000) NULL,
    [locations.address.country]    VARCHAR (8000) NULL,
    [locations.address.zipcode]    VARCHAR (8000) NULL,
    [locations.contact_name]       VARCHAR (8000) NULL,
    [locations.created_at]         VARCHAR (8000) NULL,
    [locations.email]              VARCHAR (8000) NULL,
    [locations.id]                 BIGINT         NULL,
    [locations.name]               VARCHAR (8000) NULL,
    [locations.parent_location_id] BIGINT         NULL,
    [locations.phone]              VARCHAR (8000) NULL,
    [locations.primary_contact_id] VARCHAR (8000) NULL,
    [locations.updated_at]         VARCHAR (8000) NULL,
    [locations.workspace_id]       BIGINT         NULL,
    [_ingestion_timestamp]         VARCHAR (8000) NULL,
    [_pipeline_run_id]             VARCHAR (8000) NULL,
    [_source_name]                 VARCHAR (8000) NULL
);


GO


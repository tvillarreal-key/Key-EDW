CREATE TABLE [bronze].[freshservice_requester_groups] (
    [requester_groups.id]           BIGINT         NULL,
    [requester_groups.name]         VARCHAR (8000) NULL,
    [requester_groups.description]  VARCHAR (8000) NULL,
    [requester_groups.workspace_id] BIGINT         NULL,
    [requester_groups.type]         VARCHAR (8000) NULL,
    [_ingestion_timestamp]          VARCHAR (8000) NULL,
    [_pipeline_run_id]              VARCHAR (8000) NULL,
    [_source_name]                  VARCHAR (8000) NULL
);


GO


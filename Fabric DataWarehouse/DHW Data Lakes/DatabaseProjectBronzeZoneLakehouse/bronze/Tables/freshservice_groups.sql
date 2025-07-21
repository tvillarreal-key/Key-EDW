CREATE TABLE [bronze].[freshservice_groups] (
    [groups.id]                         BIGINT         NULL,
    [groups.name]                       VARCHAR (8000) NULL,
    [groups.description]                VARCHAR (8000) NULL,
    [groups.escalate_to]                BIGINT         NULL,
    [groups.unassigned_for]             VARCHAR (8000) NULL,
    [groups.business_hours_id]          BIGINT         NULL,
    [groups.created_at]                 VARCHAR (8000) NULL,
    [groups.updated_at]                 VARCHAR (8000) NULL,
    [groups.auto_ticket_assign]         BIT            NULL,
    [groups.restricted]                 BIT            NULL,
    [groups.approval_required]          BIT            NULL,
    [groups.ocs_schedule_id]            VARCHAR (8000) NULL,
    [groups.workspace_id]               BIGINT         NULL,
    [groups.members]                    BIGINT         NULL,
    [groups.observers]                  BIGINT         NULL,
    [groups.leaders]                    VARCHAR (8000) NULL,
    [groups.members_pending_approval]   VARCHAR (8000) NULL,
    [groups.leaders_pending_approval]   VARCHAR (8000) NULL,
    [groups.observers_pending_approval] VARCHAR (8000) NULL,
    [_ingestion_timestamp]              VARCHAR (8000) NULL,
    [_pipeline_run_id]                  VARCHAR (8000) NULL,
    [_source_name]                      VARCHAR (8000) NULL
);


GO


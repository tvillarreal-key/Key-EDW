CREATE TABLE [dbo].[silver.freshservice_tickets_curated] (
    [id]                   BIGINT         NULL,
    [priority]             BIGINT         NULL,
    [status]               BIGINT         NULL,
    [source]               BIGINT         NULL,
    [group_id]             FLOAT (53)     NULL,
    [department_id]        FLOAT (53)     NULL,
    [requester_id]         BIGINT         NULL,
    [requested_for_id]     BIGINT         NULL,
    [responder_id]         FLOAT (53)     NULL,
    [description_text]     VARCHAR (8000) NULL,
    [subject]              VARCHAR (8000) NULL,
    [type]                 VARCHAR (8000) NULL,
    [category]             VARCHAR (8000) NULL,
    [sub_category]         VARCHAR (8000) NULL,
    [item_category]        VARCHAR (8000) NULL,
    [to_emails]            VARCHAR (8000) NULL,
    [fwd_emails]           VARCHAR (8000) NULL,
    [cc_emails]            VARCHAR (8000) NULL,
    [reply_cc_emails]      VARCHAR (8000) NULL,
    [due_by]               DATETIME2 (6)  NULL,
    [fr_due_by]            DATETIME2 (6)  NULL,
    [created_at]           DATETIME2 (6)  NULL,
    [updated_at]           DATETIME2 (6)  NULL,
    [is_escalated]         BIT            NULL,
    [fr_escalated]         BIT            NULL,
    [spam]                 BIT            NULL,
    [deleted]              BIT            NULL,
    [_ingestion_timestamp] DATETIME2 (6)  NULL,
    [_pipeline_run_id]     VARCHAR (8000) NULL,
    [_source_name]         VARCHAR (8000) NULL
);


GO


CREATE TABLE [freshservice].[problems] (
    [problems.id]                         BIGINT         NULL,
    [problems.agent_id]                   BIGINT         NULL,
    [problems.description]                VARCHAR (8000) NULL,
    [problems.description_text]           VARCHAR (8000) NULL,
    [problems.assets]                     VARCHAR (8000) NULL,
    [problems.requester_id]               BIGINT         NULL,
    [problems.subject]                    VARCHAR (8000) NULL,
    [problems.group_id]                   BIGINT         NULL,
    [problems.priority]                   BIGINT         NULL,
    [problems.impact]                     BIGINT         NULL,
    [problems.status]                     BIGINT         NULL,
    [problems.due_by]                     VARCHAR (8000) NULL,
    [problems.known_error]                BIT            NULL,
    [problems.department_id]              BIGINT         NULL,
    [problems.category]                   VARCHAR (8000) NULL,
    [problems.sub_category]               VARCHAR (8000) NULL,
    [problems.item_category]              VARCHAR (8000) NULL,
    [problems.created_at]                 VARCHAR (8000) NULL,
    [problems.updated_at]                 VARCHAR (8000) NULL,
    [problems.workspace_id]               BIGINT         NULL,
    [problems.attachments]                VARCHAR (8000) NULL,
    [problems.tasks_dependency_type]      BIGINT         NULL,
    [problems.attachments.attachment_url] VARCHAR (8000) NULL,
    [problems.attachments.canonical_url]  VARCHAR (8000) NULL,
    [problems.attachments.content_type]   VARCHAR (8000) NULL,
    [problems.attachments.created_at]     VARCHAR (8000) NULL,
    [problems.attachments.has_access]     BIT            NULL,
    [problems.attachments.id]             BIGINT         NULL,
    [problems.attachments.name]           VARCHAR (8000) NULL,
    [problems.attachments.size]           BIGINT         NULL,
    [problems.attachments.updated_at]     VARCHAR (8000) NULL
);


GO


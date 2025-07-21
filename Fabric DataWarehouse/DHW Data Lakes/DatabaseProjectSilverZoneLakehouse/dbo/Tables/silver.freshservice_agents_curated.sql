CREATE TABLE [dbo].[silver.freshservice_agents_curated] (
    [id]                   BIGINT         NULL,
    [first_name]           VARCHAR (8000) NULL,
    [last_name]            VARCHAR (8000) NULL,
    [email]                VARCHAR (8000) NULL,
    [work_phone_number]    VARCHAR (8000) NULL,
    [mobile_phone_number]  VARCHAR (8000) NULL,
    [job_title]            VARCHAR (8000) NULL,
    [address]              VARCHAR (8000) NULL,
    [department_names]     VARCHAR (8000) NULL,
    [location_name]        VARCHAR (8000) NULL,
    [employeeid]           FLOAT (53)     NULL,
    [language]             VARCHAR (8000) NULL,
    [reporting_manager_id] FLOAT (53)     NULL,
    [time_format]          VARCHAR (8000) NULL,
    [time_zone]            VARCHAR (8000) NULL,
    [last_login_at]        DATETIME2 (6)  NULL,
    [last_active_at]       DATETIME2 (6)  NULL,
    [created_at]           DATETIME2 (6)  NULL,
    [updated_at]           DATETIME2 (6)  NULL,
    [location_id]          FLOAT (53)     NULL,
    [has_logged_in]        BIT            NULL,
    [department_ids]       FLOAT (53)     NULL,
    [active]               BIT            NULL,
    [_ingestion_timestamp] DATETIME2 (6)  NULL,
    [_pipeline_run_id]     VARCHAR (8000) NULL,
    [_source_name]         VARCHAR (8000) NULL
);


GO


CREATE TABLE [bronze].[freshservice_requesters] (
    [requesters.active]                                          BIT            NULL,
    [requesters.address]                                         VARCHAR (8000) NULL,
    [requesters.background_information]                          VARCHAR (8000) NULL,
    [requesters.can_see_all_changes_from_associated_departments] BIT            NULL,
    [requesters.can_see_all_tickets_from_associated_departments] BIT            NULL,
    [requesters.created_at]                                      VARCHAR (8000) NULL,
    [requesters.custom_fields.employeeid]                        BIGINT         NULL,
    [requesters.department_ids]                                  BIGINT         NULL,
    [requesters.department_names]                                VARCHAR (8000) NULL,
    [requesters.external_id]                                     VARCHAR (8000) NULL,
    [requesters.first_name]                                      VARCHAR (8000) NULL,
    [requesters.has_logged_in]                                   BIT            NULL,
    [requesters.id]                                              BIGINT         NULL,
    [requesters.is_agent]                                        BIT            NULL,
    [requesters.job_title]                                       VARCHAR (8000) NULL,
    [requesters.language]                                        VARCHAR (8000) NULL,
    [requesters.last_name]                                       VARCHAR (8000) NULL,
    [requesters.location_id]                                     BIGINT         NULL,
    [requesters.location_name]                                   VARCHAR (8000) NULL,
    [requesters.mobile_phone_number]                             VARCHAR (8000) NULL,
    [requesters.primary_email]                                   VARCHAR (8000) NULL,
    [requesters.reporting_manager_id]                            BIGINT         NULL,
    [requesters.secondary_emails]                                VARCHAR (8000) NULL,
    [requesters.time_format]                                     VARCHAR (8000) NULL,
    [requesters.time_zone]                                       VARCHAR (8000) NULL,
    [requesters.updated_at]                                      VARCHAR (8000) NULL,
    [requesters.vip_user]                                        BIT            NULL,
    [requesters.work_phone_number]                               VARCHAR (8000) NULL,
    [_ingestion_timestamp]                                       VARCHAR (8000) NULL,
    [_pipeline_run_id]                                           VARCHAR (8000) NULL,
    [_source_name]                                               VARCHAR (8000) NULL
);


GO


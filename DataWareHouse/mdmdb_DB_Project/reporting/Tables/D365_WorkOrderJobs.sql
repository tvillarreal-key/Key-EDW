CREATE TABLE [reporting].[D365_WorkOrderJobs] (
    [workorder_id]                      NVARCHAR (50)  NOT NULL,
    [line_number]                       INT            NOT NULL,
    [address_latitude]                  FLOAT (53)     NULL,
    [address_longitude]                 FLOAT (53)     NULL,
    [forecast_hour_qty]                 FLOAT (53)     NULL,
    [job_schedule_link_type]            NVARCHAR (MAX) NULL,
    [job_trade_id]                      NVARCHAR (MAX) NULL,
    [job_type_id]                       NVARCHAR (MAX) NULL,
    [job_variant_id]                    NVARCHAR (MAX) NULL,
    [ma_functional_location_id]         NVARCHAR (MAX) NULL,
    [asset_num]                         NVARCHAR (MAX) NULL,
    [rma_functional_location_id]        NVARCHAR (MAX) NULL,
    [rma_id]                            NVARCHAR (MAX) NULL,
    [scheduled_end_datetime]            DATETIME       NULL,
    [scheduled_start_datetime]          DATETIME       NULL,
    [scheduled_worker_personnel_number] NVARCHAR (MAX) NULL,
    [schedule_work_order_job]           NVARCHAR (MAX) NULL,
    [wo_job_description]                NVARCHAR (MAX) NULL,
    [wo_job_internal_note]              NVARCHAR (MAX) NULL,
    [wo_job_maintenance_worker_remarks] NVARCHAR (MAX) NULL,
    [upload_date]                       DATETIME       NULL
);
GO


CREATE TABLE [reporting].[D365_WorkOrders] (
    [workorder_id]                                  NVARCHAR (50)  NOT NULL,
    [active]                                        NVARCHAR (MAX) NULL,
    [actual_end]                                    DATETIME       NULL,
    [actual_start]                                  DATETIME       NULL,
    [cost_type]                                     NVARCHAR (MAX) NULL,
    [description]                                   NVARCHAR (MAX) NULL,
    [expected_end]                                  DATETIME       NULL,
    [expected_start]                                DATETIME       NULL,
    [is_workorder_scheduled_for_single_worker]      NVARCHAR (MAX) NULL,
    [next_workorder_lifecycle_stateid]              NVARCHAR (MAX) NULL,
    [order_billing_customer_account_number]         NVARCHAR (MAX) NULL,
    [order_project_contract_id]                     NVARCHAR (MAX) NULL,
    [parent_workorder_id]                           NVARCHAR (MAX) NULL,
    [responsible_worker_personnel_number]           NVARCHAR (MAX) NULL,
    [scheduled_end]                                 DATETIME       NULL,
    [scheduled_start]                               DATETIME       NULL,
    [scheduled_worker_personnel_number]             NVARCHAR (MAX) NULL,
    [service_level]                                 INT            NULL,
    [worker_group_id]                               NVARCHAR (MAX) NULL,
    [workorder_lifecycle_state_id]                  NVARCHAR (MAX) NULL,
    [workorder_maintenance_asset_criticality_name]  NVARCHAR (MAX) NULL,
    [workorder_maintenance_asset_criticality_value] NVARCHAR (MAX) NULL,
    [workorder_type_id]                             NVARCHAR (MAX) NULL,
    [upload_date]                                   DATETIME       NULL
);
GO


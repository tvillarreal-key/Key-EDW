CREATE TABLE [dbo].[LaborIncremental] (
    [SOURCE_FILE]       NVARCHAR (255)   NULL,
    [RUN_DATE]          DATETIME2 (7)    DEFAULT (getdate()) NULL,
    [CHANGED_DATE]      DATETIME2 (7)    NULL,
    [CREATED_BY]        NVARCHAR (50)    NULL,
    [BILLING_FLAG]      NVARCHAR (1)     NULL,
    [ASSET_NUMBER]      NVARCHAR (50)    NULL,
    [CUSTOMER_ID]       NVARCHAR (50)    NULL,
    [JOB_CODE]          NVARCHAR (50)    NULL,
    [WORK_DATE]         DATETIME2 (7)    NULL,
    [WORK_STATE]        NVARCHAR (50)    NULL,
    [WORK_TYPE]         NVARCHAR (50)    NULL,
    [WORK_TYPE_CODE]    NVARCHAR (50)    NULL,
    [STATUS_CODE]       NVARCHAR (50)    NULL,
    [EMPLOYEE_ID]       INT              NULL,
    [DURATION]          DECIMAL (18, 10) NULL,
    [CUSTOMER_ORDER_ID] NVARCHAR (50)    NULL,
    [PAY_RATE]          DECIMAL (18, 10) NULL,
    [ROW_ID]            NVARCHAR (20)    NULL
);
GO


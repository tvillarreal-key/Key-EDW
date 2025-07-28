CREATE TABLE [dbo].[KeyView_Job_BAK] (
    [Job_ID]                  NUMERIC (18)    NOT NULL,
    [Job_Type_ID]             NUMERIC (18)    NULL,
    [Start_Time]              DATETIME        NOT NULL,
    [End_Time]                DATETIME        NULL,
    [Perf_Depth]              NUMERIC (18)    NULL,
    [Well_Type_ID]            NUMERIC (18)    NULL,
    [TAC_PREUNSET_TENSION]    NUMERIC (18)    NULL,
    [TAC_SET_TENSION]         NUMERIC (18)    NULL,
    [DELAY_ESTIMATE]          NUMERIC (18)    NULL,
    [CUSTOMER_JOB_ID]         NVARCHAR (20)   NULL,
    [JOB_CLASS_ID]            NUMERIC (18)    NULL,
    [WELLBORE_CONFIG_ID]      NUMERIC (18)    NULL,
    [WSR_SUBMITTED_DATE]      DATETIME        NULL,
    [REGION_SET_ID]           NUMERIC (18)    NULL,
    [ASSET_ID]                NUMERIC (18)    NULL,
    [ASSIGNMENT_ID]           NUMERIC (18)    NULL,
    [OU_ID]                   NUMERIC (18)    NULL,
    [CUSTOMER_OU_ID]          NUMERIC (18)    NULL,
    [GPS_TIME]                DATETIME        NULL,
    [LATITUDE]                NUMERIC (18, 6) NULL,
    [LONGITUDE]               NUMERIC (18, 6) NULL,
    [WELL_ID]                 NUMERIC (18)    NULL,
    [SYSTEM_ASSIGNED_WELL_ID] NUMERIC (18)    NULL,
    [WELL_CONFIRMED]          BIT             NULL,
    [LAST_UPDATE]             DATETIME        NULL,
    [TASK_ID]                 NUMERIC (18)    NULL,
    [JT_DESCRIPTION]          NVARCHAR (100)  NULL,
    [JT_WORK_TYPE]            NVARCHAR (100)  NULL,
    [MJ_DESCRIPTION]          NVARCHAR (100)  NULL,
    [MJ_WORK_TYPE]            NVARCHAR (100)  NULL,
    [WELL_API_NUMBER]         NVARCHAR (50)   NULL,
    [WELL_SERIAL_NUMBER]      NVARCHAR (100)  NULL,
    [WELL_DISTRICT]           NVARCHAR (100)  NULL,
    [WELL_FIELD]              NVARCHAR (100)  NULL,
    [WELLBORE_DESCRIPTION]    NVARCHAR (100)  NULL,
    [OU_DISPLAY_NAME]         NVARCHAR (100)  NULL,
    [OU_YARD_ID]              NUMERIC (18)    NULL,
    [KV_ORG_UNIT]             NVARCHAR (100)  NULL,
    [CU_ORG_UNIT]             NVARCHAR (100)  NULL,
    [LOADED_EXECID]           NVARCHAR (100)  NULL
);
GO

CREATE NONCLUSTERED INDEX [idx_KeyView_Job_Job_ID_BAK]
    ON [dbo].[KeyView_Job_BAK]([Job_ID] ASC);
GO

CREATE NONCLUSTERED INDEX [IX_DBO_KeyView_Job_BAK]
    ON [dbo].[KeyView_Job_BAK]([CUSTOMER_JOB_ID] ASC)
    INCLUDE([Job_ID], [Start_Time], [End_Time], [ASSET_ID], [CU_ORG_UNIT]);
GO


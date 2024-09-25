CREATE TABLE [dbo].[KeyView_Activities2] (
    [Well_API_Num]                VARCHAR (50)    NULL,
    [Well_Name]                   VARCHAR (128)   NULL,
    [Well_Field]                  VARCHAR (50)    NULL,
    [Rig]                         VARCHAR (50)    NULL,
    [JobNumber]                   VARCHAR (50)    NULL,
    [MasterWorkType]              VARCHAR (50)    NULL,
    [MasterJobType]               VARCHAR (50)    NULL,
    [WorkType]                    VARCHAR (50)    NULL,
    [JobType]                     VARCHAR (50)    NULL,
    [JobStartTime]                DATETIME        NULL,
    [JobEndTime]                  DATETIME        NULL,
    [Activity_ID]                 NVARCHAR (50)   NULL,
    [Activity_Number]             NUMERIC (18)    NULL,
    [ActivityDescription]         VARCHAR (MAX)   NULL,
    [ActivityStartTime]           DATETIME        NULL,
    [ActivityEndTime]             DATETIME        NULL,
    [DurationMinutes]             NUMERIC (18, 6) NULL,
    [LastUpdate]                  DATETIME        NULL,
    [SummaryActivityNumber]       NUMERIC (18)    NULL,
    [SummaryText]                 NVARCHAR (256)  NULL,
    [WorkingDepth]                INT             NULL,
    [WellboreConfig]              VARCHAR (50)    NULL,
    [Yard]                        VARCHAR (50)    NULL,
    [Activity_Category_ID]        VARCHAR (20)    NULL,
    [Activity_CategoryDesc]       VARCHAR (50)    NULL,
    [Activity_Class_ID]           VARCHAR (20)    NULL,
    [Activity_Type_ID]            VARCHAR (20)    NULL,
    [Activity_Description]        VARCHAR (MAX)   NULL,
    [Activity_Engine_Usage_Group] VARCHAR (20)    NULL,
    [Activity_Group_ID]           NVARCHAR (50)   NULL,
    [JobClass]                    VARCHAR (20)    NULL,
    [KeyViewOrgUnit]              VARCHAR (128)   NULL,
    [CustomerOrgUnit]             VARCHAR (128)   NULL,
    [Exception_DurationMinutes]   NUMERIC (18, 6) NULL
);
GO

CREATE NONCLUSTERED INDEX [IDX_NC_KeyViewActivities2_JobNumber]
    ON [dbo].[KeyView_Activities2]([JobNumber] ASC)
    INCLUDE([Well_Name], [Rig], [ActivityStartTime], [ActivityEndTime], [Activity_Description], [CustomerOrgUnit]);
GO

CREATE NONCLUSTERED INDEX [nci_msft_1_KeyView_Activities2_D0D905514BDC9780B7237AC884C32264]
    ON [dbo].[KeyView_Activities2]([CustomerOrgUnit] ASC)
    INCLUDE([Activity_ID], [ActivityDescription], [ActivityEndTime], [ActivityStartTime], [DurationMinutes], [Exception_DurationMinutes], [JobEndTime], [JobNumber], [JobStartTime], [JobType], [MasterJobType], [MasterWorkType], [Rig], [Well_Name], [WellboreConfig], [WorkingDepth], [WorkType], [Yard]);
GO

CREATE NONCLUSTERED INDEX [<Name of Missing Index, sysname,>]
    ON [dbo].[KeyView_Activities2]([ActivityStartTime] ASC)
    INCLUDE([Rig]);
GO


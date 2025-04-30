SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
DROP TABLE IF EXISTS [dbo].[KeyView_Activities2]
GO 
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
SET ANSI_PADDING ON
GO
-- Added indexes tvillarreal 10.03.2024 
CREATE INDEX IDX_KeyView_Activities2_JobEndTime_1
ON KeyView_Activities2 (JobEndTime)
INCLUDE (JobNumber, ActivityStartTime, Activity_Description, CustomerOrgUnit);

CREATE INDEX IDX_KeyView_Activities2_JobEndTime_2
ON KeyView_Activities2 (JobEndTime)
INCLUDE (JobNumber, ActivityDescription, ActivityStartTime, CustomerOrgUnit);

CREATE INDEX IDX_KeyView_Activities2_JobEndTime_3
ON KeyView_Activities2 (JobEndTime)
INCLUDE (JobNumber, JobStartTime, ActivityStartTime, Activity_Description, CustomerOrgUnit);

CREATE INDEX IDX_KeyView_Activities2_JobEndTime_4
ON KeyView_Activities2 (JobEndTime)
INCLUDE (Rig, JobNumber, Activity_Number, ActivityEndTime, CustomerOrgUnit);

CREATE INDEX IDX_KeyView_Activities2_JobEndTime_5
ON KeyView_Activities2 (JobEndTime)
INCLUDE (Rig, Yard, CustomerOrgUnit);

CREATE INDEX IDX_KeyView_Activities2_JobNumber_1
ON KeyView_Activities2 (JobNumber)
INCLUDE (JobEndTime, ActivityStartTime, Rig, DurationMinutes, Activity_Description, CustomerOrgUnit);

CREATE INDEX IDX_KeyView_Activities2_JobNumber_2
ON KeyView_Activities2 (JobNumber)
INCLUDE (Well_API_Num, Well_Name, Rig, ActivityStartTime, ActivityEndTime, Activity_Description, CustomerOrgUnit);

CREATE INDEX IDX_KeyView_Activities2_ActivityEndTime_1
ON KeyView_Activities2 (ActivityEndTime)
INCLUDE (Rig, Activity_Number, CustomerOrgUnit);

CREATE INDEX IDX_KeyView_Activities2_ActivityEndTime_2
ON KeyView_Activities2 (ActivityEndTime)
INCLUDE (Rig, Activity_Number, DurationMinutes, CustomerOrgUnit);

GO
CREATE NONCLUSTERED INDEX [KeyView_Activities2_Activity_Number]
    ON [dbo].[KeyView_Activities2]([Activity_Number] ASC)
    INCLUDE([Rig], [JobNumber], [ActivityDescription], [ActivityStartTime], [ActivityEndTime], [CustomerOrgUnit], [JobEndTime]);
GO


CREATE NONCLUSTERED INDEX [KeyView_Activities2_ActivityDates]
    ON [dbo].[KeyView_Activities2]([ActivityStartTime] ASC, [ActivityEndTime] ASC)
    INCLUDE([Rig], [Activity_Number]);
GO


CREATE NONCLUSTERED INDEX [KeyView_Activities2_ActivityEndTime]
    ON [dbo].[KeyView_Activities2]([ActivityEndTime] ASC)
    INCLUDE([Rig], [JobNumber], [CustomerOrgUnit], [Activity_Number], [DurationMinutes]);
GO


CREATE NONCLUSTERED INDEX [KeyView_Activities2_CustomerOrgUnit]
    ON [dbo].[KeyView_Activities2]([CustomerOrgUnit] ASC);
GO


CREATE NONCLUSTERED INDEX [KeyView_Activities2_JobEndTime]
    ON [dbo].[KeyView_Activities2]([JobEndTime] ASC)
    INCLUDE([Rig], [JobNumber], [Activity_Number], [ActivityEndTime], [CustomerOrgUnit], [ActivityStartTime], [Activity_Description]);
GO


CREATE NONCLUSTERED INDEX [KeyView_Activities2_JobNumber]
    ON [dbo].[KeyView_Activities2]([JobNumber] ASC)
    INCLUDE([Well_API_Num], [Well_Name], [Well_Field], [Rig], [MasterWorkType], [MasterJobType], [WorkType], [JobType], [JobStartTime], [JobEndTime], [Activity_ID], [Activity_Number], [ActivityDescription], [ActivityStartTime], [ActivityEndTime], [DurationMinutes], [LastUpdate], [SummaryActivityNumber], [SummaryText], [WorkingDepth], [WellboreConfig], [Yard], [Activity_Category_ID], [Activity_CategoryDesc], [Activity_Class_ID], [Activity_Type_ID], [Activity_Description], [Activity_Engine_Usage_Group], [Activity_Group_ID], [JobClass], [KeyViewOrgUnit], [CustomerOrgUnit], [Exception_DurationMinutes]);
GO


CREATE NONCLUSTERED INDEX [KeyView_Activities2_Rig]
    ON [dbo].[KeyView_Activities2]([Rig] ASC)
    INCLUDE([Well_Name], [JobNumber], [JobStartTime]);
GO


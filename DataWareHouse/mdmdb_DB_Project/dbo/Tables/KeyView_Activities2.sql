SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
DROP TABLE IF EXISTS [dbo].[KeyView_Activities2]
GO 
CREATE TABLE [dbo].[KeyView_Activities2](
	[Well_API_Num] [varchar](50) NULL,
	[Well_Name] [varchar](128) NULL,
	[Well_Field] [varchar](50) NULL,
	[Rig] [varchar](50) NULL,
	[JobNumber] [varchar](50) NULL,
	[MasterWorkType] [varchar](50) NULL,
	[MasterJobType] [varchar](50) NULL,
	[WorkType] [varchar](50) NULL,
	[JobType] [varchar](50) NULL,
	[JobStartTime] [datetime] NULL,
	[JobEndTime] [datetime] NULL,
	[Activity_ID] [nvarchar](50) NULL,
	[Activity_Number] [numeric](18, 0) NULL,
	[ActivityDescription] [varchar](max) NULL,
	[ActivityStartTime] [datetime] NULL,
	[ActivityEndTime] [datetime] NULL,
	[DurationMinutes] [numeric](18, 6) NULL,
	[LastUpdate] [datetime] NULL,
	[SummaryActivityNumber] [numeric](18, 0) NULL,
	[SummaryText] [nvarchar](256) NULL,
	[WorkingDepth] [int] NULL,
	[WellboreConfig] [varchar](50) NULL,
	[Yard] [varchar](50) NULL,
	[Activity_Category_ID] [varchar](20) NULL,
	[Activity_CategoryDesc] [varchar](50) NULL,
	[Activity_Class_ID] [varchar](20) NULL,
	[Activity_Type_ID] [varchar](20) NULL,
	[Activity_Description] [varchar](max) NULL,
	[Activity_Engine_Usage_Group] [varchar](20) NULL,
	[Activity_Group_ID] [nvarchar](50) NULL,
	[JobClass] [varchar](20) NULL,
	[KeyViewOrgUnit] [varchar](128) NULL,
	[CustomerOrgUnit] [varchar](128) NULL,
	[Exception_DurationMinutes] [numeric](18, 6) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IDX_NC_KeyView_Activities2_Activity_Number] ON [dbo].[KeyView_Activities2]
(
	[Activity_Number] ASC,
	[JobEndTime] ASC
)
INCLUDE([Well_Name],[Rig],[JobNumber],[WorkType],[JobType],[JobStartTime],[ActivityDescription],[ActivityStartTime],[ActivityEndTime],[DurationMinutes],[WorkingDepth],[WellboreConfig],[Activity_Description],[CustomerOrgUnit]) WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IDX_NC_KeyView_Activities2_JobEndTime] ON [dbo].[KeyView_Activities2]
(
	[JobEndTime] ASC
)
INCLUDE([Rig],[JobNumber],[Activity_Number],[CustomerOrgUnit]) WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
CREATE NONCLUSTERED INDEX [IDX_NC_KeyViewActivities2_JobNumber] ON [dbo].[KeyView_Activities2]
(
	[JobNumber] ASC
)
INCLUDE([Well_Name],[Rig],[ActivityStartTime],[ActivityEndTime],[Activity_Description],[CustomerOrgUnit]) WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
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

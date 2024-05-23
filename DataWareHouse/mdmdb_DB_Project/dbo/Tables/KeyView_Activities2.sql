SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--DROP TABLE IF EXISTS [dbo].[KeyView_Activities2] 
GO
--CREATE TABLE [dbo].[KeyView_Activities2](
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
SET ANSI_PADDING ON
GO
CREATE NONCLUSTERED INDEX [nci_msft_1_KeyView_Activities2_D0D905514BDC9780B7237AC884C32264] ON [dbo].[KeyView_Activities2]
(
	[CustomerOrgUnit] ASC
)
INCLUDE([Activity_ID],[ActivityDescription],[ActivityEndTime],[ActivityStartTime],[DurationMinutes],[Exception_DurationMinutes],[JobEndTime],[JobNumber],[JobStartTime],[JobType],[MasterJobType],[MasterWorkType],[Rig],[Well_Name],[WellboreConfig],[WorkingDepth],[WorkType],[Yard]) WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO

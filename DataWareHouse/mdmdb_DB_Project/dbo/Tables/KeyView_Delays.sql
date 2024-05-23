SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--DROP TABLE IF EXISTS [dbo].[KeyView_Delays] 
--Empty in MDMQA, not loaded in MDMDB
GO
CREATE TABLE [dbo].[KeyView_Delays](
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
	[Activity] [varchar](max) NULL,
	[DelayStartTime] [datetime] NULL,
	[DelayEndTime] [datetime] NULL,
	[WaitCategory] [varchar](50) NULL,
	[ResponsibleEquipService] [varchar](max) NULL,
	[Vendor] [varchar](max) NULL,
	[WaitReason] [varchar](max) NULL,
	[RootCause] [varchar](max) NULL,
	[DurationMinutes] [int] NULL,
	[BillableNPT] [int] NULL,
	[NonBillableNPT] [int] NULL,
	[Comments] [varchar](max) NULL,
	[WorkingDepth] [int] NULL,
	[WellboreConfig] [varchar](50) NULL,
	[KeyViewOrgUnit] [varchar](128) NULL,
	[CustomerOrgUnit] [varchar](128) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

--DROP TABLE IF EXISTS [dbo].[KeyView_Job_Activity_Exception] 
--Loaded in MDMQA, missing in MDMDB
CREATE TABLE [dbo].[KeyView_Job_Activity_Exception](
	[JOB_ID] [numeric](18, 0) NULL,
	[ACTIVITY_NUMBER] [numeric](18, 0) NULL,
	[START_TIME] [datetime] NULL,
	[EXCEPTION_TYPE_ID] [int] NULL,
	[EXCEPTION_TYPE] [varchar](50) NULL,
	[END_TIME] [datetime] NULL,
	[DURATION] [numeric](18, 6) NULL,
	[UPDATED] [varchar](1) NULL,
	[EXCEPTION_NUMBER] [numeric](18, 0) NULL,
	[COMPLETE] [varchar](1) NULL,
	[NOTE_ID] [numeric](18, 0) NULL,
	[AUTOCLASSIFIED] [varchar](1) NULL,
	[LAST_UPDATE] [datetime] NULL,
	[BILLABLE] [varchar](1) NULL,
	[NOTE_TEXT] [nvarchar](max) NULL,
	[VARIANCE_ID_01] [int] NULL,
	[VARIANCE_ID_02] [int] NULL,
	[VARIANCE_ID_03] [int] NULL,
	[VARIANCE_ID_04] [int] NULL,
	[VARIANCE_ID_05] [int] NULL,
	[VARIANCE_DESC_01] [varchar](100) NULL,
	[VARIANCE_DESC_02] [varchar](100) NULL,
	[VARIANCE_DESC_03] [varchar](100) NULL,
	[VARIANCE_DESC_04] [varchar](100) NULL,
	[VARIANCE_DESC_05] [varchar](100) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

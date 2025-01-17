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

CREATE INDEX IDX_KeyView_Job_Activity_Exception_EXCEPTION_TYPE
ON KeyView_Job_Activity_Exception (EXCEPTION_TYPE);

CREATE INDEX IDX_KeyView_Job_Activity_Exception_END_TIME
ON KeyView_Job_Activity_Exception (END_TIME)
INCLUDE (ACTIVITY_NUMBER, START_TIME, EXCEPTION_TYPE, EXCEPTION_NUMBER, VARIANCE_DESC_01, VARIANCE_DESC_04);

CREATE INDEX IDX_KeyView_Job_Activity_Exception_EXCEPTION_TYPE_VARIANCE_DESC_01
ON KeyView_Job_Activity_Exception (EXCEPTION_TYPE)
INCLUDE (VARIANCE_DESC_01);

CREATE INDEX IDX_KeyView_Job_Activity_Exception_EXCEPTION_TYPE_VARIANCE_DESC_01_03_04_05
ON KeyView_Job_Activity_Exception (EXCEPTION_TYPE)
INCLUDE (VARIANCE_DESC_01, VARIANCE_DESC_03, VARIANCE_DESC_04, VARIANCE_DESC_05);

CREATE INDEX IDX_KeyView_Job_Activity_Exception_EXCEPTION_TYPE_VARIANCE_DESC_01_02_03_04_05
ON KeyView_Job_Activity_Exception (EXCEPTION_TYPE, VARIANCE_DESC_01)
INCLUDE (VARIANCE_DESC_02, VARIANCE_DESC_03, VARIANCE_DESC_04, VARIANCE_DESC_05);

CREATE INDEX idx_job_activity_exception
ON DBO.KEYVIEW_JOB_ACTIVITY_EXCEPTION (EXCEPTION_TYPE, END_TIME)
INCLUDE (JOB_ID, ACTIVITY_NUMBER, VARIANCE_DESC_01, VARIANCE_DESC_04, VARIANCE_DESC_05, DURATION);

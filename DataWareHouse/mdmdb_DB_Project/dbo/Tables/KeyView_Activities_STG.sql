CREATE TABLE [dbo].[KeyView_Activities_STG] (
    [JOB_ID]                  NUMERIC (18)  NOT NULL,
    [ACTIVITY_ID]             NUMERIC (18)  NOT NULL,
    [ACTIVITY_NUMBER]         NUMERIC (18)  NOT NULL,
    [START_TIME]              DATETIME      NOT NULL,
    [END_TIME]                DATETIME      NULL,
    [SUMMARY_ACTIVITY_NUMBER] NUMERIC (18)  NULL,
    [SUMMARY_TEXT]            VARCHAR (256) NULL,
    [ACTIVITY_DESCRIPTION]    VARCHAR (100) NULL
);
GO

CREATE NONCLUSTERED INDEX [Index_KeyView_Activities_STG_1]
    ON [dbo].[KeyView_Activities_STG]([JOB_ID] ASC);
GO


CREATE TABLE [dbo].[KVP_JOB_ACTIVITY] (
    [JOB_ID]                  NUMERIC (18)  NOT NULL,
    [ACTIVITY_ID]             NUMERIC (18)  NOT NULL,
    [ACTIVITY_NUMBER]         NUMERIC (18)  NOT NULL,
    [START_TIME]              DATETIME      NOT NULL,
    [END_TIME]                DATETIME      NULL,
    [UPDATED]                 VARCHAR (10)  NULL,
    [LAST_UPDATE]             DATETIME      NOT NULL,
    [SUMMARY_ACTIVITY_NUMBER] NUMERIC (18)  NULL,
    [SUMMARY_TEXT]            VARCHAR (256) NULL,
    [B_TRANSACTION]           VARCHAR (100) NULL,
    [extracted]               DATETIME2 (7) NULL,
    [transmitted]             DATETIME2 (7) NULL
);
GO

ALTER TABLE [dbo].[KVP_JOB_ACTIVITY]
    ADD CONSTRAINT [PK_KVP_JOB_ACTIVITY] PRIMARY KEY CLUSTERED ([JOB_ID] ASC, [ACTIVITY_NUMBER] ASC);
GO


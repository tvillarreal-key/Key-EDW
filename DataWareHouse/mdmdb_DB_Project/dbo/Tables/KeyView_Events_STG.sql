CREATE TABLE [dbo].[KeyView_Events_STG] (
    [JOB_ID]            NUMERIC (18)  NOT NULL,
    [EVENT_ID]          NUMERIC (18)  NULL,
    [EVENT_NUMBER]      NUMERIC (18)  NOT NULL,
    [START_TIME]        DATETIME      NULL,
    [END_TIME]          DATETIME      NULL,
    [SEVERITY]          NUMERIC (18)  NULL,
    [RDC_COMMENT]       VARCHAR (256) NULL,
    [EVENT_DESCRIPTION] VARCHAR (100) NULL,
    [ALARM]             VARCHAR (5)   NULL,
    [SERVICE_LEVEL]     NUMERIC (18)  NULL,
    [DISPLAY_LEVEL]     NUMERIC (18)  NULL
);
GO

CREATE NONCLUSTERED INDEX [Index_KeyView_Events_STG_1]
    ON [dbo].[KeyView_Events_STG]([JOB_ID] ASC);
GO


CREATE TABLE [dbo].[D365_WorkOrderJobs_History] (
    [WORKORDERID]                    NVARCHAR (50)  NOT NULL,
    [LINENUMBER]                     INT            NOT NULL,
    [ADDRESSLATITUDE]                FLOAT (53)     NULL,
    [ADDRESSLONGITUDE]               FLOAT (53)     NULL,
    [FORECASTHOURQTY]                FLOAT (53)     NULL,
    [JOBSCHEDULELINKTYPE]            TEXT           NULL,
    [JOBTRADEID]                     TEXT           NULL,
    [JOBTYPEID]                      TEXT           NULL,
    [JOBVARIANTID]                   TEXT           NULL,
    [MA_FUNCTIONALLOCATIONID]        TEXT           NULL,
    [MA_ID]                          TEXT           NULL,
    [RMA_FUNCTIONALLOCATIONID]       TEXT           NULL,
    [RMA_ID]                         TEXT           NULL,
    [SCHEDULEDENDDATETIME]           DATETIME       NULL,
    [SCHEDULEDSTARTDATETIME]         DATETIME       NULL,
    [SCHEDULEDWORKERPERSONNELNUMBER] TEXT           NULL,
    [SCHEDULEWORKORDERJOB]           TEXT           NULL,
    [WO_JOBDESCRIPTION]              NVARCHAR (MAX) NULL,
    [WO_JOBINTERNALNOTE]             TEXT           NULL,
    [WO_JOBMAINTENANCEWORKERREMARKS] TEXT           NULL
);
GO

ALTER TABLE [dbo].[D365_WorkOrderJobs_History]
    ADD CONSTRAINT [PK_D365_WorkOrderJobs_History] PRIMARY KEY CLUSTERED ([WORKORDERID] ASC, [LINENUMBER] ASC);
GO


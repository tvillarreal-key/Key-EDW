CREATE TABLE [dbo].[D365_WorkOrders] (
    [WORKORDERID]                               NVARCHAR (50)  NOT NULL,
    [ACTIVE]                                    TEXT           NULL,
    [ACTUALEND]                                 DATETIME       NULL,
    [ACTUALSTART]                               DATETIME       NULL,
    [COSTTYPE]                                  TEXT           NULL,
    [DESCRIPTION]                               NVARCHAR (MAX) NULL,
    [EXPECTEDEND]                               DATETIME       NULL,
    [EXPECTEDSTART]                             DATETIME       NULL,
    [ISWORKORDERSCHEDULEDFORSINGLEWORKER]       TEXT           NULL,
    [NEXTWORKORDERLIFECYCLESTATEID]             TEXT           NULL,
    [ORDERBILLINGCUSTOMERACCOUNTNUMBER]         TEXT           NULL,
    [ORDERPROJECTCONTRACTID]                    TEXT           NULL,
    [PARENTWORKORDERID]                         TEXT           NULL,
    [RESPONSIBLEWORKERPERSONNELNUMBER]          TEXT           NULL,
    [SCHEDULEDEND]                              DATETIME       NULL,
    [SCHEDULEDSTART]                            DATETIME       NULL,
    [SCHEDULEDWORKERPERSONNELNUMBER]            TEXT           NULL,
    [SERVICELEVEL]                              TEXT           NULL,
    [WORKERGROUPID]                             TEXT           NULL,
    [WORKORDERLIFECYCLESTATEID]                 TEXT           NULL,
    [WORKORDERMAINTENANCEASSETCRITICALITYNAME]  TEXT           NULL,
    [WORKORDERMAINTENANCEASSETCRITICALITYVALUE] TEXT           NULL,
    [WORKORDERTYPEID]                           TEXT           NULL,
    [ExecutionRunId]                            NVARCHAR (100) NULL,
    CONSTRAINT [PK_D365_WorkOrders] PRIMARY KEY CLUSTERED ([WORKORDERID] ASC)
);
GO

ALTER TABLE [dbo].[D365_WorkOrders]
    ADD CONSTRAINT [PK_D365_WorkOrders] PRIMARY KEY CLUSTERED ([WORKORDERID] ASC);
GO


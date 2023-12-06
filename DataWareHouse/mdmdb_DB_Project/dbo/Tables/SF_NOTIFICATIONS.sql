CREATE TABLE [dbo].[SF_NOTIFICATIONS] (
    [NotificationID] NVARCHAR (64)  NOT NULL,
    [OrganizationId] NVARCHAR (256) NULL,
    [ActionId]       NVARCHAR (256) NULL,
    [SessionId]      NVARCHAR (256) NULL,
    [EnterpriseUrl]  NVARCHAR (256) NULL,
    [PartnerUrl]     NVARCHAR (256) NULL,
    [Type]           NVARCHAR (64)  NULL,
    [ID]             NVARCHAR (64)  NULL,
    [P1]             NVARCHAR (64)  NULL,
    [P2]             NVARCHAR (64)  NULL,
    [P3]             NVARCHAR (64)  NULL,
    [P4]             NVARCHAR (64)  NULL,
    [P5]             NVARCHAR (64)  NULL,
    [P6]             NVARCHAR (64)  NULL,
    [POSTED]         DATETIME2 (7)  NULL
);
GO

CREATE NONCLUSTERED INDEX [SF_NOTIFICATIONS_NDX1]
    ON [dbo].[SF_NOTIFICATIONS]([NotificationID] ASC);
GO


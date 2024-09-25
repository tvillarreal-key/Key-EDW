CREATE TABLE [dbo].[Hess_KPIBonus] (
    [RowId]                  INT            IDENTITY (1, 1) NOT NULL,
    [EIN]                    VARCHAR (9)    NULL,
    [RigAsset]               NVARCHAR (20)  NULL,
    [EHSActual]              NVARCHAR (10)  NULL,
    [EHSPct]                 NVARCHAR (10)  NULL,
    [NPTAcutal]              NVARCHAR (10)  NULL,
    [NPTPct]                 NVARCHAR (10)  NULL,
    [RigAuditFindingsAcutal] NVARCHAR (10)  NULL,
    [RigAuditFindingsPct]    NVARCHAR (10)  NULL,
    [CountDailyInpsections]  NVARCHAR (10)  NULL,
    [Count15MinDailyReview]  NVARCHAR (10)  NULL,
    [RequiredForms]          NVARCHAR (10)  NULL,
    [RequiredFormsPct]       NVARCHAR (10)  NULL,
    [OverallKPIPct]          NVARCHAR (10)  NULL,
    [KPIPotential]           NVARCHAR (20)  NULL,
    [KPIGross]               NVARCHAR (20)  NULL,
    [CTGrossPayout]          NVARCHAR (20)  NULL,
    [TotalGrossPayout]       NVARCHAR (20)  NULL,
    [PerformancePeriod]      NVARCHAR (10)  NULL,
    [PayDate]                NVARCHAR (10)  NULL,
    [FirstName]              NVARCHAR (50)  NULL,
    [LastName]               NVARCHAR (50)  NULL,
    [CompleteName]           NVARCHAR (120) NULL,
    [Email]                  NVARCHAR (128) NULL
);
GO


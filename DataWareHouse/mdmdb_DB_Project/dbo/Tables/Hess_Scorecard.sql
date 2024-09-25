CREATE TABLE [dbo].[Hess_Scorecard] (
    [Month]                  NVARCHAR (50)   NULL,
    [Rig]                    NVARCHAR (20)   NULL,
    [RigType]                NVARCHAR (50)   NULL,
    [EHSEvent]               NVARCHAR (50)   NULL,
    [NPTPercent]             NUMERIC (18, 2) NULL,
    [RigAuditFindings]       NUMERIC (18, 2) NULL,
    [RigAuditFindingsClosed] NVARCHAR (5)    NULL,
    [DailyCompliance]        NUMERIC (18, 2) NULL,
    [DailyPayout]            NUMERIC (18, 2) NULL
);
GO


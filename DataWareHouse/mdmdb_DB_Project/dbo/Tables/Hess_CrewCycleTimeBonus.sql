CREATE TABLE [dbo].[Hess_CrewCycleTimeBonus] (
    [Month]            NVARCHAR (50)   NULL,
    [JobNumber]        NVARCHAR (50)   NULL,
    [WellName]         NVARCHAR (MAX)  NULL,
    [Rig]              NVARCHAR (20)   NULL,
    [JobType]          NVARCHAR (MAX)  NULL,
    [RigType]          NVARCHAR (50)   NULL,
    [EHSEvent]         NVARCHAR (50)   NULL,
    [KeyCycleTime]     NUMERIC (18, 2) NULL,
    [HessCycleTime]    NUMERIC (18, 2) NULL,
    [Delta]            NUMERIC (18, 2) NULL,
    [TargetCycleTime]  NUMERIC (18, 2) NULL,
    [RigCost]          NUMERIC (18, 2) NULL,
    [OpsMgmtFee]       NUMERIC (18, 2) NULL,
    [ValueShareToKey]  NUMERIC (18, 2) NULL,
    [ValueShareToCrew] NUMERIC (18, 2) NULL,
    [Total]            NUMERIC (18, 2) NULL
);
GO


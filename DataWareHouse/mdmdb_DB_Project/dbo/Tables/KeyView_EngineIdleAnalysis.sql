CREATE TABLE [dbo].[KeyView_EngineIdleAnalysis] (
    [Rig]            NVARCHAR (10)   NOT NULL,
    [StartDate]      NVARCHAR (50)   NOT NULL,
    [EndDate]        NVARCHAR (50)   NOT NULL,
    [EngineHours]    NUMERIC (18, 2) NULL,
    [Idle_5]         NUMERIC (18, 2) NULL,
    [Idle_15]        NUMERIC (18, 2) NULL,
    [SavingOppPct]   NUMERIC (18, 2) NULL,
    [KeyViewOrgUnit] NVARCHAR (128)  NULL
);
GO

ALTER TABLE [dbo].[KeyView_EngineIdleAnalysis]
    ADD CONSTRAINT [PK_KeyView_EngineIdleAnalysis] PRIMARY KEY CLUSTERED ([Rig] ASC, [StartDate] ASC, [EndDate] ASC);
GO


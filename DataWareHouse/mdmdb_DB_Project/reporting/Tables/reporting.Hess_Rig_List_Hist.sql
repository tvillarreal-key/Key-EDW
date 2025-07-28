SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
DROP TABLE IF EXISTS [reporting].[Hess_Rig_List_Hist]
GO
CREATE TABLE [reporting].[Hess_Rig_List_Hist] (
    [RIG]        NVARCHAR (10) NOT NULL,
    [RIGTYPE]    NVARCHAR (20) NOT NULL,
    [RIGSUBTYPE] NVARCHAR (20) NOT NULL,
    [OPDATE]     DATE          NOT NULL
);
GO

CREATE INDEX IDX_Hess_Rig_List_Hist_RIG_OPDATE
ON reporting.Hess_Rig_List_Hist (RIG, OPDATE);

CREATE INDEX IDX_Hess_Rig_List_Hist_RIG_OPDATE_RIGTYPE
ON reporting.Hess_Rig_List_Hist (RIG, OPDATE)
INCLUDE (RIGTYPE);

CREATE INDEX IDX_Hess_Rig_List_Hist_RIG
ON reporting.Hess_Rig_List_Hist (RIG);

GO
CREATE NONCLUSTERED INDEX [IDX_Hess_Rig_List_Hist_RIG]
    ON [reporting].[Hess_Rig_List_Hist]([RIG] ASC);
GO


CREATE NONCLUSTERED INDEX [IDX_Hess_Rig_List_Hist_RIG_OPDATE]
    ON [reporting].[Hess_Rig_List_Hist]([RIG] ASC, [OPDATE] ASC);
GO


CREATE NONCLUSTERED INDEX [IDX_Hess_Rig_List_Hist_RIG_OPDATE_RIGTYPE]
    ON [reporting].[Hess_Rig_List_Hist]([RIG] ASC, [OPDATE] ASC)
    INCLUDE([RIGTYPE]);
GO


CREATE NONCLUSTERED INDEX [IX_REPORTING_Hess_Rig_List_Hist]
    ON [reporting].[Hess_Rig_List_Hist]([RIG] ASC)
    INCLUDE([RIGTYPE], [RIGSUBTYPE], [OPDATE]);
GO


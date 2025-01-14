SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
DROP TABLE IF EXISTS [reporting].[Hess_Rig_List_Hist]
GO
CREATE TABLE [reporting].[Hess_Rig_List_Hist](
	[RIG] [nvarchar](10) NOT NULL,
	[RIGTYPE] [nvarchar](20) NOT NULL,
	[RIGSUBTYPE] [nvarchar](20) NOT NULL,
	[OPDATE] [date] NOT NULL
) ON [PRIMARY]
GO

CREATE INDEX IDX_Hess_Rig_List_Hist_RIG_OPDATE
ON reporting.Hess_Rig_List_Hist (RIG, OPDATE);

CREATE INDEX IDX_Hess_Rig_List_Hist_RIG_OPDATE_RIGTYPE
ON reporting.Hess_Rig_List_Hist (RIG, OPDATE)
INCLUDE (RIGTYPE);

CREATE INDEX IDX_Hess_Rig_List_Hist_RIG
ON reporting.Hess_Rig_List_Hist (RIG);

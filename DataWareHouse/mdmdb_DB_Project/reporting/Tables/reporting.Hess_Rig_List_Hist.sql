SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
DROP PROCEDURE IF EXISTS [reporting].[Hess_Rig_List_Hist]
GO
CREATE TABLE [reporting].[Hess_Rig_List_Hist](
	[RIG] [nvarchar](10) NOT NULL,
	[RIGTYPE] [nvarchar](20) NOT NULL,
	[OPDATE] [date] NOT NULL
) ON [PRIMARY]
GO

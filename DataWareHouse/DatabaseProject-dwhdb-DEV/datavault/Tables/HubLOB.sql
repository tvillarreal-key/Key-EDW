SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
DROP TABLE IF EXISTS [datavault].[HubLOB] 
GO
CREATE TABLE [datavault].[HubLOB](
	[LOBHashKey] [nvarchar](32) NOT NULL,
	[LoadDate] [datetime2](7) NOT NULL,
	[SourceSystem] [nvarchar](50) NOT NULL,
	[Yard_Code] [nvarchar](20) NOT NULL,
	[Lvl1_Code] [nvarchar](20) NULL,
	[LOB_Code] [nvarchar](20) NOT NULL,
	[LastSeenDate] [datetime2](7) NOT NULL,
CONSTRAINT [PK_HubLOB] PRIMARY KEY NONCLUSTERED 
(
	[LOBHashKey] ASC
) ON [PRIMARY],
CONSTRAINT [UK_HubLOB] UNIQUE NONCLUSTERED 
(
	[Yard_Code] ASC,
    [Lvl1_Code] ASC,
    [LOB_Code] ASC
) ON [PRIMARY],
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
DROP TABLE IF EXISTS [datavault].[HubLocation2] 
GO
CREATE TABLE [datavault].[HubLocation2](
	[LocaHashKey] [nvarchar](32) NOT NULL,
	[LoadDate] [datetime2](7) NOT NULL,
	[SourceSystem] [nvarchar](50) NOT NULL,
    [Loca_Code] [nvarchar](20) NOT NULL,
	[LastSeenDate] [datetime2](7) NOT NULL,
CONSTRAINT [PK_HubLocation2] PRIMARY KEY NONCLUSTERED 
(
	[LocaHashKey] ASC
) ON [PRIMARY],
CONSTRAINT [UK_HubLocation2] UNIQUE NONCLUSTERED 
(
	[Loca_Code] ASC
) ON [PRIMARY],
) ON [PRIMARY]
GO
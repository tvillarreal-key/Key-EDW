SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
DROP TABLE IF EXISTS [datavault].[HubLocaDept] 
GO
CREATE TABLE [datavault].[HubLocaDept](
	[HubLocaDeptHashKey] [nvarchar](32) NOT NULL,
	[LoadDate] [datetime2](7) NOT NULL,
	[SourceSystem] [nvarchar](50) NOT NULL,
    [Loco_Code] [nvarchar](20) NOT NULL,
	[LastSeenDate] [datetime2](7) NOT NULL,
CONSTRAINT [PK_HubLocaDept] PRIMARY KEY NONCLUSTERED 
(
	[HubLocaDeptHashKey] ASC
) ON [PRIMARY],
CONSTRAINT [UK_HubLocaDept] UNIQUE NONCLUSTERED 
(
	[Loco_Code] ASC
    ,[LoadDate] ASC
    ,[SourceSystem] ASC	
) ON [PRIMARY],
) ON [PRIMARY]
GO
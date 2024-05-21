SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
DROP TABLE IF EXISTS [datavault].[HubLocation] 
GO
CREATE TABLE [datavault].[HubLocation](
	[LocationHashKey] [nvarchar](32) NOT NULL,
	[LoadDate] [datetime2](7) NOT NULL,
	[SourceSystem] [nvarchar](50) NOT NULL,
	[Yard_Code] [nvarchar](20) NOT NULL,
	[Loco_Code] [nvarchar](20) NULL,
	[Loca_Code] [nvarchar](20) NOT NULL,
	[Mktp_Code] [nvarchar](20) NOT NULL,
	[LastSeenDate] [datetime2](7) NOT NULL,
CONSTRAINT [PK_HubLocation] PRIMARY KEY NONCLUSTERED 
(
	[LocationHashKey] ASC
) ON [PRIMARY],
CONSTRAINT [UK_HubLocation] UNIQUE NONCLUSTERED 
(
	[Yard_Code] ASC,
    [Loco_Code] ASC,
    [Loca_Code] ASC,
    [Mktp_Code] ASC
) ON [PRIMARY],
) ON [PRIMARY]
GO
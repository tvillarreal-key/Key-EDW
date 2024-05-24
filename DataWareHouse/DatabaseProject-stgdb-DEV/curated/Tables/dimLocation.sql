SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
DROP TABLE IF EXISTS [curated].[dimLocation] 
GO
CREATE TABLE [curated].[dimLocation](
	[LocationHashKey] [nvarchar](32) NOT NULL,
	[LocationChkSum] [nvarchar](32) NOT NULL,
	[LoadDate] [datetime2](7) NOT NULL,
	[SourceSystem] [nvarchar](50) NOT NULL,
	[LastSeenDate] [datetime2](7) NOT NULL,
	[Yard_Code] [nvarchar](20) NULL,
	[Yard_Name] [nvarchar](100) NULL,
	[Loca_Code] [nvarchar](20) NULL,
	[Loca_Name] [nvarchar](100) NULL,
	[Loco_Code] [nvarchar](20) NULL,
	[Loco_Name] [nvarchar](100) NULL,
	[MKTP_Code] [nvarchar](20) NULL,
	[MKTP_Name] [nvarchar](100) NULL
CONSTRAINT [PK_dimLocation] PRIMARY KEY NONCLUSTERED 
(
	[LocationHashKey] ASC   
) ON [PRIMARY],
) ON [PRIMARY]
GO
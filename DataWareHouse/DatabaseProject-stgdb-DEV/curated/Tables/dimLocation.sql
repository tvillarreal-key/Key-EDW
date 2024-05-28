SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
DROP TABLE [curated].[dimLocation]
GO
CREATE TABLE [curated].[dimLocation](
	[LocationHashKey] [nvarchar](32) NOT NULL,
	[LocationChkSum] [nvarchar](32) NOT NULL,
	[LoadDate] [datetime2](7) NOT NULL,
	[SourceSystem] [nvarchar](50) NOT NULL,
	[LastSeenDate] [datetime2](7) NULL,
	[Yard_Code] [nvarchar](20) NULL,
	[Yard_Name] [nvarchar](100) NULL,
	[Loco_Code] [nvarchar](20) NULL,
	[Loco_Name] [nvarchar](100) NULL,
	[Loca_Code] [nvarchar](20) NULL,
	[Loca_Name] [nvarchar](100) NULL,
	[MKTP_Code] [nvarchar](20) NULL,
	[MKTP_Name] [nvarchar](100) NULL
) ON [PRIMARY]
GO
/* SET ANSI_PADDING ON
GO
ALTER TABLE [curated].[dimLocation] ADD  CONSTRAINT [PK_dimLocation] PRIMARY KEY NONCLUSTERED 
(
	[LocationHashKey] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO */

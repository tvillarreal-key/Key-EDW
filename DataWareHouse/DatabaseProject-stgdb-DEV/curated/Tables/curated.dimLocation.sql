SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
DROP TABLE [curated].[dimLocation]
GO
CREATE TABLE [curated].[dimLocation](
	[LocationHashKey] [nvarchar](32) NOT NULL,
	[LocationChkSum] [nvarchar](32) NOT NULL,
	[Loca_Code] [nvarchar](20) NOT NULL,
	[SourceSystem] [nvarchar](50) NOT NULL,
	[Loca_Name] [nvarchar](100) NOT NULL,
	[LastSeenDate] [datetime2](7) NULL,	
	[LoadDate] [datetime2](7) NOT NULL
) ON [PRIMARY]
GO
 SET ANSI_PADDING ON
GO
ALTER TABLE [curated].[dimLocation] ADD  CONSTRAINT [PK_dimLocation] PRIMARY KEY NONCLUSTERED 
(
	[LocationHashKey] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO 

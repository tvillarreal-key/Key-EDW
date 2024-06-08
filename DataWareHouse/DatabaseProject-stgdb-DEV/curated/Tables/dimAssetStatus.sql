SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
DROP TABLE IF EXISTS [curated].[dimAssetStatus]
GO
CREATE TABLE [curated].[dimAssetStatus](
	[StatusHashKey] [nvarchar](32) NOT NULL,
	[StatusChkSum] [nvarchar](32) NOT NULL,
	[Status_Code] [nvarchar](20) NOT NULL,
	[SourceSystem] [nvarchar](50) NOT NULL,
	[Status_Name] [nvarchar](255) NULL,
	[LoadDate] [datetime2](7) NOT NULL
) ON [PRIMARY]
GO
 SET ANSI_PADDING ON
GO
ALTER TABLE [curated].[dimAssetStatus] ADD  CONSTRAINT [PK_dimAssetStatus] PRIMARY KEY NONCLUSTERED 
(
	[StatusHashKey] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO 

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
DROP TABLE IF EXISTS [curated].[dimAssetClass]
GO
CREATE TABLE [curated].[dimAssetClass](
	[ClassHashKey] [nvarchar](32) NOT NULL,
	[ClassChkSum] [nvarchar](32) NOT NULL,
	[Class_Code] [nvarchar](20) NOT NULL,
	[SourceSystem] [nvarchar](50) NOT NULL,
	[Class_Name] [nvarchar](255) NULL,
	[LoadDate] [datetime2](7) NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
ALTER TABLE [curated].[dimAssetClass] ADD  CONSTRAINT [PK_dimAssetClass2] PRIMARY KEY NONCLUSTERED 
(
	[ClassHashKey] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO

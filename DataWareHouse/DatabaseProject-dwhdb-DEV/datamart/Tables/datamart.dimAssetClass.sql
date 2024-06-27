SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
DROP TABLE IF EXISTS [datamart].[dimAssetClass] 
GO
CREATE TABLE [datamart].[dimAssetClass](
	[ClassHashKey] [nvarchar](32) NOT NULL,
	[Class_Code] [nvarchar](20) NOT NULL,
	[SourceSystem] [nvarchar](50) NOT NULL,
	[Class_Name] [nvarchar](255) NULL,
	[LoadDate] [datetime2](7) NOT NULL              
CONSTRAINT [PK_dimAssetClass] PRIMARY KEY NONCLUSTERED 
(
	[ClassHashKey] ASC
) ON [PRIMARY],
CONSTRAINT [UK_dimAssetClass] UNIQUE NONCLUSTERED 
(
	[Class_Code] ASC,
    [Class_Name] ASC
) ON [PRIMARY],
) ON [PRIMARY]
GO
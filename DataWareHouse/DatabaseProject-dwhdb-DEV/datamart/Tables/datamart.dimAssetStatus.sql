SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
DROP TABLE IF EXISTS [datamart].[dimAssetStatus] 
GO
CREATE TABLE [datamart].[dimAssetStatus](
	[AssetStatusKey] [nvarchar](32) NOT NULL,
	[Status_Code] [nvarchar](20) NULL,
	[Status_Name] [nvarchar](255) NULL,
    [LoadDate] [datetime2](7) NOT NULL,               
CONSTRAINT [PK_dimAssetStatus] PRIMARY KEY NONCLUSTERED 
(
	[AssetStatusKey] ASC
) ON [PRIMARY],
CONSTRAINT [UK_dimAssetStatus] UNIQUE NONCLUSTERED 
(
	[Status_Code] ASC,
    [Status_Name] ASC
) ON [PRIMARY],
) ON [PRIMARY]
GO
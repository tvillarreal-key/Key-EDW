SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
DROP TABLE IF EXISTS [datavault].[SatAssetStatus] 
GO
CREATE TABLE [datavault].[SatAssetStatus](
-- Key Area
    [AssetStatusHashKey] [nvarchar](32) NOT NULL,      -- Parent Hash Key (Associated Hub / Link Hash Key)
    [LoadDate] [datetime2](7) NOT NULL,               -- Required (Satellite Load Date)
    [SourceSystem] [nvarchar](50) NOT NULL,           -- Required (Name of Satellite Source)
-- Change Info Area
    [LoadEndDate] [datetime2](7) NULL,                -- Required (Load Date Of Next Satellite Record)
    [AssetStatusChkSum] [nvarchar](32) NOT NULL,       -- Optional (CheckSum) HashDiff
    [ExtractDate] [datetime2](7) NOT NULL,            -- Optional (Source Load Date)
-- Descriptive Attributes (very slow frequency) 
    [AssetStatus_Code] [nvarchar](20) NOT NULL,
	[AssetStatus_Name] [nvarchar](100) NULL,
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
ALTER TABLE [datavault].[SatAssetStatus] ADD  CONSTRAINT [PK_SatAssetStatus] PRIMARY KEY NONCLUSTERED 
(
	[AssetStatusHashKey] ASC
    ,[LoadDate] ASC
    ,[SourceSystem] ASC

)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO

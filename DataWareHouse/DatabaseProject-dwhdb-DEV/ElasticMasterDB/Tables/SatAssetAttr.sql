--USE ElasticMasterDB;
DROP EXTERNAL TABLE [datavault].[SatAsset] 
GO
CREATE EXTERNAL TABLE [datavault].[SatAssetAttr](
-- Key Area
    [AssetAttrHashKey] [nvarchar](32) NOT NULL, -- Parent Hash Key (Associated Hub / Link Hash Key)
    [LoadDate] [datetime2](7) NOT NULL,         -- Required (Satellite Load Date)
    [SourceSystem] [nvarchar](50) NOT NULL,     -- Required (Name of Satellite Source)
-- Change Info Area
    [LoadEndDate] [datetime2](7) NULL,          -- Required (Load Date Of Next Satellite Record)
    [AssetAttrChkSum] [nvarchar](32) NOT NULL,  -- Optional (CheckSum) HashDiff
    [ExtractDate] [datetime2](7) NOT NULL,      -- Optional (Source Load Date)
-- Descriptive Attributes (very slow frequency)
	[Asset_ID] [int] NOT NULL,
	[Asset_Num] [nvarchar](60) NOT NULL,
	[AttrCode] [nvarchar](50) NOT NULL,
	[AttrValue] [nvarchar](max) NULL
)
WITH
( DATA_SOURCE = ElasticDWHDBQueryDataSrc);
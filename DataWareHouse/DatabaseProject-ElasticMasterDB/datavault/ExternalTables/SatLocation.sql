SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
DROP EXTERNAL TABLE [datavault].[SatLocation] 
GO
CREATE EXTERNAL TABLE [datavault].[SatLocation](
-- Key Area
    [LocationHashKey] [nvarchar](32) NOT NULL, -- Parent Hash Key (Associated Hub / Link Hash Key)
    [LoadDate] [datetime2](7) NOT NULL,        -- Required (Satellite Load Date)
    [SourceSystem] [nvarchar](50) NOT NULL,    -- Required (Name of Satellite Source)
-- Change Info Area
    [LoadEndDate] [datetime2](7) NULL,         -- Required (Load Date Of Next Satellite Record)
    [LocationChkSum] [nvarchar](32) NOT NULL,  -- Optional (CheckSum) HashDiff
    [ExtractDate] [datetime2](7) NOT NULL,     -- Optional (Source Load Date)
-- Descriptive Attributes (very slow frequency) 
	[Loca_Code] [nvarchar](20) NULL,
	[Loca_Name] [nvarchar](100) NULL
)
    WITH (
    DATA_SOURCE = [ElasticDWHDBQueryDataSrc]
    );
GO
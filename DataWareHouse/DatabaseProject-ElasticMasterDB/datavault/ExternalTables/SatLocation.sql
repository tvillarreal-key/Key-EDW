SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
DROP TABLE IF EXISTS [datavault].[SatLocation] 
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
    [SatLocation_Code] [nvarchar](100) NOT NULL,
    [Yard_Code] [nvarchar](20) NULL,
	[Loco_Code] [nvarchar](20) NULL,
	[Loca_Code] [nvarchar](20) NULL,
	[MKTP_Code] [nvarchar](20) NULL,
	[Yard_Name] [nvarchar](100) NULL,
	[Loco_Name] [nvarchar](100) NULL,
	[Loca_Name] [nvarchar](100) NULL,
	[MKTP_Name] [nvarchar](100) NULL
)
    WITH (
    DATA_SOURCE = [ElasticDWHDBQueryDataSrc]
    );
GO
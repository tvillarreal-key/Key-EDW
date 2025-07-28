SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
DROP EXTERNAL TABLE [datavault].[HubLocation] 
GO
CREATE EXTERNAL TABLE [datavault].[HubLocation](
	[LocationHashKey] [nvarchar](32) NOT NULL,
	[LocationChkSum] [nvarchar](32) NOT NULL,    
	[LoadDate] [datetime2](7) NOT NULL,
	[SourceSystem] [nvarchar](50) NOT NULL,
    [Loca_Code] [nvarchar](100) NOT NULL,
	[LastSeenDate] [datetime2](7) NULL,
)
    WITH (
    DATA_SOURCE = [ElasticDWHDBQueryDataSrc]
    );
GO
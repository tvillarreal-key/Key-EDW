SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
DROP EXTERNAL TABLE [curated].[dimLocation]
GO
CREATE EXTERNAL TABLE [curated].[dimLocation](
	[LocationHashKey] [nvarchar](32) NOT NULL,
	[LocationChkSum] [nvarchar](32) NOT NULL,
	[Loca_Code] [nvarchar](20) NOT NULL,
	[SourceSystem] [nvarchar](50) NOT NULL,
	[Loca_Name] [nvarchar](100) NOT NULL,
	[LastSeenDate] [datetime2](7) NOT NULL,	
	[LoadDate] [datetime2](7) NOT NULL
)
    WITH (
    DATA_SOURCE = [ElasticSTGDBQueryDataSrc]
    );
GO

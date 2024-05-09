USE ElasticMasterDB;
DROP SCHEMA [datavault];
CREATE SCHEMA [datavault];
DROP EXTERNAL TABLE [datavault].[HubAsset];
CREATE EXTERNAL TABLE [datavault].[HubAsset]
( 
    [AssetsHashKey] [nvarchar](32) NOT NULL,
	[AssetsChkSum] [nvarchar](32) NOT NULL,
	[LoadDate] [datetime2](7) NOT NULL,
	[SourceSystem] [nvarchar](50) NOT NULL,
	[LastSeenDate] [datetime2](7) NOT NULL,
	[ID] [int] NOT NULL,
	[Asset_Num] [nvarchar](60) NOT NULL
)
WITH
( DATA_SOURCE = ElasticDWHDBQueryDataSrc);

SELECT *
FROM [datavault].[HubAsset];
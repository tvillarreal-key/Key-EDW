CREATE EXTERNAL TABLE [datavault].[HubAsset] (
    [AssetsHashKey] NVARCHAR (32) NOT NULL,
    [AssetsChkSum] NVARCHAR (32) NOT NULL,
    [LoadDate] DATETIME2 (7) NOT NULL,
    [SourceSystem] NVARCHAR (50) NOT NULL,
    [LastSeenDate] DATETIME2 (7) NOT NULL,
    [ID] INT NOT NULL,
    [Asset_Num] NVARCHAR (60) NOT NULL
)
    WITH (
    DATA_SOURCE = [ElasticDWHDBQueryDataSrc]
    );
GO


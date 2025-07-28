-- Create ElasticMasterDB

--Create user on the external database
USE master;
GO

CREATE LOGIN ElasticUser WITH PASSWORD = '2s45AG&%e33';
GO

USE dwhdb-DEV;
GO

CREATE USER ElasticUser for login ElasticUser;
GO

ALTER ROLE [db_owner] ADD MEMBER [ElasticUser]
GO

USE stgdb-DEV;
GO

-- who is the db_owner? dbo
/* SELECT dp.name AS DatabaseOwner
FROM sys.database_principals AS dp
JOIN sys.databases AS d
ON dp.sid = d.owner_sid
WHERE d.name = 'dwhdb-DEV';

ALTER AUTHORIZATION ON DATABASE::[stgdb-DEV] TO dw_dba; */

-- Drop if already exists
DROP DATABASE SCOPED CREDENTIAL ElasticDBCredential
GO
DROP MASTER KEY
GO
-- Create a MASTER KEY on both source DBs and central database
CREATE MASTER KEY ENCRYPTION BY PASSWORD = '2s45AG&%e33';
CREATE DATABASE SCOPED CREDENTIAL ElasticDBCredential 
WITH IDENTITY = 'ElasticUser', 
SECRET = '2s45AG&%e33';
GO

-- Drop the objects if they already exist
DROP EXTERNAL TABLE [staging].[MDM_Assets]
GO
DROP EXTERNAL DATA SOURCE ElasticDBHubAssets
GO

DROP EXTERNAL TABLE [datavault].[HubAsset]
GO

-- Execute on source DB1 (dwhdb-DEV)
USE ElasticMasterDB;
DROP EXTERNAL DATA SOURCE ElasticDWHDBQueryDataSrc
GO
CREATE EXTERNAL DATA SOURCE ElasticDWHDBQueryDataSrc WITH
    (
        TYPE = RDBMS,
        LOCATION = 'SRVDWH-DEV.DATABASE.WINDOWS.NET',
        DATABASE_NAME = 'dwhdb-DEV',
        CREDENTIAL = ElasticDBCredential, -- that comma is required
    );
GO

-- Execute on source DB2 (stgdb-DEV)
USE ElasticMasterDB;
DROP EXTERNAL DATA SOURCE ElasticSTGDBQueryDataSrc
GO
CREATE EXTERNAL DATA SOURCE ElasticSTGDBQueryDataSrc WITH
    (
        TYPE = RDBMS,
        LOCATION = 'SRVDWH-DEV.DATABASE.WINDOWS.NET',
        DATABASE_NAME = 'stgdb-DEV',
        CREDENTIAL = ElasticDBCredential, -- that comma is required
    );
GO

-- EXTERNAL TABLES
USE ElasticMasterDB;
DROP SCHEMA [staging];
CREATE SCHEMA [staging];
DROP EXTERNAL TABLE [staging].[MDM_Assets];
CREATE EXTERNAL TABLE [staging].[MDM_Assets]
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
( DATA_SOURCE = ElasticSTGDBQueryDataSrc);

-------------------------------------------------------
-- Testing
SELECT *
FROM [staging].[MDM_Assets]
;
-------------------------------------------------------
-- EXTERNAL TABLES
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

-------------------------------------------------------
-- Testing
SELECT *
FROM [datavault].[HubAsset]
;
-------------------------------------------------------
-- EXTERNAL VIEW
USE ElasticMasterDB;
DROP VIEW [datavault].[vw_changed_hubasset_recs];
CREATE VIEW [datavault].[vw_changed_hubasset_recs] AS
SELECT 
    A.[AssetsHashKey]
    ,A.[AssetsChkSum]
    ,A.[LoadDate]
    ,A.[SourceSystem]
    ,A.[LastSeenDate]
    ,A.[ID]
    ,A.[Asset_Num]
,'I' AS Chg_Flag
FROM [staging].[MDM_Assets] A 
LEFT JOIN [datavault].[HubAsset] B
ON A.Asset_Num = B.Asset_Num
WHERE B.Asset_Num IS NULL -- This gets the new records
UNION
SELECT 
    B.[AssetsHashKey]
    ,B.[AssetsChkSum]
    ,B.[LoadDate]
    ,B.[SourceSystem]
    ,B.[LastSeenDate]
    ,B.[ID]
    ,B.[Asset_Num]
,'U' AS Chg_Flag
FROM [staging].[MDM_Assets] A 
LEFT JOIN [datavault].[HubAsset] B
ON A.Asset_Num = B.Asset_Num
WHERE A.AssetsChkSum != B.AssetsChkSum -- This gets the updated records
;
GO

-------------------------------------------------------
-- Testing
SELECT *
FROM [datavault].[vw_changed_hubasset_recs]
;

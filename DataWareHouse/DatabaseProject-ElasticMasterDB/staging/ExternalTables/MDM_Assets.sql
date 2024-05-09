CREATE EXTERNAL TABLE [staging].[MDM_Assets] (
    [AssetsHashKey] NVARCHAR (32) NOT NULL,
    [AssetsChkSum] NVARCHAR (32) NOT NULL,
    [LoadDate] DATETIME2 (7) NOT NULL,
    [SourceSystem] NVARCHAR (50) NOT NULL,
    [LastSeenDate] DATETIME2 (7) NOT NULL,
    [ID] INT NOT NULL,
    [Asset_Num] NVARCHAR (60) NOT NULL,
    [Asset_Desc] NVARCHAR (255) NULL,
    [Asset_Class] NVARCHAR (255) NULL,
    [Manufacturer] NVARCHAR (255) NULL,
    [Model] NVARCHAR (255) NULL,
    [Model_Year] NVARCHAR (255) NULL,
    [Series] NVARCHAR (255) NULL,
    [Serial_Num] NVARCHAR (255) NULL,
    [Status] NVARCHAR (20) NULL,
    [Status_Desc] NVARCHAR (255) NULL,
    [Source] NVARCHAR (20) NULL,
    [Marketed] BIT NULL,
    [Revenue_Track] BIT NULL,
    [Parent_Asset_Num] NVARCHAR (20) NULL,
    [Child_Relationship_Type] NVARCHAR (80) NULL,
    [Loco_Code] NVARCHAR (20) NULL,
    [Loco_Name] NVARCHAR (100) NULL,
    [Loca_Code] NVARCHAR (20) NULL,
    [Loca_Name] NVARCHAR (100) NULL,
    [MKTP_Code] NVARCHAR (20) NULL,
    [MKTP_Name] NVARCHAR (100) NULL,
    [LVL1_Code] NVARCHAR (20) NULL,
    [LVL1_Name] NVARCHAR (100) NULL,
    [LOB_Code] NVARCHAR (20) NULL,
    [LOB_Name] NVARCHAR (100) NULL,
    [Dist_Code] NVARCHAR (20) NULL,
    [Dist_Name] NVARCHAR (100) NULL,
    [Mare_Code] NVARCHAR (20) NULL,
    [Mare_Name] NVARCHAR (100) NULL,
    [Yard_Code] NVARCHAR (20) NULL,
    [Yard_Name] NVARCHAR (100) NULL,
    [W_Status] NVARCHAR (10) NULL,
    [Crew_Needed] BIT NULL,
    [Avail_Date] DATE NULL,
    [LastWT_Date] DATE NULL,
    [Mod_Date] DATE NULL,
    [Mod_User] NVARCHAR (128) NULL,
    [Note] NVARCHAR (512) NULL,
    [Customer] NVARCHAR (100) NULL,
    [JobType] NVARCHAR (50) NULL,
    [Supervisor] NVARCHAR (50) NULL,
    [Operator] NVARCHAR (50) NULL,
    [Directions] NVARCHAR (512) NULL,
    [CompanyMan] NVARCHAR (50) NULL,
    [CompanyManPhone] NVARCHAR (50) NULL,
    [Daylight24HR] NVARCHAR (50) NULL,
    [Size] NVARCHAR (50) NULL,
    [UsedByRigYard] NVARCHAR (20) NULL,
    [UsedByRigNum] NVARCHAR (20) NULL,
    [Source_LastUpdateDate] DATETIME2 (7) NULL,
    [Source_LastUpdateBy] NVARCHAR (128) NULL
)
    WITH (
    DATA_SOURCE = [ElasticSTGDBQueryDataSrc]
    );
GO


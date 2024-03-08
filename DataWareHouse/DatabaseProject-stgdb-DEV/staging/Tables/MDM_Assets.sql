SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- DROP TABLE [staging].[MDM_Assets] 
CREATE TABLE [staging].[MDM_Assets] (
    [AssetsHash]            
        AS (CONVERT([nvarchar](32),hashbytes('MD5',
		UPPER(CONCAT(
			RTRIM(LTRIM(COALESCE(ID, ''))), ';',
			RTRIM(LTRIM(COALESCE(Asset_Num,'')))
			))
		),2)),
    [StagingLoadTimestamp]    DATETIME2 (7)  NULL,
    [StagingSourceSystem]     NVARCHAR (50)  NULL,
    [RawLoadTimestamp]        DATETIME2 (7)  NULL,
    [EffectiveStartDate]      DATE           NULL,
    [EffectiveEndDate]        DATE           NULL,
    [CuratedLoadTimestamp]    DATETIME2 (7)  NULL,
    [CuratedTransformedBy]    NVARCHAR (200) NULL,
    [ID]                      INT            NOT NULL,
    [Asset_Num]               NVARCHAR (60)  NOT NULL,
    [Asset_Desc]              NVARCHAR (255) NULL,
    [Asset_Class]             NVARCHAR (255) NULL,
    [Manufacturer]            NVARCHAR (255) NULL,
    [Model]                   NVARCHAR (255) NULL,
    [Model_Year]              NVARCHAR (255) NULL,
    [Series]                  NVARCHAR (255) NULL,
    [Serial_Num]              NVARCHAR (255) NULL,
    [Status]                  NVARCHAR (20)  NULL,
    [Status_Desc]             NVARCHAR (255) NULL,
    [Source]                  NVARCHAR (20)  NULL,
    [Marketed]                BIT            NULL,
    [Revenue_Track]           BIT            NULL,
    [Parent_Asset_Num]        NVARCHAR (20)  NULL,
    [Child_Relationship_Type] NVARCHAR (80)  NULL,
    [LOCO_CODE]               NVARCHAR (20)  NULL,
    [LOCO_NAME]               NVARCHAR (100) NULL,
    [LOCA_CODE]               NVARCHAR (20)  NULL,
    [LOCA_NAME]               NVARCHAR (100) NULL,
    [MKTP_CODE]               NVARCHAR (20)  NULL,
    [MKTP_NAME]               NVARCHAR (100) NULL,
    [LVL1_CODE]               NVARCHAR (20)  NULL,
    [LVL1_NAME]               NVARCHAR (100) NULL,
    [LOB_CODE]                NVARCHAR (20)  NULL,
    [LOB_NAME]                NVARCHAR (100) NULL,
    [DIST_CODE]               NVARCHAR (20)  NULL,
    [DIST_NAME]               NVARCHAR (100) NULL,
    [MARE_CODE]               NVARCHAR (20)  NULL,
    [MARE_NAME]               NVARCHAR (100) NULL,
    [YARD_CODE]               NVARCHAR (20)  NULL,
    [YARD_NAME]               NVARCHAR (100) NULL,
    [W_Status]                NVARCHAR (10)  NULL,
    [Crew_Needed]             BIT            NULL,
    [Avail_Date]              DATE           NULL,
    [LastWT_Date]             DATE           NULL,
    [Mod_Date]                DATE           NULL,
    [Mod_User]                NVARCHAR (128) NULL,
    [Note]                    NVARCHAR (512) NULL,
    [Customer]                NVARCHAR (100) NULL,
    [JobType]                 NVARCHAR (50)  NULL,
    [Supervisor]              NVARCHAR (50)  NULL,
    [Operator]                NVARCHAR (50)  NULL,
    [Directions]              NVARCHAR (512) NULL,
    [CompanyMan]              NVARCHAR (50)  NULL,
    [CompanyManPhone]         NVARCHAR (50)  NULL,
    [Daylight24HR]            NVARCHAR (50)  NULL,
    [Size]                    NVARCHAR (50)  NULL,
    [UsedByRigYard]           NVARCHAR (20)  NULL,
    [UsedByRigNum]            NVARCHAR (20)  NULL,
    [Source_LastUpdateDate]   DATETIME2 (7)  NULL,
    [Source_LastUpdateBy]     NVARCHAR (128) NULL
);
GO


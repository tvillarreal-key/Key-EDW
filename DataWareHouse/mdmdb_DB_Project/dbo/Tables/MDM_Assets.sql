CREATE TABLE [dbo].[MDM_Assets] (
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
    [Source_LastUpdateBy]     NVARCHAR (128) NULL,
    CONSTRAINT [PK_MDM_Assets] PRIMARY KEY CLUSTERED ([ID] ASC)
);
GO

ALTER TABLE [dbo].[MDM_Assets]
    ADD CONSTRAINT [PK_MDM_Assets] PRIMARY KEY CLUSTERED ([ID] ASC);
GO


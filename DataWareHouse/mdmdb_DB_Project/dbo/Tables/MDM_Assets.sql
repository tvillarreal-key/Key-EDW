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
    [YARD_NAME]               NVARCHAR (100) NULL
);
GO

ALTER TABLE [dbo].[MDM_Assets]
    ADD CONSTRAINT [PK_MDM_Assets] PRIMARY KEY CLUSTERED ([ID] ASC);
GO


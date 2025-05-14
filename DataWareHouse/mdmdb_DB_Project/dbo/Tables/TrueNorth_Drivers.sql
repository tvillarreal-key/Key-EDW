CREATE TABLE [dbo].[TrueNorth_Drivers] (
    [Marketplace]         NVARCHAR (128)  NULL,
    [Location]            NVARCHAR (128)  NULL,
    [Full_Name]           NVARCHAR (128)  NULL,
    [EIN]                 NVARCHAR (9)    NULL,
    [Job_Title]           NVARCHAR (64)   NULL,
    [License_Expirataion] NVARCHAR (16)   NULL,
    [Hire_Date]           NVARCHAR (16)   NULL,
    [Drivers_License]     NVARCHAR (64)   NULL,
    [Approval_Status]     NVARCHAR (32)   NULL,
    [No_Driving_Reasons]  NVARCHAR (2028) NULL,
    [CMV_26k]             NVARCHAR (1)    NULL,
    [CMV_10k_to_26k]      NVARCHAR (1)    NULL,
    [Workover_Rig]        NVARCHAR (1)    NULL,
    [Non_CMV]             NVARCHAR (1)    NULL,
    [Personal_Vehicle]    NVARCHAR (1)    NULL,
    [Sort_Reason]         NVARCHAR (2028) NULL,
    [created_on]          DATETIME        NULL,
    [updated_on]          DATETIME        NULL
);
GO


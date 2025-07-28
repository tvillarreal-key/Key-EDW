CREATE TABLE [dbo].[IScout_343262] (
    [S01_Link]                   NVARCHAR (128)  NULL,
    [S02_Report]                 NVARCHAR (128)  NULL,
    [S03_Report_Number]          NVARCHAR (128)  NULL,
    [S04_Date]                   NVARCHAR (128)  NULL,
    [S05_Updated]                NVARCHAR (128)  NULL,
    [S06_Updated_Time]           NVARCHAR (128)  NULL,
    [S07_Version]                NVARCHAR (128)  NULL,
    [S08_Observer]               NVARCHAR (128)  NULL,
    [S09_Observer_Emp_No]        NVARCHAR (128)  NULL,
    [S10_Duration_Seconds]       NVARCHAR (128)  NULL,
    [S11_Latitude]               NVARCHAR (128)  NULL,
    [S12_Longitude]              NVARCHAR (128)  NULL,
    [S13_Temperature]            NVARCHAR (128)  NULL,
    [S14_Wind_Speed]             NVARCHAR (128)  NULL,
    [S15_Weather]                NVARCHAR (128)  NULL,
    [S16_General]                NVARCHAR (128)  NULL,
    [S17_Supervisor]             NVARCHAR (128)  NULL,
    [S18_District_Manager]       NVARCHAR (128)  NULL,
    [S19_LOB]                    NVARCHAR (128)  NULL,
    [S20_Marketplace]            NVARCHAR (128)  NULL,
    [S21_LCO]                    NVARCHAR (128)  NULL,
    [S22_Asset_No]               NVARCHAR (128)  NULL,
    [S23_Shift_Type]             NVARCHAR (128)  NULL,
    [S24_Crew_Type]              NVARCHAR (128)  NULL,
    [S25_Customer]               NVARCHAR (1024) NULL,
    [S26_Instructions]           NVARCHAR (2048) NULL,
    [S27_Description]            NVARCHAR (1024) NULL,
    [S28_Monthly_Safety_Meeting] NVARCHAR (2048) NULL,
    [S29_Description]            NVARCHAR (1024) NULL,
    [S30_Acknowledgement]        NVARCHAR (128)  NULL,
    [S31_Description]            NVARCHAR (128)  NULL,
    [S32_No_of_Employees]        NVARCHAR (128)  NULL,
    [S33_Name]                   NVARCHAR (2048) NULL,
    [S34_EIN]                    NVARCHAR (1024) NULL,
    [S35_Job_Title]              NVARCHAR (2048) NULL,
    [S36_Signature]              NVARCHAR (512)  NULL,
    [S37_Daylight]               NVARCHAR (128)  NULL,
    [S38_24_Hour]                NVARCHAR (128)  NULL,
    [S39_Day_Crew]               NVARCHAR (128)  NULL,
    [S40_Night_Crew]             NVARCHAR (128)  NULL,
    [S41_Parent_Report_Number]   NVARCHAR (128)  NULL,
    [S42_Parent_Link]            NVARCHAR (128)  NULL,
    [S43_Surrogate]              NVARCHAR (128)  NULL,
    [S98_InsertedOn]             DATETIME        NULL,
    [S99_BatchID]                INT             NULL
);
GO

CREATE NONCLUSTERED INDEX [missing_index_1785_1784]
    ON [dbo].[IScout_343262]([S03_Report_Number] ASC)
    INCLUDE([S06_Updated_Time]);
GO


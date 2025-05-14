CREATE TABLE [dbo].[IScout_336404] (
    [S01_Link]                                             NVARCHAR (128)  NULL,
    [S02_Report]                                           NVARCHAR (128)  NULL,
    [S03_Report_Number]                                    NVARCHAR (128)  NULL,
    [S04_Date]                                             NVARCHAR (128)  NULL,
    [S05_Updated]                                          NVARCHAR (128)  NULL,
    [S06_Updated_Time]                                     NVARCHAR (128)  NULL,
    [S07_Version]                                          NVARCHAR (128)  NULL,
    [S08_Observer]                                         NVARCHAR (128)  NULL,
    [S09_Observer_Emp_No]                                  NVARCHAR (128)  NULL,
    [S10_Duration_Seconds]                                 NVARCHAR (128)  NULL,
    [S11_Latitude]                                         NVARCHAR (128)  NULL,
    [S12_Longitude]                                        NVARCHAR (128)  NULL,
    [S13_Temperature]                                      NVARCHAR (128)  NULL,
    [S14_Wind_Speed]                                       NVARCHAR (128)  NULL,
    [S15_Weather]                                          NVARCHAR (128)  NULL,
    [S16_General]                                          NVARCHAR (128)  NULL,
    [S17_Supervisor]                                       NVARCHAR (128)  NULL,
    [S18_District_Manager]                                 NVARCHAR (128)  NULL,
    [S19_LOB]                                              NVARCHAR (128)  NULL,
    [S20_Marketplace]                                      NVARCHAR (128)  NULL,
    [S21_LCO]                                              NVARCHAR (128)  NULL,
    [S22_Asset_No]                                         NVARCHAR (128)  NULL,
    [S23_Shift_Type]                                       NVARCHAR (128)  NULL,
    [S24_Crew_Type]                                        NVARCHAR (128)  NULL,
    [S25_Customer]                                         NVARCHAR (1024) NULL,
    [S26_Instructions]                                     NVARCHAR (1024) NULL,
    [S27_Description]                                      NVARCHAR (1024) NULL,
    [S28_Weekly_Safety_Review_Learning_Opportunities_Link] NVARCHAR (1024) NULL,
    [S29_Weekly_Safety_Review_Learning_Opportunities]      NVARCHAR (2048) NULL,
    [S30_Description]                                      NVARCHAR (1024) NULL,
    [S31_Acknowledgement]                                  NVARCHAR (128)  NULL,
    [S32_Description]                                      NVARCHAR (128)  NULL,
    [S33_No_of_Employees]                                  NVARCHAR (128)  NULL,
    [S34_Name]                                             NVARCHAR (1024) NULL,
    [S35_EIN]                                              NVARCHAR (1024) NULL,
    [S36_Job_Title]                                        NVARCHAR (1024) NULL,
    [S37_Signature]                                        NVARCHAR (1024) NULL,
    [S38_Daylight]                                         NVARCHAR (128)  NULL,
    [S39_24_Hour]                                          NVARCHAR (128)  NULL,
    [S40_Day_Crew]                                         NVARCHAR (128)  NULL,
    [S41_Night_Crew]                                       NVARCHAR (128)  NULL,
    [S42_Parent_Report_Number]                             NVARCHAR (128)  NULL,
    [S43_Parent_Link]                                      NVARCHAR (128)  NULL,
    [S44_Surrogate]                                        NVARCHAR (128)  NULL,
    [S98_InsertedOn]                                       DATETIME        NULL,
    [S99_BatchID]                                          INT             NULL
);
GO

CREATE NONCLUSTERED INDEX [idx_IScout_336404_S99_BatchID]
    ON [dbo].[IScout_336404]([S99_BatchID] ASC);
GO

CREATE NONCLUSTERED INDEX [idx_IScout_336404_S03_Report_Number]
    ON [dbo].[IScout_336404]([S03_Report_Number] ASC)
    INCLUDE([S06_Updated_Time]);
GO


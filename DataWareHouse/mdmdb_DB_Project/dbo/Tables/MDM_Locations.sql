CREATE TABLE [dbo].[MDM_Locations] (
    [CODE]             VARCHAR (50)  NOT NULL,
    [NAME]             VARCHAR (150) NULL,
    [STATUS]           VARCHAR (20)  NULL,
    [NOTE]             VARCHAR (150) NULL,
    [REVENUE_FLAG]     VARCHAR (5)   NULL,
    [EXPENSE_FLAG]     VARCHAR (5)   NULL,
    [FINANCIAL_FLAG]   VARCHAR (5)   NULL,
    [AREA_CODE]        VARCHAR (50)  NULL,
    [NA_COUNTRY]       VARCHAR (50)  NULL,
    [NA_MA_ADDRESS]    VARCHAR (150) NULL,
    [NA_MA_CITY]       VARCHAR (50)  NULL,
    [NA_MA_STATE]      VARCHAR (10)  NULL,
    [NA_MA_POSTALCODE] VARCHAR (10)  NULL,
    [NA_MA_COUNTRY]    VARCHAR (50)  NULL,
    [NA_PA_ADDRESS]    VARCHAR (150) NULL,
    [NA_PA_CITY]       VARCHAR (50)  NULL,
    [NA_PA_STATE]      VARCHAR (10)  NULL,
    [NA_PA_POSTALCODE] VARCHAR (10)  NULL,
    [NA_PA_COUNTRY]    VARCHAR (50)  NULL,
    [NA_PHONE]         VARCHAR (50)  NULL,
    [NA_STATE]         VARCHAR (10)  NULL,
    [NA_MANAGER]       VARCHAR (10)  NULL,
    [MANAGER_NAME]     VARCHAR (50)  NULL,
    [NA_FAX]           VARCHAR (40)  NULL,
    [NA_COUNTY]        VARCHAR (50)  NULL,
    [NA_GEOCODE]       VARCHAR (100) NULL
);
GO


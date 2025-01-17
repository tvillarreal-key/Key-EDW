CREATE TABLE [dbo].[IScout_159036] (
    [S0_R01_link]             NVARCHAR (128) NULL,
    [S0_R02_report]           NVARCHAR (128) NULL,
    [S0_R03_report_number]    NVARCHAR (20)  NULL,
    [S0_R04_report_date]      NVARCHAR (30)  NULL,
    [S0_R05_updated]          NVARCHAR (30)  NULL,
    [S0_R06_updated_time]     NVARCHAR (20)  NULL,
    [S0_R07_version]          NVARCHAR (5)   NULL,
    [S0_R08_observer]         NVARCHAR (64)  NULL,
    [S0_R09_observer_emp_num] NVARCHAR (64)  NULL,
    [S0_R10_duration]         NVARCHAR (10)  NULL,
    [S0_R11_latitude]         NVARCHAR (30)  NULL,
    [S0_R12_longitude]        NVARCHAR (30)  NULL,
    [S0_R13_temperature]      NVARCHAR (7)   NULL,
    [S0_R14_wind_speed]       NVARCHAR (20)  NULL,
    [S0_R15_weather]          NVARCHAR (20)  NULL,
    [S0_R16_dateTime]         NVARCHAR (40)  NULL,
    [S0_R17_marketplace]      NVARCHAR (64)  NULL,
    [S0_R18_LCO]              NVARCHAR (64)  NULL,
    [S0_R19_district_manager] NVARCHAR (64)  NULL,
    [S0_R20_supervisor]       NVARCHAR (64)  NULL,
    [S0_R21_operator_PIC]     NVARCHAR (64)  NULL,
    [S0_R22_assetNum]         NVARCHAR (64)  NULL,
    [S0_R23_shiftType]        NVARCHAR (64)  NULL,
    [S0_R24_crewType]         NVARCHAR (64)  NULL,
    [S0_R25_customer]         NVARCHAR (128) NULL,
    [S1_R16]                  NVARCHAR (5)   NULL,
    [S1_R17]                  NVARCHAR (5)   NULL,
    [S1_R18]                  NVARCHAR (5)   NULL,
    [S1_R19]                  NVARCHAR (5)   NULL,
    [S1_R20]                  NVARCHAR (5)   NULL,
    [S1_R21]                  NVARCHAR (5)   NULL,
    [S1_R22]                  NVARCHAR (5)   NULL,
    [S1_R23]                  NVARCHAR (5)   NULL,
    [S2_R25]                  NVARCHAR (5)   NULL,
    [S2_R26]                  NVARCHAR (5)   NULL,
    [S2_R27]                  NVARCHAR (5)   NULL,
    [S2_R28]                  NVARCHAR (5)   NULL,
    [S3_R30]                  NVARCHAR (5)   NULL,
    [S3_R31]                  NVARCHAR (5)   NULL,
    [S3_R32]                  NVARCHAR (5)   NULL,
    [S3_R33]                  NVARCHAR (5)   NULL,
    [S3_R34]                  NVARCHAR (5)   NULL,
    [S3_R35]                  NVARCHAR (5)   NULL,
    [S3_R36]                  NVARCHAR (5)   NULL,
    [S3_R37]                  NVARCHAR (5)   NULL,
    [S3_R38]                  NVARCHAR (5)   NULL,
    [S3_R39]                  NVARCHAR (5)   NULL,
    [S4_R41]                  NVARCHAR (128) NULL,
    [S4_R41_SIGNED]           NVARCHAR (5)   NULL,
    [S4_R43]                  NVARCHAR (128) NULL,
    [S4_R43_SIGNED]           NVARCHAR (5)   NULL,
    [S4_R45]                  NVARCHAR (128) NULL,
    [S4_R45_SIGNED]           NVARCHAR (5)   NULL,
    [S99_InsertedOn]          DATETIME       NULL,
    [S99_BatchID]             INT            NULL
);
GO


CREATE NONCLUSTERED INDEX [<Name of Missing Index, sysname,>]
    ON [dbo].[IScout_159036]([S0_R22_assetNum] ASC)
    INCLUDE([S0_R01_link], [S0_R02_report], [S0_R03_report_number], [S0_R04_report_date], [S0_R05_updated], [S0_R06_updated_time], [S0_R07_version], [S0_R08_observer], [S0_R09_observer_emp_num], [S0_R10_duration], [S0_R11_latitude], [S0_R12_longitude], [S0_R13_temperature], [S0_R14_wind_speed], [S0_R15_weather], [S0_R16_dateTime], [S0_R17_marketplace], [S0_R18_LCO], [S0_R19_district_manager], [S0_R20_supervisor], [S0_R21_operator_PIC], [S0_R23_shiftType], [S0_R24_crewType], [S0_R25_customer], [S1_R16], [S1_R17], [S1_R18], [S1_R19], [S1_R20], [S1_R21], [S1_R22], [S1_R23], [S2_R25], [S2_R26], [S2_R27], [S2_R28], [S3_R30], [S3_R31], [S3_R32], [S3_R33], [S3_R34], [S3_R35], [S3_R36], [S3_R37], [S3_R38], [S3_R39], [S4_R41], [S4_R41_SIGNED], [S4_R43], [S4_R43_SIGNED], [S4_R45], [S4_R45_SIGNED], [S99_InsertedOn], [S99_BatchID]);
GO


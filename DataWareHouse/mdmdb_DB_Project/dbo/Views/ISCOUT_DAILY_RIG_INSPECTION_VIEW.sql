
--DROP VIEW [dbo].[ISCOUT_DAILY_RIG_INSPECTION_VIEW]
CREATE VIEW [dbo].[ISCOUT_DAILY_RIG_INSPECTION_VIEW]
AS
SELECT [S0_R01_link],[S0_R02_report],[S0_R03_report_number],[S0_R04_report_date],[S0_R05_updated],[S0_R06_updated_time]
,[S0_R07_version],[S0_R08_observer],[S0_R09_observer_emp_num],[S0_R10_duration],[S0_R11_latitude],[S0_R12_longitude],[S0_R13_temperature]
,[S0_R14_wind_speed],[S0_R15_weather],[S0_R16_dateTime],[S0_R17_marketplace],[S0_R18_LCO],[S0_R19_district_manager],[S0_R20_supervisor]
,[S0_R21_operator_PIC],[S0_R22_assetNum],[S0_R23_shiftType],[S0_R24_crewType],[S0_R25_customer],[S1_R16],[S1_R17],[S1_R18],[S1_R19]
,[S1_R20],[S1_R21],[S1_R22],[S1_R23],[S2_R25],[S2_R26],[S2_R27],[S2_R28],[S3_R30],[S3_R31],[S3_R32],[S3_R33],[S3_R34],[S3_R35],[S3_R36]
,[S3_R37],[S3_R38],[S3_R39],[S4_R41],[S4_R41_SIGNED],[S4_R43],[S4_R43_SIGNED],[S4_R45],[S4_R45_SIGNED],[S99_InsertedOn],[S99_BatchID]
,[S0_R26_Employee_Number],[S0_R27_Approved_Driver],[S1_R24],[S1_R25],[S1B_Electrical],[S2_R24],[S5_Crew_Count],[S5_Crew_EIN],[S99_Form_No]
 FROM [dbo].[IScout_321636]
UNION
SELECT [S0_R01_link],[S0_R02_report],[S0_R03_report_number],[S0_R04_report_date],[S0_R05_updated],[S0_R06_updated_time]
,[S0_R07_version],[S0_R08_observer],[S0_R09_observer_emp_num],[S0_R10_duration],[S0_R11_latitude],[S0_R12_longitude],[S0_R13_temperature]
,[S0_R14_wind_speed],[S0_R15_weather],[S0_R16_dateTime],[S0_R17_marketplace],[S0_R18_LCO],[S0_R19_district_manager],[S0_R20_supervisor]
,[S0_R21_operator_PIC],[S0_R22_assetNum],[S0_R23_shiftType],[S0_R24_crewType],[S0_R25_customer],[S1_R16],[S1_R17],[S1_R18],[S1_R19]
,[S1_R20],[S1_R21],[S1_R22],[S1_R23],[S2_R25],[S2_R26],[S2_R27],[S2_R28],[S3_R30],[S3_R31],[S3_R32],[S3_R33],[S3_R34],[S3_R35],[S3_R36]
,[S3_R37],[S3_R38],[S3_R39],[S4_R41],[S4_R41_SIGNED],[S4_R43],[S4_R43_SIGNED],[S4_R45],[S4_R45_SIGNED],[S99_InsertedOn],[S99_BatchID]
,'' as "S0_R26_Employee_Number",'' as "S0_R27_Approved_Driver",'' as "S1_R24",'' as "S1_R25",'' as "S1B_Electrical",'' as "S2_R24"
,'' as "S5_Crew_Count",'' as "S5_Crew_EIN",'159036' as "S99_Form_No"
  FROM [dbo].[IScout_159036]
GO


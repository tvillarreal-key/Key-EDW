
--DROP VIEW [dbo].[ISCOUT_WEEKLY_RIG_INSPECTION_VIEW]
CREATE VIEW [dbo].[ISCOUT_WEEKLY_RIG_INSPECTION_VIEW]
AS
SELECT [S0_R01_link],[S0_R02_report],[S0_R03_report_number],[S0_R04_report_date],[S0_R05_updated],[S0_R06_updated_time]
,[S0_R07_version],[S0_R08_observer],[S0_R09_observer_emp_num],[S0_R10_duration],[S0_R11_latitude],[S0_R12_longitude],[S0_R13_temperature]
,[S0_R14_wind_speed],[S0_R15_weather],[S0_R16_dateTime],[S0_R17_marketplace],[S0_R18_LCO],[S0_R19_district_manager],[S0_R20_supervisor]
,[S0_R21_operator_PIC],[S0_R22_assetNum],[S0_R23_shiftType],[S0_R24_crewType],[S0_R25_customer],[S1_R17],[S1_R18],[S1_R19],[S1_R20]
,[S1_R21],[S1_R22],[S1_R23],[S1_R24],[S1_R25],[S1_R26],[S1_R27],[S2_R29],[S2_R30],[S2_R31],[S2_R32],[S2_R33],[S2_R34],[S2_R35]
,[S2_R36],[S2_R37],[S2_R38],[S2_R39],[S3_R41],[S3_R42],[S3_R43],[S3_R44],[S3_R45],[S3_R46],[S3_R47],[S3_R48],[S3_R49],[S4_R51]
,[S4_R52],[S4_R54],[S4_R54_SIGNED],[S4_R56],[S4_R56_SIGNED],[S4_R58],[S4_R58_SIGNED],[S99_InsertedOn],[S99_BatchID],[S0_R15_score_percent]
,[S0_R26_Employee_Number],[S0_R27_Approved_Driver],[S1_R1],[S1_R2],[S1_R17_1],[S1_R17_2],[S1_R17_3],[S1_R17_4],[S1_R19_1],[S1_R19_2]
,[S1_R19_3],[S1_R19_4],[S2_R30_1],[S5_Description],[S5_Crew_Count],[S5_Crew_EIN],[S99_Form_No]
FROM [dbo].[IScout_322882]
UNION
SELECT [S0_R01_link],[S0_R02_report],[S0_R03_report_number],[S0_R04_report_date],[S0_R05_updated],[S0_R06_updated_time]
,[S0_R07_version],[S0_R08_observer],[S0_R09_observer_emp_num],[S0_R10_duration],[S0_R11_latitude],[S0_R12_longitude],[S0_R13_temperature]
,[S0_R14_wind_speed],[S0_R15_weather],[S0_R16_dateTime],[S0_R17_marketplace],[S0_R18_LCO],[S0_R19_district_manager],[S0_R20_supervisor]
,[S0_R21_operator_PIC],[S0_R22_assetNum],[S0_R23_shiftType],[S0_R24_crewType],[S0_R25_customer],[S1_R17],[S1_R18],[S1_R19],[S1_R20]
,[S1_R21],[S1_R22],[S1_R23],[S1_R24],[S1_R25],[S1_R26],[S1_R27],[S2_R29],[S2_R30],[S2_R31],[S2_R32],[S2_R33],[S2_R34],[S2_R35]
,[S2_R36],[S2_R37],[S2_R38],[S2_R39],[S3_R41],[S3_R42],[S3_R43],[S3_R44],[S3_R45],[S3_R46],[S3_R47],[S3_R48],[S3_R49],[S4_R51]
,[S4_R52],[S4_R54],[S4_R54_SIGNED],[S4_R56],[S4_R56_SIGNED],[S4_R58],[S4_R58_SIGNED],[S99_InsertedOn],[S99_BatchID]
,'' as "S0_R15_score_percent", '' as "S0_R26_Employee_Number", '' as "S0_R27_Approved_Driver", '' as "S1_R1", '' as "S1_R2"
,'' as "S1_R17_1", '' as "S1_R17_2", '' as "S1_R17_3", '' as "S1_R17_4", '' as "S1_R19_1" , '' as "S1_R19_2"
,'' as "S1_R19_3", '' as "S1_R19_4", '' as "S2_R30_1", '' as "S5_Description", '' as "S5_Crew_Count", '' as "S5_Crew_EIN", '159037' as "S99_Form_No"
FROM [dbo].[IScout_159037]
GO


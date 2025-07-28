CREATE INDEX idx_iscout_160405_observer_emp_num
ON DBO.IScout_160405 ([observer_emp_num]) 
INCLUDE ([link], [report], [report_number], [report_date], [updated], [updated_time], [version]
, [observer], [duration], [latitude], [longitude], [temperature], [wind_speed], [weather]
, [dateTime], [marketplace], [LCO], [district_manager], [supervisor_PIC], [AssetNum], [ShiftType]
, [CrewType], [WellLocation], [Customer], [S1_R13], [S1_R14], [S1_R15], [S1_R16], [S1_R17]
, [S1_R18], [S2_R22], [S2_R23], [S2_R24], [S2_R25], [S2_R26], [S2_R27], [S3_R28], [S3_R29]
, [S3_R30], [S3_R30B], [S3_R30C], [S3_R30D], [S3_R30E], [S3_R30F], [S3_R30G], [S3_R30H], [S3_R30I]
, [S3_R30J], [S3_R30K], [S3_R30L], [S3_R30M], [S3_R31], [S3_R32], [S3_R33], [S3_R34], [S3_R35], [S3_R36]
, [S3_R37], [S3_R38], [S4_R40], [S4_R41], [S4_R42], [S4_R43], [S4_R44], [S4_R45], [S4_R46], [S4_R47]
, [S4_R48], [S4_R49], [S4_R50], [S4_R51], [S4_R52], [S4_R53], [S5_R55], [S5_R56], [S5_R57]
, [Select_daylight], [Select_24hour], [Select_daycrew], [Select_nightcrew], [Select_yes], [Select_no]
, [Select_na], [select_key_built_rig], [select_nov_c_5_rig], [Select_approved], [Select_rejected]
, [InsertedOn], [BatchID]);

CREATE INDEX idx_iscout_160405_BatchID
ON DBO.IScout_160405 ([BatchID])
;

CREATE INDEX idx_iscout_280343A_S003_Report_Number
ON DBO.IScout_280343A ([S003_Report_Number])
INCLUDE ([S001_Link], [S004_Date], [S008_Observer], [S021_Marketplace], [S022_LCO], [S023_District_Manager], [S024_Supervisor], [S025_Asset], [S031_Supervisor_Participation]);

CREATE INDEX idx_iscout_321636_S0_R03_report_number
ON DBO.IScout_321636 ([S0_R03_report_number])
INCLUDE ([S0_R06_updated_time]);

CREATE INDEX idx_iscout_321636_S99_BatchID
ON DBO.IScout_321636 ([S99_BatchID])
;

CREATE INDEX idx_iscout_322882_S0_R03_report_number
ON DBO.IScout_322882 ([S0_R03_report_number])
;

CREATE INDEX idx_iscout_154689
ON DBO.IScout_154689 ([Report_number])
INCLUDE ([Updated_time]);

CREATE INDEX idx_iscout_154689
ON DBO.IScout_154689 ([S01_05],[S07_02])
INCLUDE ([Link], [Report], [Report_number], [Report_date], [Updated], [Updated_time], [Version], [Observer], [Observer_emp_num], [Duration], [Latitude], [Longitude], [Temperature], [Wind_speed], [Weather], [S01_01], [S01_02], [S01_03], [S01_04], [S01_06], [S02_01], [S02_02], [S02_03], [S02_04], [S03_01], [S03_02], [S03_03], [S03_04], [S03_05], [S03_06], [S03_07], [S03_08], [S03_09], [S04_01], [S04_01A], [S04_02], [S04_03], [S05_01], [S05_01A], [S05_02], [S05_02A], [S05_03], [S05_03A], [S05_04], [S05_04A], [S05_05], [S05_05A], [S05_06], [S05_07], [S05_08], [S05_08A], [S05_09], [S05_09A], [S05_10], [S05_11], [S05_12], [S06_01], [S06_02], [S06_03], [S06_04], [S06_05], [S06_06], [S06_06A], [S06_07], [S06_07A], [S06_08], [S06_09], [S07_01], [S07_JOBTITLE_01], [S07_EMPLOYEE_01], [S07_DRUGTESTED_01], [S07_WITNESS_01], [S07_JOBTITLE_02], [S07_EMPLOYEE_02], [S07_DRUGTESTED_02], [S07_WITNESS_02], [S07_JOBTITLE_03], [S07_EMPLOYEE_03], [S07_DRUGTESTED_03], [S07_WITNESS_03], [S07_JOBTITLE_04], [S07_EMPLOYEE_04], [S07_DRUGTESTED_04], [S07_WITNESS_04], [S07_JOBTITLE_05], [S07_EMPLOYEE_05], [S07_DRUGTESTED_05], [S07_WITNESS_05], [S07_JOBTITLE_06], [S07_EMPLOYEE_06], [S07_DRUGTESTED_06], [S07_WITNESS_06], [S07_JOBTITLE_07], [S07_EMPLOYEE_07], [S07_DRUGTESTED_07], [S07_WITNESS_07], [S07_JOBTITLE_08], [S07_EMPLOYEE_08], [S07_DRUGTESTED_08], [S07_WITNESS_08], [S07_JOBTITLE_09], [S07_EMPLOYEE_09], [S07_DRUGTESTED_09], [S07_WITNESS_09], [S07_JOBTITLE_10], [S07_EMPLOYEE_10], [S07_DRUGTESTED_10], [S07_WITNESS_10], [S07_03], [S07_04], [S07_05], [S07_06], [S07_07], [S07_08], [S07_09], [S07_10], [S07_11], [S07_12], [S07_13], [S07_14], [S08_01], [S08_02], [SEL_01], [SEL_02], [SEL_03], [SEL_04], [SEL_05], [SEL_06], [SEL_07], [SEL_08], [SEL_09], [SEL_10], [SEL_11], [SEL_12], [SEL_13], [SEL_14], [SEL_15], [SEL_16], [SEL_17], [SEL_18], [INSERTED_ON], [BATCH_ID], [S01_07], [S01_08], [S01_09], [S01_10], [S01_11], [S01_12], [Deleted], [DeletedOn]
);

CREATE INDEX idx_IScout_159094_is_trailer_pulled
ON reporting.IScout_159094 ([is_trailer_pulled])
INCLUDE ([asset_num])
;

CREATE INDEX idx_D365_MainAccount_ExecutionRunId
ON DBO.D365_MainAccount ([ExecutionRunId])
;

CREATE INDEX idx_Employees_MANAGER_ID
ON DBO.Employees ([MANAGER_ID])
;

CREATE INDEX idx_Employees_MANAGER_ID
ON DBO.Employees ([MANAGER_ID])
INCLUDE ([EIN], [ADUSER], [FIRST_NAME], [LAST_NAME], [JOB_CODE], [JOB_FAMILY], [MP_CODE])
;

CREATE INDEX idx_Employees_STATUS
ON DBO.Employees ([STATUS])
;

CREATE INDEX idx_Employees_STATUS_EIN
ON DBO.Employees ([STATUS])
INCLUDE ([EIN], [ADUSER], [FIRST_NAME], [LAST_NAME], [JOB_CODE], [JOB_FAMILY], [MANAGER_ID], [LCO_CODE], [LOC_CODE], [MP_CODE])
;

CREATE INDEX idx_Employees_EIN
ON DBO.Employees ([EIN])
INCLUDE ([ADUSER], [FIRST_NAME], [LAST_NAME], [JOB_CODE], [JOB_FAMILY], [MANAGER_ID], [LCO_CODE])
;

CREATE INDEX idx_D365_WorkOrders_ExecutionRunId
ON DBO.D365_WorkOrders ([ExecutionRunId])
;

CREATE INDEX idx_IScout_159036_S0_R09_observer_emp_num
ON DBO.IScout_159036 ([S0_R09_observer_emp_num])
;

CREATE INDEX idx_IScout_159036_S0_R09_observer_emp_num
ON DBO.IScout_159036 ([S0_R09_observer_emp_num])
INCLUDE ([S0_R01_link], [S0_R02_report], [S0_R03_report_number], [S0_R04_report_date], [S0_R05_updated], [S0_R06_updated_time], [S0_R07_version], [S0_R08_observer], [S0_R10_duration], [S0_R11_latitude], [S0_R12_longitude], [S0_R13_temperature], [S0_R14_wind_speed], [S0_R15_weather], [S0_R16_dateTime], [S0_R17_marketplace], [S0_R18_LCO], [S0_R19_district_manager], [S0_R20_supervisor], [S0_R21_operator_PIC], [S0_R22_assetNum], [S0_R23_shiftType], [S0_R24_crewType], [S0_R25_customer], [S1_R16], [S1_R17], [S1_R18], [S1_R19], [S1_R20], [S1_R21], [S1_R22], [S1_R23], [S2_R25], [S2_R26], [S2_R27], [S2_R28], [S3_R30], [S3_R31], [S3_R32], [S3_R33], [S3_R34], [S3_R35], [S3_R36], [S3_R37], [S3_R38], [S3_R39], [S4_R41], [S4_R41_SIGNED], [S4_R43], [S4_R43_SIGNED], [S4_R45], [S4_R45_SIGNED], [S99_InsertedOn], [S99_BatchID])
;

CREATE INDEX idx_IScout_159037_S0_R03_report_number
ON DBO.IScout_159037 ([S0_R03_report_number])
INCLUDE ([S0_R06_updated_time])
;

CREATE INDEX idx_IScout_159094
ON DBO.IScout_159094 ([report_number])
INCLUDE ([updated_time])
;

CREATE INDEX idx_KeyView_Activities2
ON DBO.KeyView_Activities2 ([ActivityEndTime])
INCLUDE ([Rig], [JobNumber], [CustomerOrgUnit])
;

CREATE INDEX idx_KeyView_Activities2_ActivityDates
ON DBO.KeyView_Activities2 ([ActivityStartTime], [ActivityEndTime])
INCLUDE ([Rig], [Activity_Number])
;

CREATE INDEX idx_KeyView_Activities2_JobNumber
ON DBO.KeyView_Activities2 ([JobNumber])
INCLUDE ([Well_API_Num], [Well_Name], [Well_Field], [Rig], [MasterWorkType], [MasterJobType], [WorkType], [JobType], [JobStartTime], [JobEndTime], [Activity_ID], [Activity_Number], [ActivityDescription], [ActivityStartTime], [ActivityEndTime], [DurationMinutes], [LastUpdate], [SummaryActivityNumber], [SummaryText], [WorkingDepth], [WellboreConfig], [Yard], [Activity_Category_ID], [Activity_CategoryDesc], [Activity_Class_ID], [Activity_Type_ID], [Activity_Description], [Activity_Engine_Usage_Group], [Activity_Group_ID], [JobClass], [KeyViewOrgUnit], [CustomerOrgUnit], [Exception_DurationMinutes])
;

CREATE INDEX idx_KeyView_Activities2_Rig
ON DBO.KeyView_Activities2 ([Rig])
INCLUDE ([Well_Name], [JobNumber], [JobStartTime])
;

CREATE INDEX idx_LaborIncremental2_WORK_DATE
ON DBO.LaborIncremental2 ([WORK_DATE])
INCLUDE ([ASSET_NUMBER], [EMPLOYEE_ID], [DURATION], [CUSTOMER_ORDER_ID])
;

CREATE INDEX idx_LaborIncremental2_EMPLOYEE_ID
ON DBO.LaborIncremental2 ([EMPLOYEE_ID])
INCLUDE ([SOURCE_FILE], [RUN_DATE], [CHANGED_DATE], [CREATED_BY], [BILLING_FLAG], [ASSET_NUMBER], [CUSTOMER_ID], [JOB_CODE], [WORK_DATE], [WORK_STATE], [WORK_TYPE], [WORK_TYPE_CODE], [STATUS_CODE], [DURATION], [CUSTOMER_ORDER_ID], [PAY_RATE])
;

CREATE INDEX idx_MDM_AssetAttr_AttrCode
ON DBO.MDM_AssetAttr ([AttrCode])
INCLUDE ([asset_num], [attrvalue])
;

CREATE INDEX idx_JOT_Submissions_ein
ON DBO.JOT_Submissions ([ein])
INCLUDE ([id])
;

CREATE INDEX idx_JOT_Submissions_id
ON DBO.JOT_Submissions ([id], [question_id])
INCLUDE ([form_id], [answer], [ein])
;

CREATE INDEX idx_JOT_Submissions_question_id
ON DBO.JOT_Submissions ([question_id])
INCLUDE ([id], [form_id], [answer], [ein])
;

CREATE INDEX idx_MDM_AssetAttr_AttrCode2
ON DBO.MDM_AssetAttr ([AttrCode])
INCLUDE ([asset_num], [attrvalue])
;

CREATE INDEX idx_MDM_Assets_status_desc
ON reporting.MDM_Assets ([status_desc])
INCLUDE ([asset_num], [asset_class], [mktp_name], [yard_code], [Gross_Vehicle_Weight], [dot_roadside_inspection], [crosses_state_lines], [crosses_state_lines_with_trailer], [attached_as_trailer_dvir])
;

CREATE INDEX idx_MDM_Assets_serial_num
ON DBO.MDM_Assets ([serial_num])
INCLUDE ([asset_num], [asset_desc], [asset_class])
;

CREATE INDEX idx_MDM_Assets_serial_num
ON DBO.MDM_Assets ([serial_num])
INCLUDE ([asset_num], [asset_desc], [asset_class])
;

CREATE INDEX idx_MDM_Assets_asset_num
ON DBO.MDM_Assets ([asset_num])
;

CREATE INDEX idx_MDM_Assets_class
ON DBO.MDM_Assets ([asset_num])
;

--======================
CREATE INDEX idx_MDM_Assets_serial_num
ON reporting.MDM_Assets ([serial_num])
INCLUDE ([asset_num], [asset_desc], [asset_class])
;

CREATE INDEX idx_MDM_Assets_status
ON dbo.MDM_Assets ([status])
INCLUDE ([asset_num], [asset_desc], [asset_class])
;

UPDATE STATISTICS reporting.MDM_Assets;

CREATE INDEX idx_MDM_AssetAttr_asset_num
ON reporting.MDM_AssetAttr ([attr_code])
INCLUDE ([asset_num], [attr_value])
;

CREATE INDEX MotiveMiles_InsertOn
ON dbo.MotiveMiles ([InsertOn])
;

CREATE INDEX MotiveMiles_date
ON dbo.MotiveMiles ([date])
;

CREATE INDEX MotiveMiles_date
ON reporting.MotiveMiles ([date])
INCLUDE ([asset_num], [jurisdiction])
;

CREATE INDEX idx_Employees_JOB_CODE
ON DBO.Employees ([JOB_CODE],[STATUS])
;

CREATE INDEX idx_Employees_JobEndTime
ON DBO.KeyView_Activities2 ([JobEndTime])
INCLUDE ([Well_Name], [Rig], [JobNumber], [JobStartTime], [CustomerOrgUnit])
;

CREATE INDEX idx_iscout_154689_S01_05
ON DBO.IScout_154689 ([S01_05])
INCLUDE ([Link], [Report_number], [Report_date], [Updated], [Version], [Observer], [Observer_emp_num], [S01_04], [S03_05], [S03_07])
;

CREATE INDEX idx_iscout_159094_R01_BatchID
ON dbo.IScout_159094 ([R01_BatchID])
;

CREATE INDEX idx_iscout_280343A_S999_BatchID
ON dbo.IScout_280343A ([S999_BatchID])
;

CREATE INDEX idx_iscout_322882_S99_BatchID
ON dbo.IScout_322882 ([S99_BatchID])
;

CREATE INDEX idx_Motive_IFTA_Trips
ON dbo.Motive_IFTA_Trips ([Date])
INCLUDE ([Id], [Jurisdiction], [Vehicle_Id], [Vehicle_number], [Year], [Make], [Model], [VIN], [Metric_Units], [Start_Odometer], [End_Odometer], [Start_Lat], [Start_Lon], [End_Lat], [End_Lon], [Distance], [Time_Zone])
;

CREATE INDEX idx_IScout_WSF_S99_BatchID
ON [dbo].[IScout_WSF] ([S99_BatchID])
;

CREATE INDEX idx_Employee_security_Type
ON [dbo].[Employee_security] ([TYPE], [EMP_LEVEL])
INCLUDE ([MANAGER_ID])
;

CREATE INDEX idx_IScout_163889_report_number
ON [dbo].[IScout_163889] ([report_number]) 
INCLUDE ([updated_time])
;

CREATE INDEX idx_IScout_Check_Table_Updated
ON [dbo].[IScout_Check] ([Table_Updated]) 
INCLUDE ([Form_ID])
;

CREATE INDEX idx_IScout_153573_report_number
ON [dbo].[IScout_153573] ([report_number]) 
INCLUDE ([updated])
;

CREATE INDEX idx_IScout_Check_Form_ID
ON [dbo].[IScout_Check] ([Form_ID]) 
INCLUDE ([Report_Number])
;

CREATE INDEX idx_IScout_160641_S99_BatchID
ON [dbo].[IScout_160641] ([S99_BatchID])
;

CREATE INDEX idx_RigCountStatus_MDM_AssetNum
ON [dbo].[RigCountStatus] ([MDM_AssetNum])
;

DROP INDEX idx_IScout_161841_S09_observer_emp_num
ON [mdmdb].[dbo].[IScout_161841];
/*CREATE INDEX idx_IScout_161841_S09_observer_emp_num
ON [mdmdb].[dbo].[IScout_161841] ([S09_observer_emp_num]) 
INCLUDE ([S01_link], [S02_report], [S03_report_number], [S04_report_date], [S05_updated], [S06_updated_time], [S07_version], [S08_observer], [S10_duration], [S11_latitude], [S12_longitude], [S13_temperature], [S14_wind_speed], [S14_weather], [S15_score_percent], [S16_General_Information], [S17_Date_and_Time], [S18_Date_and_Time_lat], [S19_Date_and_Time_lon], [S20_Marketplace], [S21_LCO], [S22_District_Manager], [S23_Supervisor], [S24_Operator_PIC], [S25_Shift_Type], [S26_Crew], [S27_Asset_Number], [S28_Customer], [S29_Employee_Observation], [S30_Type_Of_Behavior], [S31_Safe_Observation_Level], [S32_SOL_Description], [S33_Good_Catch], [S34_At_Risk_Observation_Levels], [S35_AROL_Description_1], [S36_AROL_Description_2], [S37_AROL_Description_3], [S38_Stop_Work_Obligation_Taken], [S39_SWOT_Used], [S40_Behavior_Categories], [S412_Behavior_List], [S42_PPE], [S43_Condition], [S44_Tools_and_Equipment], [S45_Position], [S46_Vehicle], [S47_Job_Task], [S48_While], [S49_Observed], [S50_Employee_said], [S51_Obstacles], [S52_Obstacles_Description_1], [S53_Obstacles_Description_2], [S54_Obstacles_Description_3], [S55_Obstacles_Description_4], [S56_Obstacles_Description_5], [S57_6Obstacles_Description_6], [S58_Employees_Behavior], [S59_Recommendations_Prevent_Recurrence], [S60_Recommendations], [S61_Recomendations_Description], [S62_Hierarchy_of_Control_Measure], [S63_Agree_and_Try], [S64_Agree_Description_1], [S65_Agree_Description_2], [S66_Followup_Needed], [S67_Add], [S68_Person_Submitting], [S69_Job_Title], [S70_Name], [S71_Signature], [S72_select_24_hour], [S73_select_daylight], [S74_select_day_crew], [S75_select_night_crew], [S76_select_safe_behavior], [S77_select_at_risk_behavior], [S78_select_green], [S79_select_yes], [S80_select_no], [S81_select_yellow], [S82_select_orange], [S83_select_red], [S84_select_ppe], [S85_select_condition], [S86_select_tools_and_equipment], [S87_select_position], [S88_select_vehicle], [S89_select_tool_condition], [S90_select_inspection], [S91_select_tools_designed_for_job], [S92_select_use_of_power_tools], [S93_select_capable_person_safely], [S94_select_difficult_extra_effort], [S95_select_not_capable_safe], [S96_parentrepnum], [S97_parentlink], [S98_surrogate], [S99_InsertedOn], [S99_BatchID]);
*/

DROP INDEX idx_WEX_FUELCARD_TRANSACTIONS_F95_UDVAL_01 
ON [mdmdb].[dbo].[WEX_FUELCARD_TRANSACTIONS];
/* CREATE INDEX idx_WEX_FUELCARD_TRANSACTIONS_F95_UDVAL_01 
ON [mdmdb].[dbo].[WEX_FUELCARD_TRANSACTIONS] ([F95_UDVAL_01],[F15_OptEmbossingField]) 
INCLUDE ([F01_RecordType], [F02_SequenceNum], [F03_FleetAccountName], [F04_FleetAccountNumber], [F05_CustomerAccountNumber], [F06_TransactionDate], [F07_TransactionTime], [F08_PostingDate], [F09_PrevPostingDate], [F10a_ReallocInd], [F10b_CardType], [F11_CCN], [F12_WEXVehicleNumber], [F13_CardSuffix], [F14_PurchaseDevDept], [F16_CompanyVehicleNumber], [F17_VehicleDesc], [F18_LicensePlateNum], [F19_LicensePlateState], [F20_VehicleIdNum], [F21a_TicketNumber], [F21b_TankCapacity], [F22_DriverLastName], [F23_DriverFirstName], [F24_DriverMiddleName], [F25_EmployeeID], [F29_DriverPromptDept], [F30_PromptID], [F31a_WEXTransID], [F31b_SequenceNumber], [F32_BrandName], [F33_SiteName], [F34_SiteAddress], [F35_SiteCity], [F36_SiteState], [F37_SitePostalCode], [F38_CountryOfOrigin], [F39_TypeOfCurrency], [F40_SitePhone], [F41_SiteTIN], [F42_WEXSiteID], [F43_SiteTransType], [F44_WEXTransCode], [F45_NetworkTranType], [F46_CurrentOdometer], [F47_AdjCurrentOdometer], [F48_PrevOdometer], [F49_AdjPrevOdometer], [F50_AdjOdometerFlag], [F51_AdjPrevOdometerFlag], [F52_NACSCode], [F53_ProductName], [F54_ProductDesc], [F55_UOM], [F56_UnitCost], [F57_ContractPricing], [F58_QuantityPurchased], [F59_GrossDollars], [F60_DistanceDriven], [F61_DistancePerUnit], [F62_CostPerDistance], [F64_DiscountFlag], [F65_DiscountAmount], [F67_FuelTaxAmount], [F68_BilledFlag], [F69_NetDollars], [F70_WEXAuthCode], [F71_MultiTranFlag], [F81_UDNAME_01], [F82_UDNAME_02], [F83_UDNAME_03], [F84_UDNAME_04], [F85_UDNAME_05], [F86_UDNAME_06], [F87_UDNAME_07], [F88_UDNAME_08], [F89_UDNAME_09], [F90_UDNAME_10], [F91_UDNAME_11], [F92_UDNAME_12], [F93_UDNAME_13], [F94_UDNAME_14], [F96_UDVAL_02], [F97_UDVAL_03], [F98_UDVAL_04], [F99_UDVAL_05], [F100_UDVAL_06], [F101_UDVAL_07], [F102_UDVAL_08], [F103_UDVAL_09], [F104_UDVAL_10], [F105_UDVAL_11], [F106_UDVAL_12], [F107_UDVAL_13], [F108_UDVAL_14], [CREATED_DATE]);
*/

CREATE INDEX idx_RigCountStage_AssetType
ON [mdmdb].[dbo].[RigCountStage] ([AssetType],[AssetNum], [Daylight24HR]) 
INCLUDE ([Client]);

CREATE INDEX idx_MDM_PEOPLE_LAST_NAME 
ON [mdmdb].[dbo].[MDM_PEOPLE] ([LAST_NAME]);

CREATE INDEX idx_ManHours_Historical_RUN_DATE 
ON [mdmdb].[dbo].[ManHours_Historical] ([EMPLOYEE_ID]) 
INCLUDE ([RUN_DATE], [CUSTOMER_ID], [CUSTOMER], [LOB_NAME], [MKTP_NAME], [DIST_NAME], [Employee], [DURATION], [CREATED_BY], [WORK_TYPE], [WORK_DATE], [JOB_CODE], [ASSET_NUMBER]);

CREATE INDEX idx_LaborIncremental_SOURCE_FILE
ON [mdmdb].[dbo].[LaborIncremental] ([SOURCE_FILE]);

CREATE INDEX idx_LaborIncremental_SOURCE_FILE_RUN_DATE
ON [mdmdb].[dbo].[LaborIncremental] ([SOURCE_FILE]) 
INCLUDE ([RUN_DATE], [CHANGED_DATE], [CREATED_BY], [BILLING_FLAG], [ASSET_NUMBER], [CUSTOMER_ID], [JOB_CODE], [WORK_DATE], [WORK_STATE], [WORK_TYPE], [WORK_TYPE_CODE], [STATUS_CODE], [EMPLOYEE_ID], [DURATION], [CUSTOMER_ORDER_ID], [PAY_RATE], [ROW_ID]);

CREATE INDEX idx_IScout_266378_report_number
ON [mdmdb].[dbo].[IScout_266378] ([report_number]) 
INCLUDE ([upadted_time]);

CREATE INDEX idx_KeyView_Job_Job_ID
ON [mdmdb].[dbo].[KeyView_Job] ([Job_ID]);

CREATE INDEX idx_IScout_336404_S03_Report_Number
ON [mdmdb].[dbo].[IScout_336404] ([S03_Report_Number]) 
INCLUDE ([S06_Updated_Time]);

CREATE INDEX idx_IScout_193520_S003_report_number
ON [mdmdb].[dbo].[IScout_193520] ([S003_report_number]) 
INCLUDE ([S006_updated_time]);

CREATE INDEX idx_IScout_192337_S003_report_number
ON [mdmdb].[dbo].[IScout_192337] ([S003_report_number]) 
INCLUDE ([S006_updated_time]);

CREATE INDEX idx_IScout_187884_S003_Report_Number
ON [mdmdb].[dbo].[IScout_187884] ([S003_Report_Number]) 
INCLUDE ([S006_Updated_Time]);

CREATE INDEX idx_IScout_187765_S003_Report_Number
ON [mdmdb].[dbo].[IScout_187765] ([S003_Report_Number]) 
INCLUDE ([S006_Updated_Time]);

CREATE INDEX idx_IScout_182048_report_number
ON [mdmdb].[dbo].[IScout_182048] ([report_number]) 
INCLUDE ([updated_time]);

CREATE INDEX idx_IScout_181694_report_number
ON [mdmdb].[dbo].[IScout_181694] ([report_number]) 
INCLUDE ([updated_time]);

CREATE INDEX idx_Integration_AuditLog_Transactions_LogSequence
ON [mdmdb].[dbo].[Integration_AuditLog_Transactions] ([LogSequence], [PrimaryExecID], [Status]);

CREATE INDEX idx_ComDataMCTransactions_RecordType
ON [mdmdb].[dbo].[ComDataMCTransactions] ([RecordType], [LoadFile]) 
INCLUDE ([TransactionID], [RecordData], [DateLoaded]);


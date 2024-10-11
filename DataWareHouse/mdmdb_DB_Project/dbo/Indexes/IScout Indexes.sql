-- Indexes for IScout_Followups
CREATE INDEX idx_iscout_followups_form_id_1
ON IScout_Followups (form_id)
INCLUDE (response_id, id, open_status);

CREATE INDEX idx_iscout_followups_form_id_2
ON IScout_Followups (form_id)
INCLUDE (response_id, id, open_status, due, resolved_on);

CREATE INDEX idx_iscout_followups_form_id_3
ON IScout_Followups (form_id)
INCLUDE (response_id, id, resolved_on);

CREATE INDEX idx_iscout_followups_id
ON IScout_Followups (id);

-- Index for IScout_152571
CREATE INDEX idx_iscout_152571_report_number
ON IScout_152571 (report_number)
INCLUDE (updated);

-- Index for IScout_280343D
CREATE INDEX idx_iscout_280343d_report_number
ON IScout_280343D (S003_Report_Number_D)
INCLUDE (S835_Q1, S838_Q2, S841_Q3, S844_Q4, S847_Q5, S850_Q6, S853_Q7, S856_Q8, S859_Q9, S862_Q10, S865_Q11, S868_Q12, S871_Q13, S875_R1, S878_R2, S881_R3, S884_R4, S887_R5, S890_R6, S898_S1, S901_S2, S904_S3, S907_S4, S910_S5, S913_S6, S916_S7);

-- Index for IScout_287345B
CREATE INDEX idx_iscout_287345b_report_number
ON IScout_287345B (S003_Report_Number_B);

-- Index for IScout_287345C
CREATE INDEX idx_iscout_287345c_report_number
ON IScout_287345C (S003_Report_Number_C);

-- Index for IScout_287345D
CREATE INDEX idx_iscout_287345d_report_number
ON IScout_287345D (S003_Report_Number_D);

-- Indexes for IScout_159094
/* CREATE INDEX idx_iscout_159094_trailer_pulled_1
ON IScout_159094 (is_trailer_pulled)
INCLUDE (asset_num); 

CREATE INDEX idx_iscout_159094_trailer_pulled_2
ON IScout_159094 (is_trailer_pulled)
INCLUDE (asset_num); */

CREATE INDEX idx_iscout_321636_s0_r16_datetime
ON dbo.iscout_321636 (S0_R16_dateTime);

CREATE INDEX idx_iscout_assetnum_datetime
ON DBO.ISCOUT_160405 (ASSETNUM, DATETIME);

CREATE INDEX idx_iscout_160405_observer_emp_num
ON DBO.IScout_160405 ([observer_emp_num] 
INCLUDE ([link], [report], [report_number], [report_date], [updated], [updated_time], [version], [observer], [duration], [latitude], [longitude], [temperature], [wind_speed], [weather], [dateTime], [marketplace], [LCO], [district_manager], [supervisor_PIC], [AssetNum], [ShiftType], [CrewType], [WellLocation], [Customer], [S1_R13], [S1_R14], [S1_R15], [S1_R16], [S1_R17], [S1_R18], [S2_R22], [S2_R23], [S2_R24], [S2_R25], [S2_R26], [S2_R27], [S3_R28], [S3_R29], [S3_R30], [S3_R30B], [S3_R30C], [S3_R30D], [S3_R30E], [S3_R30F], [S3_R30G], [S3_R30H], [S3_R30I], [S3_R30J], [S3_R30K], [S3_R30L], [S3_R30M], [S3_R31], [S3_R32], [S3_R33], [S3_R34], [S3_R35], [S3_R36], [S3_R37], [S3_R38], [S4_R40], [S4_R41], [S4_R42], [S4_R43], [S4_R44], [S4_R45], [S4_R46], [S4_R47], [S4_R48], [S4_R49], [S4_R50], [S4_R51], [S4_R52], [S4_R53], [S5_R55], [S5_R56], [S5_R57], [Select_daylight], [Select_24hour], [Select_daycrew], [Select_nightcrew], [Select_yes], [Select_no], [Select_na], [select_key_built_rig], [select_nov_c_5_rig], [Select_approved], [Select_rejected], [InsertedOn], [BatchID]);

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

CREATE INDEX idx_iscout_ExecutionRunId
ON DBO.D365_MainAccount ([ExecutionRunId])
;

CREATE INDEX idx_Employees_MANAGER_ID
ON DBO.Employees ([MANAGER_ID])
INCLUDE ([EIN], [ADUSER], [FIRST_NAME], [LAST_NAME], [JOB_CODE], [JOB_FAMILY], [MP_CODE])
;

CREATE INDEX idx_Employees_STATUS
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

CREATE INDEX idx_IScout_159037_S0_R03_report_number
ON DBO.IScout_159037 ([S0_R03_report_number])
INCLUDE ([S0_R06_updated_time])
;

CREATE INDEX idx_IScout_159094
ON DBO.IScout_159094 ([report_number])
INCLUDE ([updated_time])
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
INCLUDE ([ASSET_NUMBER], [EMPLOYEE_ID], [CUSTOMER_ORDER_ID])
;

CREATE INDEX idx_LaborIncremental2_EMPLOYEE_ID
ON DBO.LaborIncremental2 ([EMPLOYEE_ID])
INCLUDE ([SOURCE_FILE], [RUN_DATE], [CHANGED_DATE], [CREATED_BY], [BILLING_FLAG], [ASSET_NUMBER], [CUSTOMER_ID], [JOB_CODE], [WORK_DATE], [WORK_STATE], [WORK_TYPE], [WORK_TYPE_CODE], [STATUS_CODE], [DURATION], [CUSTOMER_ORDER_ID], [PAY_RATE])
;

CREATE INDEX idx_MDM_AssetAttr_AttrCode
ON DBO.MDM_AssetAttr ([AttrCode])
INCLUDE ([asset_num], [attr_value])
;

CREATE INDEX idx_MDM_AssetAttr_AttrCode
ON DBO.MDM_AssetAttr ([AttrCode])
INCLUDE ([asset_num], [attr_value])
;

CREATE INDEX idx_JOT_Submissions
ON DBO.JOT_Submissions ([ein])
INCLUDE ([id])
;

CREATE INDEX idx_IScout_159094_is_trailer_pulled
ON reporting.IScout_159094 ([is_trailer_pulled])
INCLUDE ([asset_num])
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

CREATE INDEX idx_MDM_Asset_status_desc
ON DBO.MDM_Asset ([status_desc])
INCLUDE ([asset_num], [asset_class], [mktp_name], [yard_code], [Gross_Vehicle_Weight], [dot_roadside_inspection], [crosses_state_lines], [crosses_state_lines_with_trailer], [attached_as_trailer_dvir])
;

CREATE INDEX idx_MDM_Asset_serial_num
ON DBO.MDM_Asset ([[serial_num])
INCLUDE ([asset_num], [asset_desc], [asset_class])
;

CREATE INDEX idx_MDM_Assets_asset_num
ON DBO.MDM_Assets ([asset_num])
;

CREATE INDEX idx_MDM_AssetAttr_asset_num
ON DBO.MDM_AssetAttr ([attr_code])
INCLUDE ([asset_num], [attr_value])
;

CREATE INDEX idx_MDM_Assets_class
ON DBO.MDM_Assets ([asset_num])
;

CREATE INDEX idx_MDM_AssetAttr_asset_num
ON reporting.MDM_AssetAttr ([attr_code])
INCLUDE ([asset_num], [attr_value])
;


CREATE INDEX idx_MDM_AssetAttr_asset_num
ON dbo.MotiveMiles ([InsertOn])
INCLUDE ([asset_num], [attr_value])
;

CREATE INDEX idx_Employees_JOB_CODE
ON DBO.Employees ([JOB_CODE],[STATUS])
;

CREATE INDEX idx_Employees_JobEndTime
ON DBO.KeyView_Activities2 ([JobEndTime])
INCLUDE ([Well_Name], [Rig], [JobNumber], [JobStartTime], [CustomerOrgUnit])
;

CREATE INDEX idx_Employees_JOB_CODE
ON DBO.Employees ([JOB_CODE],[STATUS])
;

CREATE INDEX idx_iscout_154689_S01_05
ON DBO.IScout_154689 ([S01_05])
INCLUDE ([Link], [Report_number], [Report_date], [Updated], [Version], [Observer], [Observer_emp_num], [S01_04], [S03_05], [S03_07])
;

CREATE INDEX idx_iscout_159094_R01_BatchID
ON dbo.IScout_159094 ([R01_BatchID])
;

CREATE INDEX idx_iscout_280343_S999_BatchID
ON dbo.IScout_280343 ([S999_BatchID])
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


CREATE TABLE [dbo].[IScout_192337] (
    [S001_link]                             NVARCHAR (128)  NULL,
    [S002_report]                           NVARCHAR (128)  NULL,
    [S003_report_number]                    NVARCHAR (20)   NULL,
    [S004_report_date]                      NVARCHAR (30)   NULL,
    [S005_updated]                          NVARCHAR (30)   NULL,
    [S006_updated_time]                     NVARCHAR (20)   NULL,
    [S007_version]                          NVARCHAR (5)    NULL,
    [S008_observer]                         NVARCHAR (64)   NULL,
    [S009_observer_emp_num]                 NVARCHAR (9)    NULL,
    [S010_duration]                         NVARCHAR (10)   NULL,
    [S011_latitude]                         NVARCHAR (30)   NULL,
    [S012_longitude]                        NVARCHAR (30)   NULL,
    [S013_temperature]                      NVARCHAR (7)    NULL,
    [S014_wind_speed]                       NVARCHAR (20)   NULL,
    [S014_weather]                          NVARCHAR (20)   NULL,
    [S015_General_Information]              NVARCHAR (512)  NULL,
    [S016_Marketplace]                      NVARCHAR (64)   NULL,
    [S017_LCO]                              NVARCHAR (64)   NULL,
    [S018_District_Manager]                 NVARCHAR (64)   NULL,
    [S019_Work_Ticket_No]                   NVARCHAR (64)   NULL,
    [S020_Emergency_Info]                   NVARCHAR (64)   NULL,
    [S021_GPS_Coordinates]                  NVARCHAR (64)   NULL,
    [S022_GPS_Latitude]                     NVARCHAR (64)   NULL,
    [S023_GPS_Longitude]                    NVARCHAR (64)   NULL,
    [S024_Emergency_Phone_No]               NVARCHAR (64)   NULL,
    [S025_Short_Service_Employees]          NVARCHAR (64)   NULL,
    [S026_SSE_On_Crew]                      NVARCHAR (64)   NULL,
    [S027_Supervisor_Confirm_Skill]         NVARCHAR (64)   NULL,
    [S028_Have_Short_Service_Employees]     NVARCHAR (64)   NULL,
    [S029_SSE_Name]                         NVARCHAR (512)  NULL,
    [S030_SSE_Assigned_Mentor]              NVARCHAR (512)  NULL,
    [S031_Required_PPE_Assessment]          NVARCHAR (64)   NULL,
    [S032_General_PPE]                      NVARCHAR (512)  NULL,
    [S033_Additional_PPE]                   NVARCHAR (512)  NULL,
    [S034_PPE_Not_Listed]                   NVARCHAR (64)   NULL,
    [S035_Worksite_Assessment]              NVARCHAR (64)   NULL,
    [S036_Crane_Certification]              NVARCHAR (64)   NULL,
    [S037_Sling_Condition]                  NVARCHAR (64)   NULL,
    [S038_Daily_Forklift_Inspection]        NVARCHAR (64)   NULL,
    [S038_Forklift_Certified_Operator]      NVARCHAR (64)   NULL,
    [S039_Tag_Lines_Accessible]             NVARCHAR (64)   NULL,
    [S040_LO_TO_Installed]                  NVARCHAR (64)   NULL,
    [S041_Red_Zone_Clear]                   NVARCHAR (64)   NULL,
    [S042_Permit_to_Lift]                   NVARCHAR (64)   NULL,
    [S043_Permit_for_Hotwork]               NVARCHAR (64)   NULL,
    [S044_Worksite_Hazard_Hunt]             NVARCHAR (64)   NULL,
    [S045_List_Hazards_Identified]          NVARCHAR (512)  NULL,
    [S046_Hazard_Description]               NVARCHAR (512)  NULL,
    [S047_Tools_Equipment_In_Use]           NVARCHAR (256)  NULL,
    [S048_Tools_Equipment_Removed]          NVARCHAR (64)   NULL,
    [S049_List_Third_Party_Equip_Inspected] NVARCHAR (256)  NULL,
    [S050_Critical_Activities_JSA_Checked]  NVARCHAR (64)   NULL,
    [S051_CA_Description]                   NVARCHAR (512)  NULL,
    [S052_Critical_Activities]              NVARCHAR (1024) NULL,
    [S053_Work_Plan]                        NVARCHAR (512)  NULL,
    [S054_Required_Tasks]                   NVARCHAR (64)   NULL,
    [S055_Task_Reference_Time]              NVARCHAR (512)  NULL,
    [S056_Task_Latitude]                    NVARCHAR (512)  NULL,
    [S057_Task_Longitude]                   NVARCHAR (512)  NULL,
    [S058_Task_Description]                 NVARCHAR (2048) NULL,
    [S060_COGS_Required_for_Tasks]          NVARCHAR (2048) NULL,
    [S061_COG_Description_1]                NVARCHAR (512)  NULL,
    [S062_COG_Description_2]                NVARCHAR (512)  NULL,
    [S063_COG_Description_3]                NVARCHAR (512)  NULL,
    [S064_COG_Description_4]                NVARCHAR (512)  NULL,
    [S065_COG_Description_5]                NVARCHAR (512)  NULL,
    [S066_COG_Description_6]                NVARCHAR (512)  NULL,
    [S067_COG_Description_7]                NVARCHAR (512)  NULL,
    [S068_COG_Description_8]                NVARCHAR (512)  NULL,
    [S069_COG_Description_9]                NVARCHAR (512)  NULL,
    [S070_COG_Description_10]               NVARCHAR (512)  NULL,
    [S071_COG_Description_11]               NVARCHAR (512)  NULL,
    [S072_COG_Description_12]               NVARCHAR (512)  NULL,
    [S073_COG_Description_13]               NVARCHAR (512)  NULL,
    [S074_COG_Description_14]               NVARCHAR (512)  NULL,
    [S075_COG_Description_15]               NVARCHAR (512)  NULL,
    [S076_COG_Description_16]               NVARCHAR (512)  NULL,
    [S077_COG_Description_17]               NVARCHAR (512)  NULL,
    [S078_COG_Description_18]               NVARCHAR (512)  NULL,
    [S079_COG_Description_19]               NVARCHAR (512)  NULL,
    [S080_COG_Description_20]               NVARCHAR (512)  NULL,
    [S081_COG_Description_21]               NVARCHAR (512)  NULL,
    [S082_COG_Description_22]               NVARCHAR (512)  NULL,
    [S083_COG_Description_23]               NVARCHAR (512)  NULL,
    [S084_COG_Description_24]               NVARCHAR (512)  NULL,
    [S085_COG_Description_25]               NVARCHAR (512)  NULL,
    [S086_COG_Description_26]               NVARCHAR (512)  NULL,
    [S087_COG_Description_27]               NVARCHAR (512)  NULL,
    [S088_COG_Description_28]               NVARCHAR (512)  NULL,
    [S089_COG_Description_29]               NVARCHAR (512)  NULL,
    [S090_COG_Description_30]               NVARCHAR (512)  NULL,
    [S091_COG_Description_31]               NVARCHAR (512)  NULL,
    [S092_COG_Description_32]               NVARCHAR (512)  NULL,
    [S093_COG_Description_33]               NVARCHAR (512)  NULL,
    [S094_COG_Description_34]               NVARCHAR (512)  NULL,
    [S095_COG_Description_35]               NVARCHAR (512)  NULL,
    [S096_COG_Description_36]               NVARCHAR (512)  NULL,
    [S097_Job_Safety_Analysis_JSA]          NVARCHAR (64)   NULL,
    [S098_Job_Safety_Description]           NVARCHAR (512)  NULL,
    [S099_Job_Sequence]                     NVARCHAR (64)   NULL,
    [S100_Job_Reference_Time]               NVARCHAR (512)  NULL,
    [S101_Job_Job_Step]                     NVARCHAR (1024) NULL,
    [S102_Job_Identified_Hazards]           NVARCHAR (2048) NULL,
    [S103_Job_Actions_to_Mitigate_Hazards]  NVARCHAR (2048) NULL,
    [S104_Visitors]                         NVARCHAR (64)   NULL,
    [S105_Visitors_Comm_Guide]              NVARCHAR (512)  NULL,
    [S106_Visitors_Description_1]           NVARCHAR (2048) NULL,
    [S107_Visitors_Description_2]           NVARCHAR (2048) NULL,
    [S108_Number_of_Visitors]               NVARCHAR (256)  NULL,
    [S109_Visitors_Time_In]                 NVARCHAR (512)  NULL,
    [S110_Visitors_Title]                   NVARCHAR (2048) NULL,
    [S111_Visitors_Full_Name]               NVARCHAR (2048) NULL,
    [S112_Visitors_Company]                 NVARCHAR (2048) NULL,
    [S113_Visitors_Signature]               NVARCHAR (256)  NULL,
    [S114_Visitors_Time_Out]                NVARCHAR (512)  NULL,
    [S115_Crew_Members]                     NVARCHAR (64)   NULL,
    [S116_Crew_Assigned_Position_1]         NVARCHAR (MAX)  NULL,
    [S117_Crew_Assigned_Position_1_Name]    NVARCHAR (MAX)  NULL,
    [S118_Crew_Assigned_Position_1_Sig]     NVARCHAR (512)  NULL,
    [S119_Crew_Assigned_Position_2]         NVARCHAR (128)  NULL,
    [S120_Crew_Assigned_Position_2_Name]    NVARCHAR (128)  NULL,
    [S121_Crew_Assigned_Position_2_Sig]     NVARCHAR (64)   NULL,
    [S122_Crew_Assigned_Position_3]         NVARCHAR (128)  NULL,
    [S123_Crew_Assigned_Position_3_Name]    NVARCHAR (128)  NULL,
    [S124_Crew_Assigned_Position_3_Sig]     NVARCHAR (64)   NULL,
    [S125_Crew_Assigned_Position_4]         NVARCHAR (128)  NULL,
    [S126_Crew_Assigned_Position_4_Name]    NVARCHAR (128)  NULL,
    [S127_Crew_Assigned_Position_4_Sig]     NVARCHAR (64)   NULL,
    [S128_Crew_Assigned_Position_5]         NVARCHAR (128)  NULL,
    [S129_Crew_Assigned_Position_5_Name]    NVARCHAR (128)  NULL,
    [S130_Crew_Assigned_Position_5_Sig]     NVARCHAR (64)   NULL,
    [S131_Crew_Assigned_Position_6]         NVARCHAR (128)  NULL,
    [S132_Crew_Assigned_Position_6_Name]    NVARCHAR (128)  NULL,
    [S133_Crew_Assigned_Position_6_Sig]     NVARCHAR (64)   NULL,
    [S134_Crew_Assigned_Position_7]         NVARCHAR (128)  NULL,
    [S135_Crew_Assigned_Position_7_Name]    NVARCHAR (128)  NULL,
    [S136_Crew_Assigned_Position_7_Sig]     NVARCHAR (64)   NULL,
    [S137_Crew_Assigned_Position_8]         NVARCHAR (128)  NULL,
    [S138_Crew_Assigned_Position_8_Name]    NVARCHAR (128)  NULL,
    [S139_Crew_Assigned_Position_8_Sig]     NVARCHAR (64)   NULL,
    [S143_select_yes]                       NVARCHAR (5)    NULL,
    [S144_select_no]                        NVARCHAR (5)    NULL,
    [S145_select_na]                        NVARCHAR (5)    NULL,
    [S146_select_english]                   NVARCHAR (5)    NULL,
    [S147_select_spanish]                   NVARCHAR (5)    NULL,
    [S148_parentrepnum]                     NVARCHAR (64)   NULL,
    [S149_parentlink]                       NVARCHAR (128)  NULL,
    [S150_surrogate]                        NVARCHAR (64)   NULL,
    [S151_InsertedOn]                       DATETIME        NULL,
    [S152_BatchID]                          INT             NULL
);
GO


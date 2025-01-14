SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [hr_reporting].[2022_Current_with_EIN](
	[Location_Code] [smallint] NULL,
	[LVL1_Line_of_Business] [smallint] NULL,
	[LVL2_Department] [varchar](4) NULL,
	[MarketPlace] [nvarchar](50) NULL,
	[Employee_Status] [nvarchar](50) NULL,
	[Reg_Temp] [nvarchar](50) NULL,
	[Full_Part] [nvarchar](50) NULL,
	[Action] [nvarchar](50) NULL,
	[Reason_Code] [nvarchar](50) NULL,
	[Reason_Description] [nvarchar](50) NULL,
	[Vol_Inv_Term] [nvarchar](50) NULL,
	[Employee_ID] [int] NULL,
	[GR8People_ID] [varchar](6) NULL,
	[Experienced_Y_N] [varchar](20) NULL,
	[Previous_Employer] [nvarchar](50) NULL,
	[Previous_Job] [nvarchar](100) NULL,
	[Job_Code] [nvarchar](50) NULL,
	[Job_Title] [nvarchar](50) NULL,
	[Grouping] [nvarchar](50) NULL,
	[Effective_Date] [date] NULL,
	[Year] [smallint] NULL,
	[Eligible_for_OT_Y_N] [bit] NULL,
	[Department_ID] [smallint] NULL,
	[State_Location_Info] [nvarchar](50) NULL,
	[Manager_ID] [int] NULL,
	[Last_Hired_Date] [date] NULL,
	[Original_Hire_Date] [date] NULL,
	[Rehire_Date] [date] NULL,
	[Termination_Date] [date] NULL,
	[Rehire_Y_N] [bit] NULL,
	[Attrition] [bit] NULL,
	[Days_Worked] [smallint] NULL,
	[hours_of_overtime_for_last_month] [float] NULL,
	[hours_of_overtime_for_year] [float] NULL,
	[Date_of_last_Promotion] [date] NULL,
	[Years_since_last_promotion_from_last_sal_change_rpt] [float] NULL,
	[increase_decrease] [float] NULL,
	[Years_in_current_role_from_95_rpt] [float] NULL
) ON [PRIMARY]
GO

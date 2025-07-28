CREATE TABLE [reporting].[Hess_KPI_Bonus_Report_Snapshot] (
    [YARD_NAME]       VARCHAR (100) NULL,
    [EIN]             VARCHAR (10)  NULL,
    [RIG_WORKED_MOST] VARCHAR (50)  NULL,
    [LOCO_CODE]       VARCHAR (50)  NULL,
    [WORKMONTH]       VARCHAR (10)  NULL,
    [WorkMonthOrder]  NUMERIC (18)  NULL,
    [Rig Duration]    NUMERIC (18)  NULL,
    [HIRE_DATE]       VARCHAR (50)  NULL,
    [JOB_CODE]        VARCHAR (50)  NULL,
    [JOB_FAMILY]      VARCHAR (50)  NULL,
    [First Name]      VARCHAR (100) NULL,
    [Last Name]       VARCHAR (100) NULL,
    [Email]           VARCHAR (100) NULL,
    [Rig Type]        VARCHAR (20)  NULL,
    [SumDays_Worked]  NUMERIC (18)  NULL,
    [SumDAILYPAYOUT]  NUMERIC (18)  NULL,
    [SumEE_BONUS]     NUMERIC (18)  NULL,
    [Today]           VARCHAR (30)  NULL,
    [InsertedOn]      DATETIME2 (7) NULL
);
GO


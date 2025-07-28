CREATE TABLE [reporting].[Hess_Crew_Cycle_Time_Report_Snapshot_2] (
    [EIN]                  VARCHAR (10)    NULL,
    [REPORT_MONTH]         VARCHAR (20)    NULL,
    [JOB NUMBER]           VARCHAR (50)    NULL,
    [RIG]                  VARCHAR (50)    NULL,
    [YARD NAME]            VARCHAR (50)    NULL,
    [LOCO CODE]            VARCHAR (50)    NULL,
    [RIG TYPE]             VARCHAR (50)    NULL,
    [SUM_CYCLE_TIME_BONUS] NUMERIC (18, 2) NULL,
    [SUM_RIG_WORKED_DAYS]  NUMERIC (18)    NULL,
    [InsertedOn]           DATETIME2 (7)   NULL
);
GO


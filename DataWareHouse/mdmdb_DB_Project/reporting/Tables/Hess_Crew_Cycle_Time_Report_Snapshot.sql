CREATE TABLE [reporting].[Hess_Crew_Cycle_Time_Report_Snapshot] (
    [EIN]                  VARCHAR (10)    NULL,
    [FIRST_Name]           VARCHAR (100)   NULL,
    [LAST_NAME]            VARCHAR (100)   NULL,
    [EMAIL]                VARCHAR (100)   NULL,
    [JOB_CODE]             VARCHAR (50)    NULL,
    [JOB_POSITION]         VARCHAR (100)   NULL,
    [IsGrandTotalRowTotal] VARCHAR (10)    NULL,
    [SumCycle_Time_Bonus]  NUMERIC (18, 2) NULL,
    [InsertedOn]           DATETIME2 (7)   NULL
);
GO


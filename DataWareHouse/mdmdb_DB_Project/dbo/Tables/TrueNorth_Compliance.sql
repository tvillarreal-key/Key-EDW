CREATE TABLE [dbo].[TrueNorth_Compliance] (
    [employee_id] NVARCHAR (10)  NULL,
    [last_name]   NVARCHAR (64)  NULL,
    [first_name]  NVARCHAR (64)  NULL,
    [middle_name] NVARCHAR (64)  NULL,
    [job_title]   NVARCHAR (64)  NULL,
    [group]       NVARCHAR (128) NULL,
    [hire_date]   DATETIME       NULL,
    [category]    NVARCHAR (64)  NULL,
    [requirement] NVARCHAR (128) NULL,
    [frequency]   NVARCHAR (128) NULL,
    [event_date]  DATETIME       NULL,
    [status]      NVARCHAR (32)  NULL,
    [due_date]    DATETIME       NULL,
    [email]       NVARCHAR (64)  NULL,
    [zero]        NVARCHAR (1)   NULL,
    [created_on]  DATETIME       NULL,
    [updated_on]  DATETIME       NULL
);
GO

CREATE NONCLUSTERED INDEX [IX_TrueNorth_Compliance_empid_requirement_duedate]
    ON [dbo].[TrueNorth_Compliance]([employee_id] ASC, [requirement] ASC, [due_date] ASC);
GO


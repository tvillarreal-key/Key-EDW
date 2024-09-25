CREATE TABLE [dbo].[Employee_security] (
    [EIN]        NVARCHAR (9)  NULL,
    [ADUSER]     NVARCHAR (64) NULL,
    [TYPE]       NVARCHAR (20) NULL,
    [CODE]       NVARCHAR (20) NULL,
    [EMP_LEVEL]  INT           NULL,
    [MANAGER_ID] NVARCHAR (9)  NULL,
    [UPDATED_ON] DATETIME      NULL,
    [Deleted]    INT           NULL,
    [DeletedOn]  DATETIME      NULL
);
GO

CREATE NONCLUSTERED INDEX [IX_Employee_security_ein_type_code]
    ON [dbo].[Employee_security]([EIN] ASC, [TYPE] ASC, [CODE] ASC);
GO


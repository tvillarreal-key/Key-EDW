CREATE TABLE [dbo].[Employee_security] (
    [EIN]        NVARCHAR (9)  NULL,
    [ADUSER]     NVARCHAR (64) NULL,
    [TYPE]       NVARCHAR (20) NULL,
    [CODE]       NVARCHAR (20) NULL,
    [EMP_LEVEL]  INT           NULL,
    [MANAGER_ID] NVARCHAR (9)  NULL,
    [UPDATED_ON] DATETIME      NULL
);
GO


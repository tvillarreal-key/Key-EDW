CREATE TABLE [dbo].[IScout_History] (
    [FormNumber]   NVARCHAR (20) NOT NULL,
    [ReportNumber] NVARCHAR (20) NOT NULL,
    [Version]      NVARCHAR (5)  NOT NULL,
    [ReportDate]   NVARCHAR (30) NULL,
    [Updated]      NVARCHAR (30) NULL,
    [Inserted]     DATETIME      NULL,
    [BatchID]      INT           NULL
);
GO


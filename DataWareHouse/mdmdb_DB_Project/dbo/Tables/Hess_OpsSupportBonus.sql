CREATE TABLE [dbo].[Hess_OpsSupportBonus] (
    [RowId]             INT            IDENTITY (1, 1) NOT NULL,
    [EIN]               VARCHAR (9)    NULL,
    [TotalGrossPayout]  NVARCHAR (20)  NULL,
    [PerformancePeriod] NVARCHAR (10)  NULL,
    [PayDate]           NVARCHAR (10)  NULL,
    [FirstName]         NVARCHAR (50)  NULL,
    [LastName]          NVARCHAR (50)  NULL,
    [CompleteName]      NVARCHAR (120) NULL,
    [Email]             NVARCHAR (128) NULL
);
GO


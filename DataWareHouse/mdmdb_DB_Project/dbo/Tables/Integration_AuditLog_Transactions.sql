CREATE TABLE [dbo].[Integration_AuditLog_Transactions] (
    [LogSequence]       BIGINT         NULL,
    [PrimaryExecID]     NVARCHAR (100) NULL,
    [TransactionExecID] NVARCHAR (100) NULL,
    [TransactionType]   NVARCHAR (100) NULL,
    [TransactionId]     NVARCHAR (100) NULL,
    [ExecutionEndTime]  DATETIME       NULL,
    [Status]            NVARCHAR (50)  NULL,
    [ErrorDescription]  NVARCHAR (MAX) NULL
);
GO


CREATE TABLE [reporting].[CoA_Reporting_Structure] (
    [Account_Code] NVARCHAR (50)  NOT NULL,
    [Account_Name] NVARCHAR (100) NOT NULL,
    [Parent]       NVARCHAR (50)  NULL,
    [LoD]          TINYINT        NOT NULL,
    [Acc_Type]     NVARCHAR (50)  NULL,
    [Group]        NVARCHAR (50)  NULL,
    [Order]        NVARCHAR (50)  NULL
);
GO


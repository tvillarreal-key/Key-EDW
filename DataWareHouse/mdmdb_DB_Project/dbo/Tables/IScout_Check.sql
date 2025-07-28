CREATE TABLE [dbo].[IScout_Check] (
    [Form_ID]                NVARCHAR (50)  NULL,
    [Report_Number]          NVARCHAR (50)  NULL,
    [Report_Date]            NVARCHAR (50)  NULL,
    [Report_Updated]         NVARCHAR (128) NULL,
    [Report_Updated_Compare] NVARCHAR (50)  NULL,
    [Table_Updated]          NVARCHAR (50)  NULL,
    [Table_Note]             NVARCHAR (50)  NULL,
    [Updated_On]             DATETIME       NULL
);
GO

CREATE NONCLUSTERED INDEX [idx_IScout_Check_Form_ID]
    ON [dbo].[IScout_Check]([Form_ID] ASC)
    INCLUDE([Report_Number]);
GO

CREATE NONCLUSTERED INDEX [idx_IScout_Check_Report_UpdatedTable_Updated]
    ON [dbo].[IScout_Check]([Report_Updated] ASC, [Table_Updated] ASC)
    INCLUDE([Report_Number]);
GO

CREATE NONCLUSTERED INDEX [idx_IScout_Check_Table_Updated]
    ON [dbo].[IScout_Check]([Table_Updated] ASC)
    INCLUDE([Form_ID]);
GO

CREATE NONCLUSTERED INDEX [missing_index_1538_1537]
    ON [dbo].[IScout_Check]([Form_ID] ASC)
    INCLUDE([Report_Number], [Table_Updated]);
GO

CREATE NONCLUSTERED INDEX [idx_IScout_Check_Report_Number]
    ON [dbo].[IScout_Check]([Report_Number] ASC);
GO


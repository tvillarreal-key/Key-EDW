CREATE TABLE [dbo].[IScout_Followups] (
    [form_id]            INT           NULL,
    [response_id]        INT           NULL,
    [id]                 NVARCHAR (30) NULL,
    [open_status]        NVARCHAR (10) NULL,
    [due]                DATETIME      NULL,
    [created_on]         NVARCHAR (64) NULL,
    [updated_on]         NVARCHAR (64) NULL,
    [resolved_on]        NVARCHAR (64) NULL,
    [m_observer_id]      NVARCHAR (64) NULL,
    [m_assigner_id]      NVARCHAR (64) NULL,
    [m_assignee_id]      NVARCHAR (64) NULL,
    [m_completer_id]     NVARCHAR (64) NULL,
    [record_inserted_on] DATETIME      NULL,
    [record_updated_on]  DATETIME      NULL
);
GO


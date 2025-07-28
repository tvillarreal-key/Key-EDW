CREATE TABLE [dbo].[IScout_Followup_Messages] (
    [form_id]            INT            NULL,
    [response_id]        INT            NULL,
    [id]                 NVARCHAR (30)  NULL,
    [date_of_message]    NVARCHAR (64)  NULL,
    [note]               NVARCHAR (MAX) NULL,
    [notify]             NVARCHAR (10)  NULL,
    [m_user_id]          NVARCHAR (64)  NULL,
    [record_inserted_on] DATETIME       NULL,
    [record_updated_on]  DATETIME       NULL,
    [followup_id]        NVARCHAR (30)  NULL
);
GO


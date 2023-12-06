CREATE TABLE [dbo].[JOT_Submissions] (
    [id]           NVARCHAR (50)   NULL,
    [form_id]      NVARCHAR (50)   NULL,
    [answer_order] NUMERIC (18)    NULL,
    [question_id]  NUMERIC (18)    NULL,
    [question]     NVARCHAR (2048) NULL,
    [answer]       NVARCHAR (2048) NULL,
    [created_at]   DATETIME        NULL,
    [ein]          NVARCHAR (9)    NULL,
    [updated_at]   DATETIME        NULL
);
GO


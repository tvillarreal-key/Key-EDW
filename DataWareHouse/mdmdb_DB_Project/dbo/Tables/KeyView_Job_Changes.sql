CREATE TABLE [dbo].[KeyView_Job_Changes] (
    [Job_ID]     NUMERIC (18)  NOT NULL,
    [ChangeDate] DATETIME2 (3) NULL
);
GO

ALTER TABLE [dbo].[KeyView_Job_Changes]
    ADD CONSTRAINT [PK_KeyView_Job_Changes] PRIMARY KEY CLUSTERED ([Job_ID] ASC);
GO


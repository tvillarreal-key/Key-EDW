CREATE TABLE [dbo].[JOT_Forms] (
    [id]         NVARCHAR (50)  NOT NULL,
    [title]      NVARCHAR (250) NULL,
    [url]        NVARCHAR (250) NULL,
    [username]   NVARCHAR (50)  NULL,
    [status]     NVARCHAR (50)  NULL,
    [updated_on] DATETIME       NULL
);
GO

ALTER TABLE [dbo].[JOT_Forms]
    ADD CONSTRAINT [PK_JOT_Forms] PRIMARY KEY CLUSTERED ([id] ASC);
GO


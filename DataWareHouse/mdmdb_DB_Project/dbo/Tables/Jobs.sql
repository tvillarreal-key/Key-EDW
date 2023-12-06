CREATE TABLE [dbo].[Jobs] (
    [job_code]   NVARCHAR (50) NOT NULL,
    [job_desc]   NVARCHAR (50) NULL,
    [job_family] NVARCHAR (50) NULL,
    [status]     NVARCHAR (10) NULL,
    [value4]     NVARCHAR (10) NULL,
    [value5]     NVARCHAR (10) NULL,
    [value6]     NVARCHAR (50) NULL,
    [value7]     NVARCHAR (50) NULL,
    [value8]     NVARCHAR (50) NULL,
    [value9]     NVARCHAR (10) NULL,
    [value10]    NVARCHAR (50) NULL
);
GO

ALTER TABLE [dbo].[Jobs]
    ADD CONSTRAINT [PK_Jobs] PRIMARY KEY CLUSTERED ([job_code] ASC);
GO


CREATE TABLE [dbo].[FreshService_Assets] (
    [Id]                NVARCHAR (20)  NOT NULL,
    [Display_Id]        NVARCHAR (20)  NULL,
    [Name]              NVARCHAR (50)  NULL,
    [Description]       NVARCHAR (MAX) NULL,
    [Asset_Type_Id]     NVARCHAR (20)  NULL,
    [Impact]            NVARCHAR (10)  NULL,
    [Usage_Type]        NVARCHAR (20)  NULL,
    [Asset_Tag]         NVARCHAR (50)  NULL,
    [User_Id]           NVARCHAR (20)  NULL,
    [Department_Id]     NVARCHAR (20)  NULL,
    [Location_Id]       NVARCHAR (20)  NULL,
    [Agent_Id]          NVARCHAR (20)  NULL,
    [Group_Id]          NVARCHAR (20)  NULL,
    [Assigned_On]       NVARCHAR (30)  NULL,
    [Created_At]        NVARCHAR (30)  NULL,
    [Updated_At]        NVARCHAR (30)  NULL,
    [Author_Type]       NVARCHAR (50)  NULL,
    [End_of_Life]       NVARCHAR (30)  NULL,
    [Discovery_Enabled] NVARCHAR (20)  NULL
);
GO

ALTER TABLE [dbo].[FreshService_Assets]
    ADD CONSTRAINT [PK_FreshService_Assets] PRIMARY KEY CLUSTERED ([Id] ASC);
GO


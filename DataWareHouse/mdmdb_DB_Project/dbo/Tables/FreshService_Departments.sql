CREATE TABLE [dbo].[FreshService_Departments] (
    [id]            NVARCHAR (20)  NULL,
    [description]   NVARCHAR (50)  NULL,
    [name]          NVARCHAR (MAX) NULL,
    [created_at]    NVARCHAR (20)  NULL,
    [updated_at]    NVARCHAR (20)  NULL,
    [prime_user_id] NVARCHAR (50)  NULL,
    [head_user_id]  NVARCHAR (50)  NULL,
    [domains]       NVARCHAR (MAX) NULL,
    [cusom_fields]  NVARCHAR (MAX) NULL
);
GO


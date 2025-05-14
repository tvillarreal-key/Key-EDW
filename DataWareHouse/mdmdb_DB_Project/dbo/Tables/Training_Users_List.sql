CREATE TABLE [dbo].[Training_Users_List] (
    [user_id]                   NVARCHAR (60) NULL,
    [first_name]                NVARCHAR (60) NULL,
    [last_name]                 NVARCHAR (60) NULL,
    [ad_user_name]              NVARCHAR (30) NULL,
    [ein]                       NVARCHAR (10) NULL,
    [training_percent_complete] INT           NULL,
    [record_inserted_on]        DATETIME      NULL,
    [record_updated_on]         DATETIME      NULL
);
GO


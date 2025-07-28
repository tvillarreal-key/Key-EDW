CREATE TABLE [dbo].[Training_Employee_Status_List] (
    [m_user_id]          NVARCHAR (60) NULL,
    [training_id]        INT           NULL,
    [status]             BIT           NULL,
    [date_number]        NVARCHAR (8)  NULL,
    [expiresOn]          NVARCHAR (8)  NULL,
    [startsExpiringOn]   NVARCHAR (8)  NULL,
    [record_inserted_on] DATETIME      NULL,
    [record_updated_on]  DATETIME      NULL
);
GO


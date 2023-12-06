CREATE TABLE [dbo].[MotusMiles] (
    [EIN]        NVARCHAR (9)   NOT NULL,
    [User_ID]    NVARCHAR (50)  NULL,
    [Group_Name] NVARCHAR (100) NULL,
    [Last_Name]  NVARCHAR (50)  NULL,
    [First_Name] NVARCHAR (50)  NULL,
    [Mileage]    INT            NULL,
    [Date]       DATE           NOT NULL,
    [Timestamp]  NVARCHAR (50)  NULL,
    [created_on] DATETIME2 (7)  NULL
);
GO


CREATE TABLE [dbo].[Motus] (
    [EIN]          INT           NOT NULL,
    [Last_Name]    NVARCHAR (50) NOT NULL,
    [First_Name]   NVARCHAR (50) NOT NULL,
    [Location]     SMALLINT      NOT NULL,
    [LVL1]         SMALLINT      NOT NULL,
    [LVL2]         SMALLINT      NOT NULL,
    [Market_Place] NVARCHAR (50) NOT NULL,
    [Manager_Name] NVARCHAR (50) NOT NULL,
    [Mileage]      SMALLINT      NULL,
    [Date]         DATE          NOT NULL
);
GO


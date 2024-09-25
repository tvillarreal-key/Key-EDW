CREATE TABLE [dbo].[RigCountStatus_BAK] (
    [RowID]        DECIMAL (18)   NOT NULL,
    [Date]         DATE           NOT NULL,
    [YardNum]      NVARCHAR (20)  NOT NULL,
    [YardName]     NVARCHAR (128) NOT NULL,
    [LOCO]         NVARCHAR (20)  NOT NULL,
    [Marketplace]  NVARCHAR (50)  NOT NULL,
    [AssetType]    NVARCHAR (50)  NOT NULL,
    [AssetNum]     NVARCHAR (20)  NOT NULL,
    [MDM_AssetNum] NVARCHAR (20)  NULL,
    [Supervisor]   NVARCHAR (50)  NULL,
    [Operator]     NVARCHAR (50)  NULL,
    [Client]       NVARCHAR (50)  NULL,
    [Status]       NVARCHAR (50)  NULL,
    [Daylight24HR] NVARCHAR (50)  NULL,
    [Comments]     NVARCHAR (MAX) NULL,
    [RigYard]      NVARCHAR (20)  NULL,
    [RigNum]       NVARCHAR (20)  NULL,
    [Size]         NVARCHAR (50)  NULL,
    [PipeFeet]     NVARCHAR (20)  NULL,
    [LOB]          NVARCHAR (20)  NULL,
    [Submitted]    DATETIME2 (7)  NULL,
    [Updated]      DATETIME2 (7)  NULL
);
GO


CREATE TABLE [dbo].[RigStatusYards] (
    [ID]              INT            IDENTITY (1, 1) NOT NULL,
    [Marketplace]     NVARCHAR (50)  NULL,
    [YardName]        NVARCHAR (50)  NULL,
    [LOB]             NVARCHAR (10)  NULL,
    [DistrictManager] NVARCHAR (128) NULL,
    [Submitted]       NVARCHAR (20)  NULL
);
GO

ALTER TABLE [dbo].[RigStatusYards]
    ADD CONSTRAINT [PK_RigStatusYards] PRIMARY KEY CLUSTERED ([ID] ASC);
GO


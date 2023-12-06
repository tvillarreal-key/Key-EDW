CREATE TABLE [dbo].[PBI_Groups] (
    [id]                    NVARCHAR (50)  NOT NULL,
    [isReadOnly]            NVARCHAR (10)  NULL,
    [isOnDedicatedCapacity] NVARCHAR (10)  NULL,
    [group_type]            NVARCHAR (50)  NULL,
    [group_name]            NVARCHAR (512) NULL,
    [updated_on]            DATETIME       NULL
);
GO

ALTER TABLE [dbo].[PBI_Groups]
    ADD CONSTRAINT [PK_PBI_Groups] PRIMARY KEY CLUSTERED ([id] ASC);
GO


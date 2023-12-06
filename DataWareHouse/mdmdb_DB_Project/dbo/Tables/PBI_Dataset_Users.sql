CREATE TABLE [dbo].[PBI_Dataset_Users] (
    [identifier]             NVARCHAR (50) NULL,
    [datasetUserAccessRight] NVARCHAR (50) NULL,
    [principalType]          NVARCHAR (50) NULL,
    [dataset_id]             NVARCHAR (50) NULL,
    [group_id]               NVARCHAR (50) NULL,
    [updated_at]             DATETIME      NULL
);
GO


CREATE TABLE [dbo].[PBI_Datasets] (
    [id]                               NVARCHAR (50)   NOT NULL,
    [dataset_name]                     NVARCHAR (512)  NULL,
    [webUrl]                           NVARCHAR (1024) NULL,
    [addRowsAPIEnabled]                NVARCHAR (10)   NULL,
    [configuredBy]                     NVARCHAR (50)   NULL,
    [isRefreshable]                    NVARCHAR (10)   NULL,
    [isEffectiveIdentityRequired]      NVARCHAR (10)   NULL,
    [isEffectiveIdentityRolesRequired] NVARCHAR (10)   NULL,
    [isOnPremGatewayRequired]          NVARCHAR (10)   NULL,
    [targetStorageMode]                NVARCHAR (50)   NULL,
    [createdDate]                      NVARCHAR (50)   NULL,
    [createReportEmbedURL]             NVARCHAR (MAX)  NULL,
    [qnaEmbedURL]                      NVARCHAR (MAX)  NULL,
    [updated_at]                       DATETIME        NULL,
    [group_id]                         NVARCHAR (50)   NULL
);
GO

ALTER TABLE [dbo].[PBI_Datasets]
    ADD CONSTRAINT [PK_PBI_Datasets] PRIMARY KEY CLUSTERED ([id] ASC);
GO


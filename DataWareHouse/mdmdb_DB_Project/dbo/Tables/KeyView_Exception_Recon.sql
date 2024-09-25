CREATE TABLE [dbo].[KeyView_Exception_Recon] (
    [JobID]           INT           NOT NULL,
    [ActivityNumber]  INT           NOT NULL,
    [ExceptionNumber] INT           NOT NULL,
    [KV_VARID_1]      NVARCHAR (20) NULL,
    [KV_VARID_2]      NVARCHAR (20) NULL,
    [KV_VARID_3]      NVARCHAR (20) NULL,
    [KV_VARID_4]      NVARCHAR (20) NULL,
    [KV_VARID_5]      NVARCHAR (20) NULL,
    [AZ_VARID_1]      NVARCHAR (20) NULL,
    [AZ_VARID_2]      NVARCHAR (20) NULL,
    [AZ_VARID_3]      NVARCHAR (20) NULL,
    [AZ_VARID_4]      NVARCHAR (20) NULL,
    [AZ_VARID_5]      NVARCHAR (20) NULL
);
GO

ALTER TABLE [dbo].[KeyView_Exception_Recon]
    ADD CONSTRAINT [PK_KeyView_Exception_Recon] PRIMARY KEY CLUSTERED ([JobID] ASC, [ActivityNumber] ASC, [ExceptionNumber] ASC);
GO


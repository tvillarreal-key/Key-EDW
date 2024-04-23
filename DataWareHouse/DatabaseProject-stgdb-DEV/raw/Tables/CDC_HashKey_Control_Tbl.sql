SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
DROP TABLE IF EXISTS [raw].[CDC_Control_Tbl] 
GO
CREATE TABLE [raw].[CDC_Control_Tbl](
    [ID]               INT            IDENTITY (1, 1) NOT NULL,
    [Table_Name]       NVARCHAR (100) NOT NULL,
    [Natural_Key]      NVARCHAR (100) NOT NULL,
    [HashKey]          NVARCHAR (32)  NOT NULL,
    [Update_Date]      DATETIME2 (7)  NOT NULL,
    CONSTRAINT [PK_CDC_Control_Tbl] PRIMARY KEY CLUSTERED ([ID] ASC)
);
GO
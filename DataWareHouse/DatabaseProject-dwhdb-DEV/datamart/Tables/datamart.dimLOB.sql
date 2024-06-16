SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
DROP TABLE IF EXISTS [datamart].[dimLOB] 
GO
CREATE TABLE [datamart].[dimLOB](
	[LOBHashKey] [nvarchar](32) NOT NULL,
	[LOB_Key_Code] [nvarchar](500) NOT NULL,
	[SourceSystem] [nvarchar](50) NOT NULL,
    [Yard_Code] [nvarchar](20) NULL,
    [Yard_Name] [nvarchar](100) NULL, 
    [Lvl1_Code] [nvarchar](20) NULL,
    [Lvl1_Name] [nvarchar](100) NULL,
    [Lob_Code] [nvarchar](20) NULL,
    [Lob_Name] [nvarchar](100) NULL,  
	[LoadDate] [datetime2](7) NOT NULL,
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
ALTER TABLE [datamart].[dimLOB] ADD  CONSTRAINT [PK_dimLOB] PRIMARY KEY NONCLUSTERED 
(
	[LOBHashKey] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO 

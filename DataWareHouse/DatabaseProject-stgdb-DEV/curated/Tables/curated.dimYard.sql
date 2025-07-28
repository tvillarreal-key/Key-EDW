SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
DROP TABLE IF EXISTS [curated].[dimYard] 
GO
CREATE TABLE [curated].[dimYard](
	[YardHashKey] [nvarchar](32) NOT NULL,
	[YardChkSum] [nvarchar](32) NOT NULL,
    [Yard_Code] [nvarchar](20) NULL,    
	[SourceSystem] [nvarchar](50) NOT NULL,
    [Yard_Name] [nvarchar](100) NULL, 
	[LoadDate] [datetime2](7) NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
ALTER TABLE [curated].[dimYard] ADD  CONSTRAINT [PK_dimYard] PRIMARY KEY NONCLUSTERED 
(
	[YardHashKey] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO 

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
DROP TABLE IF EXISTS [datamart].[dimMktPlace] 
GO
CREATE TABLE [datamart].[dimMktPlace](
	[MktPlaceHashKey] [nvarchar](32) NOT NULL,
    [MktPlace_Code] [nvarchar](20) NULL,
	[SourceSystem] [nvarchar](50) NOT NULL,
    [MktPlace_Name] [nvarchar](100) NULL, 
	[LoadDate] [datetime2](7) NOT NULL,
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
ALTER TABLE [datamart].[dimMktPlace] ADD  CONSTRAINT [PK_dimMktPlace] PRIMARY KEY NONCLUSTERED 
(
	[MktPlaceHashKey] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO 

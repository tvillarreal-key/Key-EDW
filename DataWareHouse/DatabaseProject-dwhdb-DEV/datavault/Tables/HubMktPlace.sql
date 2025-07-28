SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
DROP TABLE IF EXISTS [datavault].[HubMktPlace] 
GO
CREATE TABLE [datavault].[HubMktPlace](
	[MktPlaceHashKey] [nvarchar](32) NOT NULL,
	[LoadDate] [datetime2](7) NOT NULL,
	[SourceSystem] [nvarchar](50) NOT NULL,
    [MktPlace_Code] [nvarchar](20) NOT NULL,
	[LastSeenDate] [datetime2](7) NOT NULL,
CONSTRAINT [PK_HubMktPlace] PRIMARY KEY NONCLUSTERED 
(
	[MktPlaceHashKey] ASC
) ON [PRIMARY],
CONSTRAINT [UK_HubMktPlace] UNIQUE NONCLUSTERED 
(
	[MktPlace_Code] ASC
    ,[LoadDate] ASC
    ,[SourceSystem] ASC		
) ON [PRIMARY],
) ON [PRIMARY]
GO
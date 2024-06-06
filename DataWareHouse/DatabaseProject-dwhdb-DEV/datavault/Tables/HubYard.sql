SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
DROP TABLE IF EXISTS [datavault].[HubYard] 
GO
CREATE TABLE [datavault].[HubYard](
	[YardHashKey] [nvarchar](32) NOT NULL,
	[LoadDate] [datetime2](7) NOT NULL,
	[SourceSystem] [nvarchar](50) NOT NULL,
    [Yard_Code] [nvarchar](100) NOT NULL,
	[LastSeenDate] [datetime2](7) NOT NULL,
CONSTRAINT [PK_HubYard] PRIMARY KEY NONCLUSTERED 
(
	[YardHashKey] ASC
) ON [PRIMARY],
CONSTRAINT [UK_HubYard] UNIQUE NONCLUSTERED 
(
	[Yard_Code] ASC
) ON [PRIMARY],
) ON [PRIMARY]
GO
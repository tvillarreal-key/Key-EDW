SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
DROP TABLE IF EXISTS [curated].[DataQualityRules_Tmp] 
GO
CREATE TABLE [curated].[DataQualityRules_Tmp](
    RuleID INT IDENTITY (1, 1) NOT NULL,
    RuleName VARCHAR(255) NOT NULL,
    RuleType VARCHAR(255) NOT NULL,
    RuleDefinition TEXT NOT NULL,
    ExpectedResult VARCHAR(255) NOT NULL,
    IsActive BIT NOT NULL DEFAULT 1,
    Severity INT NOT NULL
) ON [PRIMARY] 
GO
SET ANSI_PADDING ON
GO
ALTER TABLE [curated].[DataQualityRules_Tmp] ADD  CONSTRAINT [PK_DataQualityRules_Tmp] PRIMARY KEY NONCLUSTERED 
(
	[RuleName] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
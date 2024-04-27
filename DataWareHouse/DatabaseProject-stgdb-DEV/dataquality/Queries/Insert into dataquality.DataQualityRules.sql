USE [stgdb-DEV]
GO

INSERT INTO [dataquality].[DataQualityRules]
           ([RuleName]
           ,[RuleType]
           ,[RuleDefinition]
           ,[ExpectedResult]
           ,[IsActive]
           ,[Severity])
     VALUES
           ('Age - Data Range Check'
           ,'Data Range Check'
		   ,'''Age &gt;= 0 AND Age &lt;= 100'''
		   ,'TotalRowCount'
		   ,'1'
		   ,'3')
GO
INSERT INTO [dataquality].[DataQualityRules]
           ([RuleName]
           ,[RuleType]
           ,[RuleDefinition]
           ,[ExpectedResult]
           ,[IsActive]
           ,[Severity])
     VALUES
           ('Email - Pattern Check'
           ,'Pattern Check'
		   ,'''Email LIKE ''%@%.%'''''
		   ,'TotalRowCount'
		   ,'1'
		   ,'2')
GO
INSERT INTO [dataquality].[DataQualityRules]
           ([RuleName]
           ,[RuleType]
           ,[RuleDefinition]
           ,[ExpectedResult]
           ,[IsActive]
           ,[Severity])
     VALUES
           ('Start Date - Consistency Check'
           ,'Consistency Check'
		   ,'''StartDate &lt; EndDate'''
		   ,'TotalRowCount'
		   ,'1'
		   ,'1')
GO



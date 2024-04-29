USE [stgdb-DEV]
GO

INSERT INTO [dataquality].[DQ_Rules]
           ([RuleName]
           ,[RuleType]
           ,[DatabaseName]
           ,[SchemaName]
           ,[TableName]
           ,[ColumnName]
           ,[RuleDefinition]
           ,[ExpectedResult]
           ,[IsActive]
           ,[Severity])
     VALUES
           ('Asset_Desc Null Check'
           ,'Null Check'
           ,'stgdb-DEV'
           ,'staging'
           ,'MDM_Assets'
           ,'Asset_Desc'
           ,'IS NULL'
           ,0
           ,1
           ,3)
GO
INSERT INTO [dataquality].[DQ_Rules]
           ([RuleName]
           ,[RuleType]
           ,[DatabaseName]
           ,[SchemaName]
           ,[TableName]
           ,[ColumnName]
           ,[RuleDefinition]
           ,[ExpectedResult]
           ,[IsActive]
           ,[Severity])
     VALUES
           ('ID Null Check'
           ,'Null Check'
           ,'stgdb-DEV'
           ,'staging'
           ,'MDM_Assets'
           ,'ID'
           ,'IS NULL'
           ,0
           ,1
           ,2)

GO
INSERT INTO [dataquality].[DQ_Rules]
           ([RuleName]
           ,[RuleType]
           ,[DatabaseName]
           ,[SchemaName]
           ,[TableName]
           ,[ColumnName]
           ,[RuleDefinition]
           ,[ExpectedResult]
           ,[IsActive]
           ,[Severity])
     VALUES
           ('Asset_Class Null Check'
           ,'Null Check'
           ,'stgdb-DEV'
           ,'staging'
           ,'MDM_Assets'
           ,'Asset_Class'
           ,'IS NULL'
           ,0
           ,1
           ,2)

GO
INSERT INTO [dataquality].[DQ_Rules]
           ([RuleName]
           ,[RuleType]
           ,[DatabaseName]
           ,[SchemaName]
           ,[TableName]
           ,[ColumnName]
           ,[RuleDefinition]
           ,[ExpectedResult]
           ,[IsActive]
           ,[Severity])
     VALUES
           ('ID Is Numeric Check'
           ,'Numeric Check'
           ,'stgdb-DEV'
           ,'staging'
           ,'MDM_Assets'
           ,''
           ,'ISNUMERIC(Asset_Num) = 0'
           ,0
           ,1
           ,1)

GO




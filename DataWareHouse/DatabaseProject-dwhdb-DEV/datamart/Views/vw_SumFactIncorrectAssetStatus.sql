-- Summary View for [datamart].[FactIncorrectAssetStatus]
-- 2,795
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
DROP VIEW IF EXISTS [datamart].[vw_SumFactIncorrectAssetStatus]
GO
CREATE VIEW [datamart].[vw_SumFactIncorrectAssetStatus] AS
SELECT 
    [MktPlaceHashKey]
    ,[YardHashKey]
    ,[AssetClassHashKey]
    ,[D365_Status_Code]
    ,[Rig_Status_Code]
    ,[Status_Match_Flag]
    ,Count(*) AS [Asset_Count]
    ,[FactLoadDate]
FROM [datamart].[FactIncorrectAssetStatus]
GROUP BY 
    [MktPlaceHashKey]
    ,[YardHashKey]
    ,[AssetClassHashKey]
    ,[D365_Status_Code]
    ,[Rig_Status_Code]
    ,[Status_Match_Flag]
    ,[FactLoadDate]
;
GO

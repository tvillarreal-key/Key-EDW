SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
DROP VIEW IF EXISTS [datavault].[vw_changed_hubasset_recs] 
GO
CREATE VIEW [datavault].[vw_changed_hubasset_recs] AS
SELECT 
    A.[AssetsHashKey]
    ,A.[AssetsChkSum]
    ,A.[LoadDate]
    ,A.[SourceSystem]
    ,A.[LastSeenDate]
    ,A.[ID]
    ,A.[Asset_Num]
,'I' AS Chg_Flag
FROM [staging].[MDM_Assets] A 
LEFT JOIN [datavault].[HubAsset] B
ON A.Asset_Num = B.Asset_Num
WHERE B.Asset_Num IS NULL -- This gets the new records
UNION
SELECT 
    A.[AssetsHashKey]
    ,A.[AssetsChkSum]
    ,A.[LoadDate]
    ,A.[SourceSystem]
    ,A.[LastSeenDate]
    ,A.[ID]
    ,A.[Asset_Num]
,'U' AS Chg_Flag
FROM [staging].[MDM_Assets] A 
LEFT JOIN [datavault].[HubAsset] B
ON A.Asset_Num = B.Asset_Num
WHERE A.AssetsChkSum != B.AssetsChkSum -- This gets the updated records
;
GO


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
DROP VIEW IF EXISTS [datavault].[vw_changed_satassetattr_recs] 
GO
CREATE VIEW [datavault].[vw_changed_satassetattr_recs] AS
SELECT DISTINCT
    stg.[AssetAttrHashKey]
    ,GETDATE() AS SatLoadDate
    ,stg.[SourceSystem]
    ,CAST(NULL AS DATETIME) AS LoadEndDate
    ,stg.[AssetAttrChkSum]
    ,stg.[LoadDate] AS StgExtractDate
	 ,stg.[Asset_ID]
	 ,stg.[Asset_Num]
	 ,stg.[AttrCode]
	 ,stg.[AttrValue]
,'I' AS Chg_Flag
FROM [staging].[MDM_AssetAttr] stg 
LEFT JOIN [datavault].[satassetattr] sat
ON (stg.AssetAttrHashKey = sat.AssetAttrHashKey
    AND sat.LoadEndDate IS NULL)
WHERE 
    (sat.AssetAttrChkSum IS NULL 
     OR stg.AssetAttrChkSum != sat.AssetAttrChkSum) -- This gets the updated records
;
GO


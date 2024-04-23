SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
DROP VIEW IF EXISTS [raw].[vw_latest_raw_assets_keys]
GO
CREATE VIEW [raw].[vw_latest_raw_assets_keys] AS
SELECT AssetsHashKey, AssetsChkSum, LoadDate, Asset_Num
FROM raw.MDM_Assets
WHERE LoadDate IN
    (
        SELECT MAX(LoadDate) MaxLoadDate
        FROM raw.MDM_Assets
    )
;
GO
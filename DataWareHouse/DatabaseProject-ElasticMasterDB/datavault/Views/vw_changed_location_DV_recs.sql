SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
DROP VIEW IF EXISTS [datavault].[vw_changed_location_recs]
GO
CREATE VIEW [datavault].[vw_changed_location_recs] AS
SELECT A.*,'I' AS Chg_Flag
FROM [curated].[dimLocation] A 
LEFT JOIN [datavault].[HubLocation] B 
ON A.LocationHashKey = B.LocationHashKey
WHERE B.LocationHashKey IS NULL -- This gets the new records
UNION
SELECT A.*,'U' AS Chg_Flag
FROM [curated].[dimLocation] A 
LEFT JOIN [datavault].[HubLocation] B
ON A.LocationHashKey = B.LocationHashKey
WHERE A.LocationChkSum != B.LocationChkSum -- This gets the updated records
;
GO

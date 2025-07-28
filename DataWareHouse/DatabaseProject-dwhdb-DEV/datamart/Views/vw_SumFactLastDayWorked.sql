SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
DROP VIEW IF EXISTS [datamart].[vw_SumFactLastDayWorked]
GO
CREATE VIEW [datamart].[vw_SumFactLastDayWorked] AS
WITH CTE AS (
    SELECT 
        UPPER(CONVERT(char(32), HASHBYTES('MD5', UPPER(CONCAT(RTRIM(LTRIM(COALESCE(MKTP_Code,'N/A'))), ';', RTRIM(LTRIM(COALESCE(MKTP_Name,'N/A')))))), 2)) AS MktPlaceHashKey,
        UPPER(CONVERT(char(32), HASHBYTES('MD5', UPPER(CONCAT(RTRIM(LTRIM(COALESCE(yard_Code,'N/A'))), ';', RTRIM(LTRIM(COALESCE(yard_Name,'N/A')))))), 2)) AS YardHashKey,
        UPPER(CONVERT(char(32), HASHBYTES('MD5', UPPER(RTRIM(LTRIM(COALESCE(Asset_Class,'N/A'))))), 2)) AS AssetClassHashKey,
        COALESCE(Status,'N/A') AS D365_Status_Code,
        COALESCE(LastWT_Date,'2999-12-31') AS Last_Day_Worked_Date,
        getdate() AS FactLoadDate
    FROM [datamart].[FactLastDayWorked]
)
SELECT 
    MktPlaceHashKey,
    YardHashKey,
    AssetClassHashKey,
    D365_Status_Code,
    Last_Day_Worked_Date,
    FactLoadDate
FROM CTE
;
GO

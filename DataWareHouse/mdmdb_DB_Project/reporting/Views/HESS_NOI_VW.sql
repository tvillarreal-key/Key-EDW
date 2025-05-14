CREATE VIEW [REPORTING].[HESS_NOI_VW] AS 

WITH ASSETS AS (
    SELECT 
        CASE WHEN TRY_CONVERT(INT, ASSET_NUM) IS NOT NULL THEN FORMAT(CONVERT(INT, ASSET_NUM),'0000000') END AS ASSET_NUM,
        ASSET_CLASS,
        ASSET_DESC
    FROM DBO.MDM_ASSETS 
    
)
/* THIS WAS THE ORIGINAL KPA FORM THAT WAS UPDATED FOR 202=5. THIS TABLE ENDS ON 12/31/2024 */
, INCIDENTS_154689 AS (
    SELECT 
        Report_number as Report_number,
        Report_date as Report_date,
        S03_05 as Asset,
        FORMAT(CONVERT(DATE,Report_date), 'MM-yyyy') as 'Report Month',
        FORMAT(CONVERT(DATE,Report_date), 'yyyy') as 'Report Year',
        Updated as Updated,
        CASE 
            WHEN S01_05 = 'FA' then 'First Aid'
            WHEN S01_05 in ('Light Duty', 'Lost Time', 'Medical') or S01_05 like 'HIPO%'  then 'Recordable'
            WHEN S01_06 = 'SIF' then 'SIF'
            WHEN S01_05 like '%Near Miss%' then 'Near Miss'
            ELSE '' END AS EVENT,
        S01_01 as 'Date/Time of Incident',
        S01_05 as 'Incident Classification',
        S01_06 as 'Secondary Classification',
        S01_04 as 'Description of Incident',
        LEFT(S03_04, CHARINDEX('-', S03_04) - 1) as 'Employee/Injured or in Control',
        '1111'+ RIGHT(S03_04, LEN(S03_04) - CHARINDEX('-', S03_04) ) AS 'Employee/Injured EIN',
        S03_07 as Marketplace,
        S03_08 as LCO,
        'Hess Corp' as Customer,
        Link as Link
    FROM dbo.IScout_154689
    WHERE s07_02 like '%Hess%' and (S01_05 = 'FA' or S01_05 in ('Light Duty', 'Lost Time', 'Medical') or S01_06 = 'SIF' or S01_05 like '%Near Miss%')
)

/* THIS IS THE NEW TABLE FOR THIS KPA FORM THAT STARTS 1/1/2025 AND HAS AN ADDITIONAL NEW FIELD NOT IN THE ORIGINAL TABLE */
, INCIDENTS_371400 AS (
    SELECT 
        S003_Report_number as Report_number,
        S004_Date as Report_date,
        S021_Asset_No as Asset,
        FORMAT(CONVERT(DATE, S004_Date), 'MM-yyyy') as 'Report Month',
        FORMAT(CONVERT(DATE, S004_Date), 'yyyy') as 'Report Year',
        S005_Updated as Updated,
        CASE 
            WHEN S034_Incident_Classification = 'FA' then 'First Aid'
            WHEN S034_Incident_Classification in ('Light Duty', 'Lost Time', 'Medical') or S034_Incident_Classification like 'HIPO%'  then 'Recordable'
            WHEN S035_Secondary_Classification = 'SIF' then 'SIF'
            WHEN S034_Incident_Classification like '%Near Miss%' then 'Near Miss'
            ELSE '' END AS EVENT,
        S030_Date_Time_of_Incident AS 'Date/Time of Incident',
        S034_Incident_Classification AS 'Incident Classification',
        S035_Secondary_Classification AS 'Secondary Classification',
        S033_Brief_Description_of_Incident AS 'Description of Incident',
        S049_Employee_Injured_or_In_Control as 'Employee/Injured or in Control',
        'NA in 2025' AS 'Employee/Injured EIN',
        S019_Marketplace AS Marketplace,
        S020_LCO AS LCO,
        'Hess Corp' AS Customer,
        S001_Link AS Link
    FROM dbo.IScout_371400
    WHERE S025_Client LIKE '%Hess%' AND (S034_Incident_Classification = 'FA' OR S034_Incident_Classification IN ('Light Duty', 'Lost Time', 'Medical') OR 
    S035_Secondary_Classification = 'SIF' or S034_Incident_Classification like '%Near Miss%')
)

/* UNION THE TABLES TOGETHER */
, UNION_TABLES AS (
    SELECT 
        I.*
    FROM INCIDENTS_154689 I 
    UNION
    SELECT 
        N.*
    FROM INCIDENTS_371400 N 
)

SELECT 
    T.*,
    A.ASSET_CLASS,
    A.ASSET_DESC
FROM UNION_TABLES T 
LEFT JOIN ASSETS A ON (T.ASSET = A.ASSET_NUM)
WHERE T.ASSET IS NOT NULL ;
GO


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
DROP VIEW [reporting].[KPI_SAFETY_BONUS_EMPLOYEE_VIEW]
GO
CREATE VIEW [reporting].[KPI_SAFETY_BONUS_EMPLOYEE_VIEW] AS
/* GET MAIN DATA TABLES */
WITH LABOR AS (
    /* GET LABOR INFORMATION FOR HESS JOBS */ 
    SELECT
        ASSET_NUMBER AS RIG, 
        WORK_DATE, 
        DURATION,
        CAST(EMPLOYEE_ID AS VARCHAR) AS EIN 
    FROM DBO.LaborIncremental2
    WHERE CUSTOMER_ID = '000160' AND CAST(WORK_DATE AS DATE) >= '2023-12-08'
)

, MDM_ASSETS AS (
    SELECT
        *
    FROM DBO.MDM_Assets
    WHERE Asset_Class = 'RIG'
)
/* GET ALL RIG UP AND RIG DOWN INFORMATION FOR SPLITTING THE WORK DATES WHEN A RIG UP AND RIG DOWN HAPPEN IN SAME DAY */
, RIG_ACTIVITY AS (
    /* FIND ONLY RIG UP AND RIG DOWN SERVICE UNIT ACTIVITY AND TIMES/ DATE*/
    SELECT distinct
        JobNumber, 
        Rig, 
        Activity_Description AS ACTIVITY,
        CASE 
            WHEN Activity_Description = 'RUSU' THEN CAST(ActivityStartTime as DATE)
            WHEN Activity_Description = 'RDSU' THEN 
            /* when an activity cross dates, keyview ends it at midnight the following day, so it needs to be backed up :01 second */
            CASE
                WHEN CAST(ACTIVITYENDTIME AS TIME) = '00:00:00' AND ActivityEndTime = EOMONTH(ActivityEndTime) THEN CAST(DATEADD(s, -1, ActivityEndTime) AS DATE)
                ELSE CAST(ActivityEndTime AS DATE) END 
            END AS ACTIVITY_TIME
    FROM DBO.KeyView_Activities2
    where CustomerOrgUnit like '%Hess%' AND  (Activity_Description IN ('RUSU','RDSU'))
)

, RIG_UP AS (
    /* FIND FIRST RIG UP SERVICE UNIT */
    SELECT
        JobNumber,
        RIG,
        ACTIVITY,
        MIN(ACTIVITY_TIME) AS ACTIVITY_TIME
    FROM RIG_ACTIVITY
    WHERE ACTIVITY = 'RUSU'
    GROUP BY JobNumber, RIG, ACTIVITY 
)

, RIG_DOWN AS (
    /* FIND LAST RIG DOWN SERVICE UNIT */
    SELECT
        JobNumber,
        RIG,
        ACTIVITY,
        MAX(ACTIVITY_TIME) as ACTIVITY_TIME
    FROM RIG_ACTIVITY
    WHERE ACTIVITY = 'RDSU'
    GROUP BY JobNumber, RIG, ACTIVITY 
)

, RIG_UP_DOWN AS (
    /* COMBINE RIG UP AND RIG DOWN */
    SELECT  
        u.JobNumber,
        FORMAT(CAST(u.RIG AS NUMERIC), '0000000') AS RIG,
        u.ACTIVITY_TIME AS RIG_UP,
        d.ACTIVITY_TIME AS RIG_DOWN
    FROM RIG_UP u
    LEFT JOIN RIG_DOWN d on (u.JobNumber = d.JobNumber and u.Rig = d.Rig)
)

, HESS_RIGS AS (
    /* GET HESS RIGS FOR AN INNER JOIN */
    SELECT
        FORMAT(RIG,'0000000') AS RIG,
        RIG_TYPE
    FROM REPORTING.Hess_Rig_List
)

, KEYVIEW_ACTIVITIES2 AS (
    /* GET JOBS THAT ENDED STARTING 2024-01-01 */
    SELECT DISTINCT 
        FORMAT(CAST(RIG AS numeric),'0000000') AS RIG, 
        WELL_NAME, 
        JobNumber, 
        JobStartTime, 
        JobEndTime
    FROM DBO.KeyView_Activities2
    WHERE CAST(JobEndTime AS DATE) > '2023-12-31' and CustomerOrgUnit like '%Hess%'
)

, EMPLOYEES AS (
    /* GET EMPLOYEE YARD INFORMATION */
    SELECT 
        E.EIN,
        E.JOB_CODE,
        E.JOB_FAMILY,
        E.HIRE_DATE,
        E.TERM_DATE,
        E.LCO_CODE AS LOCO_CODE,
        L.LOCO_NAME,
        L.YARD_CODE,
        L.YARD_NAME,
        E.STATUS AS EMPLOYEE_STATUS
    FROM DBO.Employees E
    LEFT JOIN DBO.LOCO_HIERARCHY L ON (E.LCO_CODE = L.LOCO_CODE)
    WHERE E.TERM_DATE IS NULL OR E.HIRE_DATE > E.TERM_DATE 
)

/* COMBINE LABOR WITH HESS RIG INFORMATION */
, HESS_JOBS AS ( 
    SELECT DISTINCT 
        z.*
    FROM (
        SELECT 
            L.RIG,
            R.RIG_TYPE,
            L.EIN,
            E.TERM_DATE,
            E.EMPLOYEE_STATUS,
            K.JobNumber,
            K.JobStartTime,
            K.JobEndTime,
            K.Well_Name,
            CASE 
                WHEN L.WORK_DATE >= D.RIG_UP AND L.WORK_DATE <= D.RIG_DOWN THEN WORK_DATE 
                ELSE NULL END AS WORK_DATE,
            L.DURATION,
            D.RIG_DOWN,
            D.RIG_UP
        FROM LABOR L 
        INNER JOIN HESS_RIGS R ON (L.RIG = R.RIG) -- HESS ONLY RIGS
        INNER JOIN EMPLOYEES E ON (L.EIN = E.EIN) -- REMOVE TERMED EMPLOYEES
        LEFT JOIN KEYVIEW_ACTIVITIES2 K ON (R.RIG = K.RIG)
        LEFT JOIN RIG_UP_DOWN D on (K.JobNumber = D.JobNumber and K.RIG = D.Rig)
    ) z
    WHERE z.JobNumber IS NOT NULL
)
/* - - - - - - - - - - - - - - -  */
/* - - KPI SAFETY BONUS CTE's - - */
/* - - - - - - - - - - - - - - -  */
, EMP_DURATION_MONTH AS (
    /* DURATION PER RIG PER MONTH PER EMPLOYEE */
    SELECT
        EIN,
        RIG,
        YEAR(WORK_DATE) AS WORK_YEAR,
        FORMAT(WORK_DATE,'MMMM') AS WORK_MONTH,
        MONTH(WORK_DATE) AS MONTH_NO,
        SUM(DURATION) as DURATION
    FROM HESS_JOBS
    WHERE WORK_DATE IS NOT NULL
    GROUP BY EIN, RIG, YEAR(WORK_DATE), FORMAT(WORK_DATE, 'MMMM'), MONTH(WORK_DATE)
)

, MAX_MONTHLY_DURATION AS (
    /* FIND MAX DURATION BY EMPLOYEE */
    SELECT
        EIN,
        WORK_YEAR,
        WORK_MONTH,
        MONTH_NO,
        MAX(DURATION) AS DURATION
    FROM EMP_DURATION_MONTH
    GROUP BY EIN, WORK_YEAR, WORK_MONTH, MONTH_NO
   
)

, RIG_WORKED_MOST AS (
    /* USE THE MAX DURATION TO FIND THE RIG WORKED ON THE MOST DURING EACH MONTH */
    SELECT 
        D.WORK_YEAR,
        D.WORK_MONTH,
        D.MONTH_NO,
        D.EIN,
        E.RIG,
        D.DURATION  
    FROM MAX_MONTHLY_DURATION D
    LEFT JOIN EMP_DURATION_MONTH E ON (D.EIN = E.EIN AND D.WORK_YEAR = E.WORK_YEAR AND D.WORK_MONTH = E.WORK_MONTH AND D.DURATION = E.DURATION)
)

, ALL_RIGS_DAYS_WORKED AS (
    SELECT 
        YEAR(WORK_DATE) AS WORK_YEAR,
        FORMAT(WORK_DATE, 'MMMM') AS WORK_MONTH,
        MONTH(WORK_DATE) AS WORK_MONTH_NO,
        EIN,
        COUNT(DISTINCT WORK_DATE) AS DAYS_WORKED_ALL_RIGS
    FROM HESS_JOBS
    WHERE WORK_DATE IS NOT NULL 
    GROUP BY YEAR(WORK_DATE), FORMAT(WORK_DATE, 'MMMM'), MONTH(WORK_DATE), EIN
)
, DAILY_CREW_COUNT AS (
    /* CALCULATE THE NUMBER OF WORKERS PER JOB PER DAY PROVIDED THE WORKER IS ACTIVE WHEN THE REPORT IS RUN */
    SELECT DISTINCT 
        JobNumber,
        RIG,
        Well_Name,
        YEAR(JobEndTime) as JobEndYear,
        MONTH(JobEndTime) as JobEndMonth,
        CAST(WORK_DATE AS DATE) AS WORK_DATE,
        RIG_UP,
        RIG_DOWN,
        COUNT(DISTINCT EIN) as DAILY_CREW_COUNT
    FROM HESS_JOBS
    WHERE WORK_DATE is not null 
    GROUP BY JobNumber, RIG, Well_Name, YEAR(JobEndTime), MONTH(JobEndTime), WORK_DATE, RIG_UP, RIG_DOWN
)

/* Put it all together into a big flat table for reporting */
SELECT 
    H.RIG, 
    H.Rig_Type,
    H.JobNumber,
    H.Well_Name,
    H.EIN,
    E.LOCO_CODE,
    E.LOCO_NAME,
    E.YARD_CODE,
    E.YARD_NAME,
    E.HIRE_DATE,
    E.TERM_DATE,
    E.EMPLOYEE_STATUS,
    C.JobEndYear,
    FORMAT(H.JobEndTime, 'MMMM') AS JobEndMonth,
    C.JobEndMonth AS JobEndMonthNo,
    H.JobStartTime,
    H.JobEndTime,
    H.RIG_UP,
    H.RIG_DOWN,
    H.WORK_DATE,
    W.WORK_YEAR,
    FORMAT(H.WORK_DATE, 'MMMM') AS WORK_MONTH,
    W.WORK_MONTH_NO,
    W.DAYS_WORKED_ALL_RIGS,
    R.RIG AS RIG_WORKED_MOST,
    R.DURATION AS NAX_MONTHLY_DURATION,
    C.DAILY_CREW_COUNT
FROM HESS_JOBS H 
LEFT JOIN EMPLOYEES E ON (H.EIN = E.EIN)
LEFT JOIN ALL_RIGS_DAYS_WORKED  W ON (H.EIN = W.EIN AND YEAR(H.WORK_DATE) = W.WORK_YEAR AND MONTH(H.WORK_DATE) = W.WORK_MONTH_NO)
LEFT JOIN RIG_WORKED_MOST R ON (H.EIN = R.EIN AND YEAR(H.WORK_DATE) = R.WORK_YEAR AND MONTH(H.WORK_DATE) = R.MONTH_NO)
LEFT JOIN DAILY_CREW_COUNT C ON (R.RIG = C.RIG AND H.WORK_DATE = C.WORK_DATE)
WHERE H.WORK_DATE IS NOT NULL
;
GO

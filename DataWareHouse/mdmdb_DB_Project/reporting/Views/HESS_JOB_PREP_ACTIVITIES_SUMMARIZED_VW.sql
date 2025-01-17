CREATE VIEW [reporting].[HESS_JOB_PREP_ACTIVITIES_SUMMARIZED_VW] AS 

WITH ACTIVITIES AS (
    /* GATHER ALL HESS ACTIVITIES STARTING WITH JOBS ENDING IN 2024 */
    SELECT 
        FORMAT(CONVERT(INT,A.RIG),'0000000') AS RIG,
        A.YARD,
        A.JOBNUMBER,
        A.ACTIVITY_NUMBER,
        A.ACTIVITY_DESCRIPTION,
        A.JOBSTARTTIME,
        A.JOBENDTIME,
        A.ACTIVITYSTARTTIME,
        A.ACTIVITYENDTIME,
        A.DURATIONMINUTES
    FROM DBO.KEYVIEW_ACTIVITIES2 A  
    WHERE CUSTOMERORGUNIT LIKE '%Hess%' AND JOBENDTIME >= '2024-01-01'
)


, RUSU AS (
    /* ESTABLISH THE JOBSTARTTIME AND THE FIRST RIG UP SERVICE UNIT TIME */
    SELECT 
        RIG,
        JOBNUMBER,
        FORMAT(JOBSTARTTIME, 'MM-yyyy') AS JOBMONTH, -- JOB MONTH BASED ON THE MONTH THE JOB ENDS IN!!!!
        YEAR(JOBSTARTTIME)*100 + MONTH(JOBSTARTTIME) AS JOBMONTHORDER,
        JOBSTARTTIME,
        MIN(ACTIVITYSTARTTIME) OVER (PARTITION BY JOBNUMBER, JOBSTARTTIME) AS RUSU  -- ESTABLISH FIRST RU UP SERVICE UNIT
    FROM ACTIVITIES 
    WHERE Activity_Description = 'RUSU' 
)


, MONTHLYJOBS AS (
    /* COUNT HOW MANY JOBS A RIG HAD EACH MONTH */
    SELECT 
        RIG,
        JOBMONTH,
        COUNT(DISTINCT JOBNUMBER) AS MONTHLY_JOB_COUNT
    FROM RUSU
    GROUP BY RIG, JOBMONTH
)

, SUM_PREP_ACTIVITIES AS (
    /* COUNT THE NUMBER OF TIMES AN ACTIVITY HAPPENED EACH MONTH BY RIG AND SUMMARIZE THE DURATION IN MINUTES */
    SELECT 
        A.RIG,
        R.JOBMONTH,
        R.JOBMONTHORDER,
        ACTIVITY_DESCRIPTION,
        COUNT(ACTIVITY_DESCRIPTION) AS ACTIVITY_DESC_COUNT,
        SUM(DURATIONMINUTES) AS ACTIVITY_DUR_MIN
    FROM ACTIVITIES A 
    INNER JOIN RUSU R ON (A.JOBNUMBER = R.JOBNUMBER AND (A.ACTIVITYSTARTTIME >= R.JOBSTARTTIME AND A.ACTIVITYSTARTTIME < R.RUSU)) 
    GROUP BY A.RIG, R.JOBMONTH, R.JOBMONTHORDER, A.ACTIVITY_DESCRIPTION
)

, YARD AS (
    SELECT DISTINCT 
        RIG,
        RIGHT(YARD, LEN(YARD) - CHARINDEX('-', YARD)) AS YARD
    FROM ACTIVITIES
)

SELECT 
    S.*,
    Y.YARD,
    ACTIVITY_DUR_MIN / ACTIVITY_DESC_COUNT AS AVG_ACT_DUR_MIN
FROM SUM_PREP_ACTIVITIES S 
LEFT JOIN YARD Y ON (S.RIG = Y.RIG)

;
GO


CREATE VIEW [reporting].[HESS_JOB_CYCLE_TIME_VW] AS 


WITH ACTIVITIES AS (
    SELECT * FROM REPORTING.HESS_JOB_ACTIVITIES_VW
)

, EXCEPTIONS AS (
    /* NOTE: SUM ALL EXCEPTIONS (WAIT TIME) ASSOCIATED WITH THE HESS ACTIVITIES ABOVE */
    SELECT 
        E.ACTIVITY_NUMBER,
        COUNT(EXCEPTION_NUMBER) AS TOT_EXCEPTION_COUNT,
        SUM(DURATION) AS TOT_EXCEPTION_DURATION_MIN,
        SUM(DURATION) / 60 AS TOT_EXCEPTION_DURATION_HR
    FROM DBO.KEYVIEW_JOB_ACTIVITY_EXCEPTION E 
    INNER JOIN ACTIVITIES A ON (E.ACTIVITY_NUMBER = A.ACTIVITY_NUMBER)
    GROUP BY E.ACTIVITY_NUMBER
)

, DATASET AS (
    /* COMPOSE FINAL DATASET */
    /* NOTE: EXCEPTION_DURATIONMINUTES COMES FROM THE KEYVIEW ACTIVITIES2 TABLE AND NOT THE ACTUAL EXCEPTIONS TABLE */
    SELECT 
        A.*,
        CASE WHEN W.TOT_EXCEPTION_COUNT IS NULL THEN 0 ELSE W.TOT_EXCEPTION_COUNT END AS TOT_EXCEPTION_COUNT,
        CASE WHEN W.TOT_EXCEPTION_DURATION_MIN IS NULL THEN 0 ELSE W.TOT_EXCEPTION_DURATION_MIN END AS TOT_EXCEPTION_DURATION_MIN,
        CASE WHEN W.TOT_EXCEPTION_DURATION_HR IS NULL THEN 0 ELSE W.TOT_EXCEPTION_DURATION_HR END AS TOT_EXCEPTION_DURATION_HR,
        CASE WHEN W.TOT_EXCEPTION_DURATION_MIN IS NULL THEN A.DURATIONMINUTES ELSE A.DURATIONMINUTES - W.TOT_EXCEPTION_DURATION_MIN END AS DURATION_WO_DELAY_MIN,
        CASE WHEN W.TOT_EXCEPTION_DURATION_HR IS NULL THEN A.DURATIONHOURS ELSE A.DURATIONHOURS - W.TOT_EXCEPTION_DURATION_HR END AS DURATION_WO_DELAY_HR,
        CASE 
            WHEN (RUSU IS NULL) OR (RDSU IS NULL) THEN 0
            -- FIRST ACTIVITY IS NOT RUSU
            WHEN ACTIVITYSTARTTIME < RUSU THEN 0
            -- WHERE WE KNOW THE ACTIVITY IS BILLABLE
            WHEN ACTIVITYSTARTTIME >= RUSU AND ACTIVITYENDTIME <= RDSU 
                THEN 
                    CASE WHEN W.TOT_EXCEPTION_DURATION_MIN IS NULL 
                        THEN A.DURATIONMINUTES 
                        ELSE A.DURATIONMINUTES - W.TOT_EXCEPTION_DURATION_MIN
                        END 
            -- WHERE WE KNOW ACTIVITY IS NOT BILLABLE 
            WHEN ACTIVITYENDTIME > RDSU THEN 0 
            ELSE 0 END AS BILLABLE_DURATION_WO_NPT_MIN,
        CASE 
            WHEN (RUSU IS NULL) OR (RDSU IS NULL) THEN 0
            -- FIRST ACTIVITY IS NOT RUSUS
            WHEN ACTIVITYSTARTTIME < RUSU THEN 0
            -- WHERE WE KNOW THE ACTIVITY IS BILLABLE
            WHEN ACTIVITYSTARTTIME >= RUSU AND ACTIVITYENDTIME <= RDSU 
                THEN 
                    CASE WHEN W.TOT_EXCEPTION_DURATION_HR IS NULL
                    THEN A.DURATIONHOURS 
                    ELSE A.DURATIONHOURS - W.TOT_EXCEPTION_DURATION_HR
                    END
            -- WHERE WE KNOW ACTIVITY IS NOT BILLABLE 
            WHEN ACTIVITYENDTIME > RDSU THEN 0 
            ELSE 0 END AS BILLABLE_DURATION_WO_NPT_HR
    FROM ACTIVITIES A 
    LEFT JOIN EXCEPTIONS W ON (A.ACTIVITY_NUMBER = W.ACTIVITY_NUMBER)
)

SELECT * FROM DATASET   

;
GO


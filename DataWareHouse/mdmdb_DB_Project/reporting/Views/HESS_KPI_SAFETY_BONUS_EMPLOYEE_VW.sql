CREATE VIEW [reporting].[HESS_KPI_SAFETY_BONUS_EMPLOYEE_VW] AS 

/*****************

Business Rules/ Definitions:

1) Not all rigs qualify for a KPI Safety Bonus
2) If a rig qualifies for a bonus, 
    A. then the workers that spent the most time (duration) on that rig in the reporting month that are active at the time the report is generated get the bonus
    B. In the event of a tie between rigs, first use the higher daily payout
    C. In the event of a tie with the daily payout, use the rig with the higher number
3) Job Start: the time Key Energy starts the clock for the job (may or may not be on the same day as the Rig Up)
4) Rig Up: First Activity Start Time for the First Rig Up on a Job, Hess clock starts
5) Rig Down: Last Activity End Time for the Last Rig Down on a Job, Hess clock stops
6) Job End: the time Key Energy stops of the clock (may or may not be on the same day as a Rig Down)
5) Daily Crew Members: Number of workers on a Job in a Work Day
6) Duration should be a calculation of the Rig the worker worked on the most during the month
7) Term_Date: Termination Date
8) Hire_Date: Date of Hire
9) Rehire: the Term_Date < Hire_Date (but it is a good idea to keep the Term_Date if the Term_Date and Hire_Date are in the same month/ year)
  /* NOTE: ONLY MAY-2024 FORWARD BONUS INFORMATION IS LOADED INTO AZURE TABLE  AS OF 7/17/2024 */

*******************/
WITH EMPLOYEES AS (
    /* GET EMPLOYEE YARD INFORMATION */
    SELECT 
        E.EIN, -- NATIVE VARCHAR
        E.FIRST_NAME,
        E.LAST_NAME,
        E.ADUSER + '@keyenergy.com' AS EMAIL,
        E.JOB_CODE,
        E.JOB_FAMILY,
        E.HIRE_DATE,
        CASE 
            WHEN E.TERM_DATE < E.HIRE_DATE THEN 
                CASE WHEN (YEAR(E.TERM_DATE) = YEAR(E.HIRE_DATE) AND MONTH(E.TERM_DATE) = MONTH(E.HIRE_DATE)) THEN E.TERM_DATE -- WORKER REHIRED IN SAME MONTH - KEEP THE TERM DATE
                ELSE NULL END -- WORKER NOT REHIRED IN SAME MONTH TERM DATE DOES NOT MATTER
            ELSE E.TERM_DATE END AS TERM_DATE, -- WORKER NOT REHIRED
        E.LCO_CODE AS LOCO_CODE,
        L.LOCO_NAME,
        L.YARD_CODE,
        L.YARD_NAME,
        E.STATUS AS EMPLOYEE_STATUS
    FROM DBO.Employees E
    LEFT JOIN DBO.LOCO_HIERARCHY L ON (E.LCO_CODE = L.LOCO_CODE)
)

, HESS_RIGS AS (
    /* GET HESS RIGS FOR AN INNER JOIN */
    SELECT
        H.RIG,
        H.RIGTYPE AS RIG_TYPE,
        H.OPDATE,
        M.RIGTYPE AS EOMONTH_RIGTYPE
    FROM REPORTING.HESS_RIG_LIST_HIST H
    LEFT JOIN REPORTING.HESS_RIG_LIST_HIST M ON (H.RIG = M.RIG AND FORMAT(H.OPDATE, 'yyyy-MM') = FORMAT(M.OPDATE, 'yyyy-MM') AND M.OPDATE = EOMONTH(M.OPDATE))
)

, LABOR AS (
    /* GET LABOR INFORMATION FOR HESS JOBS */ 
    SELECT
        L.ASSET_NUMBER AS RIG, 
        L.WORK_DATE, 
        CASE 
            WHEN FORMAT(WORK_DATE, 'yyyy-MM') = '2024-04' THEN DATEADD(M,1,CONVERT(DATE, FORMAT(WORK_DATE, 'yyyy-MM-06'))) -- APRIL PAYOUT WAS RUN 5/6/24 
            WHEN FORMAT(WORK_DATE, 'yyyy-MM') = '2024-06' THEN DATEADD(M,1,CONVERT(DATE, FORMAT(WORK_DATE, 'yyyy-MM-16'))) -- JUNE PAYOUT WAS RUN 7/16/24
            ELSE DATEADD(M,1,CONVERT(DATE, FORMAT(WORK_DATE, 'yyyy-MM-07'))) END AS REPORT_PULL_DATE,
        L.EMPLOYEE_ID AS EIN,  -- NATIVE INT
        L.DURATION
    FROM DBO.LaborIncremental2 L
    INNER JOIN HESS_RIGS H ON (L.ASSET_NUMBER = H.RIG)
    WHERE CUSTOMER_ID = '000160' AND WORK_DATE >= '2023-05-31'
)


/* - - - - - - - - - - - - - - -  */
/* - - KPI SAFETY BONUS CTE's - - */
/* - - - - - - - - - - - - - - -  */
, EMP_DURATION_MONTH AS (
    /* DURATION PER RIG PER MONTH PER EMPLOYEE */
    SELECT
        EIN,
        RIG,
        EOMONTH(WORK_DATE) AS WORKMONTH,
        SUM(DURATION) AS DURATION,
        RANK() OVER (PARTITION BY EIN, EOMONTH(WORK_DATE) ORDER BY SUM(DURATION) DESC) AS DURATION_RANK
    FROM LABOR
    WHERE WORK_DATE IS NOT NULL
    GROUP BY EIN, RIG, EOMONTH(WORK_DATE)
)

, RIG_WORKED_MOST AS (
    SELECT 
    *
    FROM (
        SELECT
            EIN,
            RIG,
            WORKMONTH,
            DURATION,
            DENSE_RANK() OVER (PARTITION BY EIN, WORKMONTH ORDER BY EIN, WORKMONTH, DURATION DESC) AS DURATION_RANK 
        FROM EMP_DURATION_MONTH
    ) R 
    WHERE DURATION_RANK = 1 -- THIS WILL RETURN THE ACTUAL RIG WORKED THE MOST, BUT IN THE EVENT OF A TIE WE WILL ADD ADDITIONAL RANKINGS USING DAILYPAYOUT AND RIG NUMBER IF NECESSARY
)

, DAYS_WORKED_MONTH AS (
    SELECT 
        EIN,
        EOMONTH(WORK_DATE) AS WORKMONTH,
        REPORT_PULL_DATE,
        COUNT(DISTINCT WORK_DATE) AS DAYS_WORKED
    FROM LABOR
    GROUP BY EIN, EOMONTH(WORK_DATE), REPORT_PULL_DATE
)

, BONUS AS (
    /* CACLULATE THE MONTHLY BONUS FOR EACH MONTH/ RIG COMBINATION */ 
    /* NOTE: ONLY MAY-2024 FORWARD BONUS INFORMATION IS LOADED INTO AZURE TABLE  AS OF 7/17/2024 */
    SELECT 
        /* FIRST CONVERT MONTH-YEAR VARCHAR FIELD TO END OF MONTH DATE */
        EOMONTH(
            DATEFROMPARTS( -- END OF MONTH FUNCTION
            CONVERT(INT, RIGHT(MONTH,4)), -- YEAR
            CONVERT(INT, LEFT(MONTH,2)), -- MONTH
            '01') -- USE FIRST OF MONTH
            ) AS WORKMONTH,
        RIG,
        DAILYPAYOUT
    FROM DBO.HESS_SCORECARD
)

/* Put it all together into a big flat table for reporting */
, WORKER_BONUS AS(
    SELECT DISTINCT 
        J.EIN,
        E.FIRST_NAME,
        E.LAST_NAME,
        E.EMAIL,
        E.JOB_CODE,
        E.JOB_FAMILY,
        E.LOCO_CODE,
        E.LOCO_NAME,
        E.YARD_CODE,
        E.YARD_NAME,
        E.HIRE_DATE,
        E.TERM_DATE,
        FORMAT(D.WORKMONTH, 'MM-yyyy') AS WORKMONTH,
        D.REPORT_PULL_DATE,
        CASE WHEN (D.REPORT_PULL_DATE <= E.TERM_DATE) OR E.TERM_DATE IS NULL THEN 'Y' ELSE 'N' END AS INC_IN_BONUS, 
        E.EMPLOYEE_STATUS,
        J.RIG AS RIG_WORKED_MOST,
        R.EOMONTH_RIGTYPE AS RIG_TYPE,
        J.DURATION AS MAX_RIG_DURATION,
        D.DAYS_WORKED AS MONTHLY_DAYS_WORKED,
        B.DAILYPAYOUT,
        D.DAYS_WORKED * B.DAILYPAYOUT AS EE_BONUS,
        DURATION_RANK
    FROM RIG_WORKED_MOST J 
    LEFT JOIN EMPLOYEES E ON (J.EIN = E.EIN)
    LEFT JOIN DAYS_WORKED_MONTH D ON (J.EIN = D.EIN AND J.WORKMONTH = D.WORKMONTH)
    LEFT JOIN HESS_RIGS R ON (J.RIG = R.RIG AND D.WORKMONTH = EOMONTH(R.OPDATE))
    LEFT JOIN BONUS B ON (J.RIG = B.RIG AND D.WORKMONTH = B.WORKMONTH)
)

SELECT DISTINCT
    *,
    DENSE_RANK() OVER (PARTITION BY EIN, WORKMONTH ORDER BY EIN, WORKMONTH, DAILYPAYOUT DESC) AS PAYOUT_RANK,
    DENSE_RANK() OVER (PARTITION BY EIN, WORKMONTH ORDER BY EIN, WORKMONTH, CONVERT(INT, RIG_WORKED_MOST) DESC) AS RIG_NUM_RANK
FROM WORKER_BONUS 

;
GO


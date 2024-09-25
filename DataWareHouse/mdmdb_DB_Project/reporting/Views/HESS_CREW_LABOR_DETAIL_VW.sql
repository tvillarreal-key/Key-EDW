CREATE VIEW [reporting].[HESS_CREW_LABOR_DETAIL_VW] AS 
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

***** THIS REPORT ONLY PRODUCES THE CREW LABOR BY DAY/ RIG/ JOBNUMBER FOR HESS, IT IS SEPARATE FROM THE KPI BONUS BECAUSE THAT CODE PRODUCES THE KPI SUMMARY FOR BONUS PAYOUT ****

*******************/
WITH MDM_ASSETS AS (
    /* GET ASSET LOCO CODE */ 
    SELECT 
        ASSET_NUM AS RIG,
        LOCO_CODE AS ASSET_LCO
    FROM DBO.MDM_ASSETS
    WHERE ASSET_CLASS = 'Rig'
)

, HESS_RIGS AS (
    /* GET HESS RIGS FOR AN INNER JOIN */
    SELECT
        H.RIG,
        H.RIGTYPE,
        H.OPDATE
    FROM REPORTING.HESS_RIG_LIST_HIST H 
)

, EMPLOYEES AS (
    /* GET EMPLOYEE YARD INFORMATION */
    SELECT 
        E.EIN, -- NATIVE VARCHAR
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

, LABOR AS (
    /* GET LABOR INFORMATION FOR HESS JOBS */ 
    SELECT
        L.ASSET_NUMBER AS RIG, 
        CONVERT(DATE,L.WORK_DATE) AS WORK_DATE, 
        L.EMPLOYEE_ID AS EIN,  -- NATIVE INT
        FORMAT(L.DURATION, '0.0') AS DURATION
    FROM DBO.LaborIncremental2 L
    INNER JOIN HESS_RIGS H ON (L.ASSET_NUMBER = H.RIG)
    WHERE CUSTOMER_ID = '000160' 
)

/* Put it all together into a big flat table for reporting */
, CREW_LABOR AS(
    SELECT DISTINCT 
        L.EIN AS EMPLOYEE,
        E.JOB_CODE,
        E.JOB_FAMILY AS JOB_POSITION,
        E.LOCO_CODE AS EMPLOYEE_LCO,
        L.WORK_DATE,
        L.DURATION AS HOURS,
        E.HIRE_DATE,
        E.TERM_DATE,
        E.EMPLOYEE_STATUS,
        L.RIG,
        R.RIGTYPE,
        A.LOCO_CODE AS ASSET_LCO,
        '000160 - HESS CORP0' AS CUSTOMER_INFO
    FROM LABOR L 
    LEFT JOIN EMPLOYEES E ON (L.EIN = E.EIN)
    LEFT JOIN HESS_RIGS R ON (L.RIG = R.RIG AND L.WORK_DATE = R.OPDATE)
    LEFT JOIN DBO.MDM_ASSETS A ON (L.RIG = A.ASSET_NUM)
)

SELECT 
    *
FROM CREW_LABOR
;
GO


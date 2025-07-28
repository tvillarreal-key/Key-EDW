CREATE VIEW [reporting].[HESS_CYCLE_TIME_BONUS_EMPLOYEE_VW] AS 

/*****************

Business Rules/ Definitions:

1) Rig Up: First Activity Start Time for the First Rig Up on a Job
2) Rig Down: Last Activity End Time for the Last Rig Down on a Job
3) Cycle Time starts with the first Activity Start Time of the First Rig Up Service Unit not the Job Start Time (Jobs ofter start before the Rig Up)
4) Cycle Time ends with the last Activity End Time of the last Rig Down Service Unit not the Job End Time (jobs often end on different days than Rig Down)
5) Daily Crew Members: Number of workers on a Job in a Work Day
6) Worked Days: Number of Days Worker worked on job
7) Term_Date: Termination Date
8) Hire_Date: Date of Hire
9) Rehire: the Term_Date < Hire_Date (but it is a good idea to keep the Term_Date if the Term_Date and Hire_Date are in the same month/ year)
10) In order to avoid misleading historical reports, this report will only look back 2 months to deal with Term Dates constantly changing
 -- identify swing rigs: 0010110 as of 9/30 will be service, 6016, 06063, 6001
 -- used Customer_Order_id field to determine original job number for association across swing jobs
*******************/
/* GET MAIN DATA TABLES */
WITH EMPLOYEES AS (
    /* GET EMPLOYEE YARD INFORMATION */
    SELECT 
        E.EIN, -- NATIVE VARCHAR
        E.FIRST_NAME,
        E.LAST_NAME,
        E.ADUSER+ '@keyenergy.com' AS EMAIL,
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
        ASSET_NUMBER AS RIG, 
        WORK_DATE, 
        EMPLOYEE_ID AS EIN  -- NATIVE INT
    FROM DBO.LaborIncremental2
    WHERE CUSTOMER_ID = '000160' AND WORK_DATE >= '2022-12-22'
)

, HESS_RIGS AS (
    /* GET HESS RIGS FOR AN INNER JOIN */
    SELECT
        RIG,
        RIGTYPE,
        RIGSUBTYPE,
        OPDATE
    FROM REPORTING.HESS_RIG_LIST_HIST
)

/* GET ALL RIG UP AND RIG DOWN INFORMATION FOR SPLITTING THE WORK DATES WHEN A RIG UP AND RIG DOWN HAPPEN IN SAME DAY */
, RIG_ACTIVITY AS (
    /* FIND ONLY RIG UP AND RIG DOWN SERVICE UNIT ACTIVITY AND TIMES/ DATE*/
    SELECT distinct
        A.JobNumber, 
        FORMAT(CAST(A.Rig AS NUMERIC), '0000000') AS RIG, 
        A.WELL_NAME,
        A.WELL_API_NUM,
        A.Activity_Description AS ACTIVITY,
        CASE 
            WHEN A.Activity_Description = 'RUSU' THEN A.ActivityStartTime
            WHEN A.Activity_Description = 'RDSU' THEN 
            /* when an activity cross dates, keyview ends it at midnight the following day, so it needs to be backed up :01 second */
            CASE
                WHEN FORMAT(A.ACTIVITYENDTIME, N'HH:mm:ss') = '00:00:00' AND A.ActivityEndTime = DATEADD(DAY, 1, EOMONTH(A.ACTIVITYENDTIME,-1))  THEN DATEADD(s, -1, A.ActivityEndTime)
                ELSE A.ActivityEndTime END 
            END AS ACTIVITY_TIME
    FROM DBO.KeyView_Activities2 A
    INNER JOIN HESS_RIGS H ON (FORMAT(CAST(A.RIG AS NUMERIC), '0000000') = H.RIG)  -- ONLY KEEP HESS RIGS
    where CustomerOrgUnit like '%Hess%' AND  (Activity_Description IN ('RUSU','RDSU'))
)

, RIG_UP AS (
    /* FIND FIRST RIG UP SERVICE UNIT */
    SELECT
        JobNumber,
        RIG,
        WELL_NAME,
        ACTIVITY,
        MIN(ACTIVITY_TIME) AS RIG_UP
    FROM RIG_ACTIVITY
    WHERE ACTIVITY = 'RUSU'
    GROUP BY JobNumber, RIG, WELL_NAME, ACTIVITY 
)

, RIG_DOWN AS (
    /* FIND LAST RIG DOWN SERVICE UNIT */
    SELECT
        JobNumber,
        RIG,
        WELL_NAME,
        ACTIVITY,
        MAX(ACTIVITY_TIME) as RIG_DOWN
    FROM RIG_ACTIVITY
    WHERE ACTIVITY = 'RDSU'
    GROUP BY JobNumber, RIG, WELL_NAME, ACTIVITY 
)

, RIG_UP_DOWN AS (
    /* COMBINE RIG UP AND RIG DOWN */
    SELECT  
        u.JobNumber,
        U.RIG,
        U.WELL_NAME,
        u.RIG_UP,
        d.RIG_DOWN
    FROM RIG_UP u
    LEFT JOIN RIG_DOWN d on (u.JobNumber = d.JobNumber and u.Rig = d.Rig)
    WHERE U.JOBNUMBER IS NOT NULL 
)

/* COMBINE LABOR WITH HESS RIG INFORMATION */
, HESS_JOBS AS ( 
    SELECT DISTINCT 
        CASE 
            WHEN D.JOBNUMBER = '511830' THEN '0036049'
            WHEN D.JOBNUMBER = '518971' THEN '0010106'
            ELSE D.RIG
            END AS RIG,
        CASE 
            WHEN D.JOBNUMBER = '518830' THEN '519180'
            WHEN D.JOBNUMBER = '518971' THEN '519116'
            ELSE D.JOBNUMBER END 
            AS JOBNUMBER,
        CASE
            WHEN D.JOBNUMBER = '518830' THEN 'SWING RIG'
            WHEN D.JOBNUMBER = '518971' THEN 'SWING RIG'
            ELSE '' END AS SWING_RIG,
        D.WELL_NAME,
        WELL_API_NUM,
        D.RIG_UP,
        D.RIG_DOWN,
        CAST(L.EIN AS VARCHAR) AS EIN,
        CASE 
            WHEN L.WORK_DATE >= CAST(D.RIG_UP AS DATE) AND L.WORK_DATE <= CAST(D.RIG_DOWN AS DATE) THEN L.WORK_DATE 
            ELSE NULL END AS WORK_DATE
    FROM RIG_UP_DOWN D 
    LEFT JOIN LABOR L ON (D.RIG = L.RIG AND CAST(D.RIG_UP AS DATE) <= L.WORK_DATE AND CAST(D.RIG_DOWN AS DATE) >= L.WORK_DATE) -- MATCH EIN TO THE CORRECT RIG BY WORK DATE
    LEFT JOIN RIG_ACTIVITY A ON (D.RIG = A.RIG AND D.JOBNUMBER = A.JOBNUMBER)
)

/* - - - - - - - - - - - - - - - - - -  */
/* - - CYCLE TIME CREW BONUS CTE's - -  */
/* - - - - - - - - - - - - - - - - - -  */
, WORKED_JOB_DAYS AS (
    SELECT DISTINCT 
        JobNumber,
        RIG,
        WELL_NAME, -- replace with well api number and count distinct work days by well api # 
        COUNT(DISTINCT WORK_DATE) AS RIG_WORKED_DAYS -- WORKED DAYS ARE ONLY RIG UP TO RIG DOWN
    FROM HESS_JOBS
    GROUP BY JobNumber, RIG, WELL_NAME 
)

, CT_BONUS AS (
    /* GET CREW CYCLE TIME BONUSES */
    SELECT
        /* CONVERT MONTH VARCHAR TO END OF MONTH DATE FORMAT */ 
        EOMONTH(
            DATEFROMPARTS( -- END OF MONTH FUNCTION
                CONVERT(INT, RIGHT(MONTH,4)), -- YEAR
                CONVERT(INT, LEFT(MONTH,2)), -- MONTH
                '01') -- USE FIRST OF MONTH
                ) AS WORKMONTH,
        JOBNUMBER,
        WELLNAME,
        RIG, 
        (VALUESHARETOKEY + VALUESHARETOCREW) * 0.20 AS CREW_BONUS -- CALCULATED THE CREW BONUS
    FROM DBO.HESS_CREWCYCLETIMEBONUS 
)
 /* THIS IS WHERE WE WILL NEED A CTE TO ADAPT SWING RIGS TO REGULAR RIGS SO CREW GET APPROPRIATE PAYOUTS FOR THE DAYS THEY WORK ON THE SWING RIGS */

, DATASET AS (
    SELECT DISTINCT
        H.EIN,
        E.FIRST_NAME,
        E.LAST_NAME,
        E.EMAIL,
        E.HIRE_DATE,
        E.TERM_DATE,
        E.EMPLOYEE_STATUS,
        E.LOCO_CODE,
        E.LOCO_NAME,
        E.YARD_CODE,
        E.YARD_NAME,
        H.JOBNUMBER,
        H.RIG,
        R.RIGTYPE,
        R.RIGSUBTYPE,
        H.WELL_NAME,
        H.RIG_UP,
        H.RIG_DOWN,
        H.WORK_DATE,
        H.SWING_RIG,
        W.RIG_WORKED_DAYS,
        B.CREW_BONUS,
        B.CREW_BONUS/ W.RIG_WORKED_DAYS AS DAILY_CREW_BONUS
    FROM HESS_JOBS H   -- THIS IS THE DRIVING TABLE
    LEFT JOIN WORKED_JOB_DAYS W ON (H.JobNumber = W.JobNumber AND H.RIG = W.RIG AND H.WELL_NAME = W.WELL_NAME)  -- THIS PROVIDES THE DAYS THE RIG WAS WORKING
    LEFT JOIN EMPLOYEES E ON (H.EIN = E.EIN)
    LEFT JOIN HESS_RIGS R on (H.RIG = R.Rig AND CONVERT(DATE,H.RIG_DOWN) = R.OPDATE)
    LEFT JOIN CT_BONUS B ON (H.JOBNUMBER = B.JOBNUMBER)
    WHERE H.EIN IS NOT NULL 
)

SELECT * FROM DATASET
GO


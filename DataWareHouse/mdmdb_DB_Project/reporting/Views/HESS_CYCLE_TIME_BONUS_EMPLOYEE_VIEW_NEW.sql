CREATE VIEW [reporting].[HESS_CYCLE_TIME_BONUS_EMPLOYEE_VIEW_NEW] AS 

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

*******************/
/* GET MAIN DATA TABLES */
WITH  LABOR AS (
    /* GET LABOR INFORMATION FOR HESS JOBS */ 
    SELECT
        ASSET_NUMBER AS RIG, 
        WORK_DATE, 
        EMPLOYEE_ID AS EIN  -- NATIVE INT
    FROM DBO.LaborIncremental2
    WHERE CUSTOMER_ID = '000160' AND WORK_DATE >= '2022-12-22'
)

, EMPLOYEES AS (
    /* GET EMPLOYEE YARD INFORMATION */
    SELECT 
        E.EIN, -- NATIVE VARCHAR
        E.JOB_CODE,
        E.JOB_FAMILY,
        E.HIRE_DATE,
        CASE 
            WHEN E.TERM_DATE < E.HIRE_DATE THEN -- THIS INDICATES THAT THE EMPLOYEE IS CURRENTLY WORKING FOR KEY ENERGY
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

, ACTIVITIES AS (
    /* GET ALL ACTIVITIES */
    SELECT 
        JOBNUMBER,
        FORMAT(CONVERT(INT, RIG), '0000000') AS RIG ,
        WELL_NAME,
        JOBSTARTTIME,
        CASE 
            WHEN CONVERT(TIME,JOBENDTIME) = '00:00:00'
            THEN DATEADD(S,-1,JOBENDTIME)
            ELSE JOBENDTIME 
            END AS JOBENDTIME, -- JOB ENDINGS THAT LEAK INTO NEXT DAY, ROLL BACK :01 SECONDS
        ACTIVITYSTARTTIME,
        CASE 
            WHEN CONVERT(TIME,ACTIVITYENDTIME) = '00:00:00' 
            THEN DATEADD(S,-1,ACTIVITYENDTIME) 
            ELSE ACTIVITYENDTIME 
            END AS ACTIVITYENDTIME, -- ACTIVITIES LEAK TO NEXT DAY, ROLL BACK :01 SECOND
        ACTIVITY_DESCRIPTION
    FROM DBO.KEYVIEW_ACTIVITIES2 
    WHERE CUSTOMERORGUNIT LIKE '%Hess%' 
        AND ACTIVITY_DESCRIPTION IN ('RUSU','RDSU') 
        AND CONVERT(DATE, JOBENDTIME) >= '2024-04-30' -- ONLY PULLING MAY FORWARD BASED ON WHEN THE AZURE BONUS TABLES WERE SET UP
)

, RIG_UP AS (
    /* FIND FIRST RIG UP SERVICE UNIT */
    SELECT
        JOBNUMBER,
        MIN(ACTIVITYSTARTTIME) AS RUSU
    FROM ACTIVITIES
    WHERE ACTIVITY_DESCRIPTION = 'RUSU'
    GROUP BY JOBNUMBER 
)

, RIG_DOWN AS (
    /* FIND LAST RIG DOWN SERVICE UNIT */
    SELECT
        JOBNUMBER,
        MAX(ACTIVITYENDTIME) as RDSU
    FROM ACTIVITIES
    WHERE ACTIVITY_DESCRIPTION = 'RDSU'
    GROUP BY JOBNUMBER 
)

, RIG_CYCLETIME AS (
    /* COMBINE RIG UP AND RIG DOWN */
    SELECT  
        A.JOBNUMBER,
        A.RIG,
        A.WELL_NAME,
        A.JOBSTARTTIME,
        A.JOBENDTIME,
        U.RUSU,
        D.RDSU,
        CASE -- SET THE REPORT PULL DATE FOR CONSISTENCY IT WILL BE ON THE 7TH OF EACH MONTH STARTING WITH THE JULY PAYOUT...
            WHEN FORMAT(D.RDSU, 'yyyy-MM') = '2024-05' THEN DATEADD(M,1,CONVERT(DATE, FORMAT(D.RDSU, 'yyyy-MM-11'))) -- MAY PAYOUT WAS RUN 6/11/24 
            WHEN FORMAT(D.RDSU, 'yyyy-MM') = '2024-06' THEN DATEADD(M,1,CONVERT(DATE, FORMAT(D.RDSU, 'yyyy-MM-16'))) -- JUNE PAYOUT WAS RUN 7/16/24
            ELSE DATEADD(M,1,CONVERT(DATE, FORMAT(D.RDSU, 'yyyy-MM-07'))) END AS REPORT_PULL_DATE
    FROM ACTIVITIES A 
    LEFT JOIN RIG_UP U ON (A.JOBNUMBER = U.JOBNUMBER)
    LEFT JOIN RIG_DOWN D ON (A.JOBNUMBER = D.JOBNUMBER)
    WHERE U.JOBNUMBER IS NOT NULL 
)

/* COMBINE LABOR WITH HESS RIG INFORMATION */
, HESS_JOBS AS ( 
    SELECT DISTINCT 
        C.RIG,
        C.JobNumber,
        C.Well_Name,
        C.RUSU,
        C.RDSU,
        CAST(L.EIN AS VARCHAR) AS EIN,
        E.JOB_CODE,
        E.EMPLOYEE_STATUS,
        E.LOCO_CODE,
        E.YARD_CODE,
        E.YARD_NAME,
        CASE 
            WHEN L.WORK_DATE >= CAST(C.RUSU AS DATE) AND L.WORK_DATE <= CAST(C.RDSU AS DATE) THEN L.WORK_DATE 
            ELSE NULL END AS WORK_DATE,
        C.REPORT_PULL_DATE,
        E.TERM_DATE,
        CASE -- FLAG TO DETERMINE IF EMPLOYEE QUALIFIES FOR THE CYCLE TIME BONUS PAYOUT
            WHEN (C.REPORT_PULL_DATE <= E.TERM_DATE) OR E.TERM_DATE IS NULL THEN 'Y' 
            ELSE 'N' END AS INC_EMPLOYEE_IN_BONUS
    FROM RIG_CYCLETIME C 
    LEFT JOIN LABOR L ON (C.RIG = L.RIG AND CAST(C.RUSU AS DATE) <= L.WORK_DATE AND CAST(C.RDSU AS DATE) >= L.WORK_DATE) -- MATCH EIN TO THE CORRECT RIG BY WORK DATE
    LEFT JOIN EMPLOYEES E ON (L.EIN = E.EIN) --COMBINE THE LABOR AND EMPLOYEE TABLES TO FLAG TERM'D EMPLOYEES THAT DON'T QUALIFY FOR THE BONUS
)

/* - - - - - - - - - - - - - - - - - -  */
/* - - CYCLE TIME CREW BONUS CTE's - -  */
/* - - - - - - - - - - - - - - - - - -  */
, WORKED_JOB_DAYS AS (
    SELECT DISTINCT 
        JOBNUMBER,
        COUNT(DISTINCT WORK_DATE) AS RIG_WORKED_DAYS -- WORKED DAYS ARE ONLY RIG UP TO RIG DOWN
    FROM HESS_JOBS
    GROUP BY JobNumber
)

, DAILY_CREW AS (
    SELECT 
        H.JOBNUMBER,
        H.WORK_DATE,
        W.RIG_WORKED_DAYS,
        COUNT(DISTINCT H.EIN) AS CREW_COUNT
    FROM HESS_JOBS H
    LEFT JOIN WORKED_JOB_DAYS W ON (H.JOBNUMBER = W.JOBNUMBER)
    WHERE WORK_DATE IS NOT NULL AND INC_EMPLOYEE_IN_BONUS = 'Y'
    GROUP BY H.JOBNUMBER, H.WORK_DATE, W.RIG_WORKED_DAYS
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
        FORMAT(CONVERT(INT,RIG),'0000000') AS RIG,
        RIGTYPE,
        CASE 
            WHEN RIGTYPE = 'Daylight' AND RIG IN (6098, 6008) THEN '5Day'
            WHEN RIGTYPE = 'Daylight' AND RIG NOT IN (6098, 6008) THEN '7Day'
            ELSE '24 Hr' END AS RIGSUBTYPE,
        (VALUESHARETOKEY + VALUESHARETOCREW) * 0.20 AS CREW_BONUS -- CALCULATED THE CREW BONUS
    FROM DBO.HESS_CREWCYCLETIMEBONUS 
  
)

, LOADED_BONUSES AS (
    /* DETERMINE IF BONUS INFORMATION HAS BEEN LOADED INTO AZURE FOR A WORK MONTH */
    SELECT DISTINCT 
        A.JOBNUMBER,
        Z.LAST_BONUS_DT
    FROM ( 
        SELECT
            MAX(WORKMONTH) AS LAST_BONUS_DT
        FROM CT_BONUS) Z 
    CROSS JOIN ACTIVITIES  A
    
)

, DAILY_BONUS AS (
    /* CALCULATE CREW DAILY AND WORKER DAILY BONUS AMOUNTS AND FILL IN OTHER DETAILS FOR THE REPORT */
    SELECT  
        H.JobNumber,
        H.RIG,
        B.RigType,
        B.RIGSUBTYPE,
        H.RUSU,
        H.RDSU,
        H.EIN,
        H.JOB_CODE,
        H.EMPLOYEE_STATUS,
        H.LOCO_CODE,
        H.YARD_CODE,
        H.YARD_NAME,
        EOMONTH(H.RDSU) AS EOM_RDSU,
        FORMAT(H.RDSU, 'MM-yyyy') AS RDSU_MONTH_TXT,
        H.REPORT_PULL_DATE,
        H.TERM_DATE,
        H.WORK_DATE,
        B.WORKMONTH,
        L.LAST_BONUS_DT,
        H.INC_EMPLOYEE_IN_BONUS,
        CASE -- CREATE A FLAG THAT DETERMINES WHAT JOBS SHOULD BE IN THE REPORT
            WHEN H.WORK_DATE > L.LAST_BONUS_DT THEN 'Y' -- BONUS INFORMATION IS NOT YET AVAILABLE FOR THE MONTH
            WHEN H.WORK_DATE <= L.LAST_BONUS_DT AND B.CREW_BONUS IS NOT NULL THEN 'Y' -- WE HAVE BONUS INFORMATION FOR THIS JOB AND IT SHOULD BE IN THE REPORT
            ELSE 'N' END AS INC_JOB_IN_REPORT,-- THESE ARE PAST JOBS THAT THE BONUS INFORMATION IS POSTED, BUT THERE IS NO BONUS
        B.CREW_BONUS,
        C.RIG_WORKED_DAYS,
        B.CREW_BONUS/C.RIG_WORKED_DAYS AS DAILY_CREW_BONUS,
        C.CREW_COUNT,
        (B.CREW_BONUS / C.RIG_WORKED_DAYS) / C.CREW_COUNT AS DAILY_WORKER_BONUS
        
    FROM HESS_JOBS H 
    LEFT JOIN EMPLOYEES E ON (H.EIN = E.EIN)
    LEFT JOIN CT_BONUS B ON (H.JobNumber = B.JobNumber)
    LEFT JOIN DAILY_CREW C ON (H.JobNumber = C.JobNumber AND H.WORK_DATE = C.WORK_DATE)
    LEFT JOIN LOADED_BONUSES L ON (H.JOBNUMBER = L.JOBNUMBER)
)

SELECT * FROM DAILY_BONUS
;
GO


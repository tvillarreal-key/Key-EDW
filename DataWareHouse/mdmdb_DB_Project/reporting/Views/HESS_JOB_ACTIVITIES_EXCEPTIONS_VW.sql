CREATE VIEW [reporting].[HESS_JOB_ACTIVITIES_EXCEPTIONS_VW] AS 

WITH ACTIVITIES AS (
    /* GET ALL HESS ACTIVITIES */
    SELECT
        JOBNUMBER,
        FORMAT(CONVERT(INT,Rig),'0000000') AS RIG,
        WELL_NAME,
        WORKINGDEPTH,
        WELLBORECONFIG,
        WORKTYPE,
        JOBTYPE,
        JOBSTARTTIME,
        CASE 
            WHEN CONVERT(TIME,JOBENDTIME) = '00:00:00' THEN DATEADD(S,-1,JOBENDTIME) -- JOB CROSS MIDNIGHT, NEED TO KEEP IT IN THE SAME DAY - THIS IS REALLY FOR JOBS ENDING LAST DAY OF MONTH
            ELSE JOBENDTIME END AS JOBENDTIME,
        CASE 
            WHEN CONVERT(TIME,JOBENDTIME) = '00:00:00' THEN FORMAT(DATEADD(S,-1,JOBENDTIME), 'MM-yyyy') -- JOB CROSS MIDNIGHT, NEED TO KEEP IT IN THE SAME DAY - THIS IS REALLY FOR JOBS ENDING LAST DAY OF MONTH
            ELSE FORMAT(JOBENDTIME, 'MM-yyyy') END AS JOBENDMONTH,
        CASE 
            WHEN CONVERT(TIME,JOBENDTIME) = '00:00:00' THEN EOMONTH(DATEADD(S,-1,JOBENDTIME)) -- JOB CROSS MIDNIGHT, NEED TO KEEP IT IN THE SAME DAY - THIS IS REALLY FOR JOBS ENDING LAST DAY OF MONTH
            ELSE EOMONTH(JOBENDTIME) END AS JOBENDMONTHORDER,
        CASE 
            WHEN CONVERT(TIME,JOBENDTIME) = '00:00:00' THEN CONVERT(DATE, DATEADD(S,-1,JOBENDTIME)) -- JOB CROSS MIDNIGHT, NEED TO KEEP IT IN THE SAME DAY - THIS IS REALLY FOR JOBS ENDING LAST DAY OF MONTH
            ELSE CONVERT(DATE, JOBENDTIME) END AS JOBENDDATE,
        ACTIVITY_NUMBER,
        ACTIVITY_ID,
        ACTIVITYDESCRIPTION,
        ACTIVITY_DESCRIPTION,
        ACTIVITYSTARTTIME,
        CASE 
            WHEN CONVERT(TIME,ACTIVITYENDTIME) = '00:00:00' THEN DATEADD(S,-1, ACTIVITYENDTIME) --ACTIVITY CROSSED MIDNIGHT, NEED TO KEEP IN SAME DAY
            ELSE ACTIVITYENDTIME END AS ACTIVITYENDTIME, 
        CASE 
            WHEN CONVERT(TIME,ACTIVITYENDTIME) = '00:00:00' THEN FORMAT(DATEADD(S,-1, ACTIVITYENDTIME), 'MM-yyyy') --ACTIVITY CROSSED MIDNIGHT, NEED TO KEEP IN SAME DAY
            ELSE FORMAT(ACTIVITYENDTIME, 'MM-yyyy') END  AS ACTIVITYENDMONTH,
        CASE 
            WHEN CONVERT(TIME,ACTIVITYENDTIME) = '00:00:00' THEN EOMONTH(DATEADD(S,-1, ACTIVITYENDTIME)) --ACTIVITY CROSSED MIDNIGHT, NEED TO KEEP IN SAME DAY
            ELSE EOMONTH(ACTIVITYENDTIME) END AS ACTIVITYENDMONTHORDER ,
        CASE 
            WHEN CONVERT(TIME,ACTIVITYENDTIME) = '00:00:00' THEN CONVERT(DATE,DATEADD(S,-1, ACTIVITYENDTIME)) --ACTIVITY CROSSED MIDNIGHT, NEED TO KEEP IN SAME DAY
            ELSE CONVERT(DATE, (ACTIVITYENDTIME)) END AS ACTIVITYENDDATE ,
        
        DURATIONMINUTES
        
    FROM DBO.KEYVIEW_ACTIVITIES2
    WHERE CUSTOMERORGUNIT LIKE '%Hess%' AND (CONVERT(DATE,JOBENDTIME) >= '2024-01-31' OR JOBENDTIME IS NULL)
)

/* CALCULATE THE FIRST RIG UP AND LAST RIG DOWN PER JOB */
, RIGUP AS (
    SELECT 
        JOBNUMBER,
        MIN(ACTIVITYSTARTTIME) AS RUSU
    FROM ACTIVITIES
    WHERE ACTIVITY_DESCRIPTION = 'RUSU'
    GROUP BY JOBNUMBER
)

, RIGDOWN AS (
    SELECT 
        JOBNUMBER,
        MAX(ACTIVITYENDTIME) AS RDSU
    FROM ACTIVITIES
    WHERE ACTIVITY_DESCRIPTION = 'RDSU'
    GROUP BY JOBNUMBER

)

, RIGLIST AS (
    /* GET THE HESS RIG LIST WITH THE RIGTYPES/ SUBTYPES BY OPERATION DATE */
    SELECT * FROM REPORTING.HESS_RIG_LIST_HIST 
)

, LAG_LEAD_ACTIVITIES AS (
    /* LAG LOOKS BACK AND LEAD LOOKS FORWARD, THIS ALLOWS US TO SEE IF A JOB IS MISISNG A RIG UP, OR IF A RIG UP AND RIG DOWN ARE IN THE WRONG ORDER */
    SELECT 
        JOBNUMBER,
        ACTIVITY_NUMBER,
        ACTIVITY_ID,
        ACTIVITYSTARTTIME,
        LAG(ACTIVITY_DESCRIPTION, 1) OVER (PARTITION BY JOBNUMBER ORDER BY ACTIVITYSTARTTIME) AS LAG_ACTIVITY,
        ACTIVITY_DESCRIPTION AS ACTIVITY,
        LEAD(ACTIVITY_DESCRIPTION, 1) OVER (PARTITION BY JOBNUMBER ORDER BY ACTIVITYSTARTTIME) AS LEAD_ACTIVITY
    FROM ACTIVITIES
    WHERE ACTIVITY_DESCRIPTION IN ('RUSU','RDSU', 'Road Rig')
)

, ACTIVITY_CHECKS AS (
    /* LOGIC FOR SUGGESTING POSSIBLE SUGGESTED CORRECTIONS WHERE WE THINK SOMETHING WAS MISLABELED IN KEYVIEW*/
    SELECT 
        A.*,
        CASE 
                -- Check if this is the first activity is Rig down followed by a Rig down, it is probably supposed to be a Rig up
                WHEN LAG_ACTIVITY IS NULL AND ACTIVITY = 'RDSU' AND  LEAD_ACTIVITY = 'RDSU' then 'RUSU' 
                -- Check if this is the first Rig down where there are multiple rig downs without a Rig Up between them, these are still billable hours
                WHEN LAG_ACTIVITY IS NOT NULL AND ACTIVITY = 'RDSU' AND LEAD_ACTIVITY = 'RDSU' THEN ACTIVITY + '-1'
                -- Check if there is a Rig down service unit without a rig up service unit or following a Road rig
                WHEN LAG_ACTIVITY = 'Road Rig' and ACTIVITY = 'RDSU' THEN 'RUSU'
                -- Check if this may be an error Road rig because it does not lead the activities or happens between a Rig up service unit and Rig down service unit
                WHEN ACTIVITY = 'Road Rig' and ACTIVITY_ERROR = 'possible error' then ACTIVITY + '-1'
                ELSE NULL END AS ACTIVITY_CORRECTION
    
    FROM (
        /* LOGIC FOR ERROR FLAGGING */
        SELECT
            JOBNUMBER,
            ACTIVITY_NUMBER,
            LAG_ACTIVITY,
            ACTIVITY,
            LEAD_ACTIVITY,
            CASE 
                WHEN LAG_ACTIVITY IS NULL AND ACTIVITY = 'RDSU' THEN 'possible error'
                WHEN LAG_ACTIVITY = 'RDSU' AND ACTIVITY = 'RUSU' AND LEAD_ACTIVITY = 'Road Rig' THEN 'possible error'
                WHEN LAG_ACTIVITY = 'Road rig' and ACTIVITY = 'RDSU' then 'possible error'
                WHEN LAG_ACTIVITY = 'RUSU' and ACTIVITY = 'Road Rig' and LEAD_ACTIVITY = 'RDSU' then 'possible error'
                WHEN LAG_ACTIVITY = 'RUSU' and ACTIVITY = 'Road Rig' then 'possible error'
                else NULL END AS ACTIVITY_ERROR
        FROM LAG_LEAD_ACTIVITIES) A
)

, RECOMBINE_TBL AS (
    /* ADDING THE STEP TO RECOMBINE WHAT WE HAVE SO FAR TO BREAK UP THE SQL FOR EASIER DEBUGGING AND FUTURE CHANGES */
    SELECT 
        A.JOBNUMBER,
        A.RIG,
        R.RIGTYPE,
        R.RIGSUBTYPE,
        A.WELL_NAME,
        A.WORKINGDEPTH,
        A.WELLBORECONFIG,
        A.WORKTYPE,
        A.JOBTYPE,
        A.JOBSTARTTIME,
        A.JOBENDTIME,
        U.RUSU,
        D.RDSU,
        CASE WHEN U.RUSU IS NULL THEN 'No Rig Up' ELSE 'Rig Up' END AS RIG_UP,
        A.ACTIVITY_NUMBER,
        A.ACTIVITY_ID,
        A.ACTIVITYSTARTTIME,
        A.ACTIVITYENDTIME, 
        A.ACTIVITYDESCRIPTION AS ACTIVITYDESCRIPTION_ORIGINAL,
        A.ACTIVITY_DESCRIPTION AS ACTIVITY_ABBR_ORIGINAL,
        C.ACTIVITY_CORRECTION,
       /* REVISED THE ACTIVITY DESC AND ABBR FIELDS USING LOGIC OF ROADRIG BEFORE RUSU AND AFTER RDSU, AND CORRECTIONS */
        CASE 
             /* IDENTIFIY THE ROAD RIGS - ANYTHING BEFORE THE FIRST RUSU */
            WHEN (A.ACTIVITYSTARTTIME < U.RUSU OR A.ACTIVITYENDTIME > RDSU) THEN 'Road rig'
            /* PULL IN ACTIVITY DESCRIPTION PROPOSED CORRECTIONS */
            WHEN C.ACTIVITY_CORRECTION = 'RUSU' THEN 'Rig up service unit' 
            WHEN C.ACTIVITY_CORRECTION = 'RDSU' THEN 'Rig down service unit'
            WHEN C.ACTIVITY_CORRECTION IS NOT NULL THEN C.ACTIVITY_CORRECTION
            ELSE A.ACTIVITYDESCRIPTION END AS ACTIVITYDESCRIPTION,
        CASE  
             /* IDENTIFIY THE ROAD RIGS - ANYTHING BEFORE THE FIRST RUSU */
            WHEN (A.ACTIVITYSTARTTIME < U.RUSU OR A.ACTIVITYENDTIME > RDSU) THEN 'Road rig'
            /* PULL IN ACTIVITY DESCRIPTION PROPOSED CORRECTIONS */
            WHEN C.ACTIVITY_CORRECTION IS NOT NULL THEN C.ACTIVITY_CORRECTION ELSE A.ACTIVITY_DESCRIPTION END AS ACTIVITY_ABBR,
        C.ACTIVITY_ERROR,
        A.DURATIONMINUTES,
        A.DURATIONMINUTES/60 AS DURATIONHOURS,
        A.JOBENDMONTH,
        A.JOBENDMONTHORDER,
        A.ACTIVITYENDDATE,
        A.ACTIVITYENDMONTH,
        A.ACTIVITYENDMONTHORDER 
    FROM ACTIVITIES A 
    LEFT JOIN RIGUP U ON (A.JOBNUMBER = U.JOBNUMBER)
    LEFT JOIN RIGDOWN D ON (A.JOBNUMBER = D.JOBNUMBER)
    LEFT JOIN ACTIVITY_CHECKS C ON (A.JOBNUMBER = C.JOBNUMBER AND A.ACTIVITY_NUMBER = C.ACTIVITY_NUMBER)
    LEFT JOIN RIGLIST R ON (A.RIG = R.RIG AND CONVERT(DATE,A.JOBENDTIME) = R.OPDATE)
)

, EXCEPTIONS AS (
    /* NOTE: GET EXCEPTIONS ASSOCIATED WITH THE HESS ACTIVITIES ABOVE */
    SELECT 
        E.ACTIVITY_NUMBER,
        EXCEPTION_NUMBER,
        START_TIME,
        CASE WHEN CONVERT(TIME,END_TIME) = '00:00:00' THEN DATEADD(S,-1,END_TIME) ELSE END_TIME END AS END_TIME,
        CASE WHEN CONVERT(TIME,END_TIME) = '00:00:00' THEN FORMAT(DATEADD(S,-1,END_TIME),'07-2024') ELSE FORMAT(END_TIME,'07-2024') END AS END_MONTH,
        EXCEPTION_TYPE,
        DURATION AS EXCEPTION_DURATION_MIN,
        CASE WHEN EXCEPTION_TYPE = 'Exception: wait' THEN DURATION ELSE 0 END AS EXCEPT_WAIT_DUR,
        CASE WHEN VARIANCE_DESC_01 IS NULL THEN 'Unspecified' ELSE VARIANCE_DESC_01 END AS WAIT_CATEGORY,
        CASE WHEN VARIANCE_DESC_02 IS NULL THEN 'Unspecified' ELSE VARIANCE_DESC_02 END AS RESP_EQUIP_OR_SVC,
        CASE WHEN VARIANCE_DESC_03 IS NULL THEN 'Unspecified' ELSE VARIANCE_DESC_03 END AS VENDOR,
        CASE WHEN VARIANCE_DESC_04 IS NULL THEN 'Unspecified' ELSE VARIANCE_DESC_04 END AS WAIT_REASON,
        CASE WHEN VARIANCE_DESC_05 IS NULL THEN 'Unspecified' ELSE VARIANCE_DESC_05 END AS ROOT_CAUSE,
        CASE 
            WHEN UPPER(VARIANCE_DESC_01) = 'RIG' AND UPPER(VARIANCE_DESC_04) = 'UNSCHEDULED' THEN 'KV NPT/ Hess NPT'
            WHEN UPPER(ACTIVITYDESCRIPTION) LIKE '%STANDBY%' AND UPPER(VARIANCE_DESC_01) = 'WEATHER' AND UPPER(VARIANCE_DESC_05) = 'UNPLANNED' THEN 'LPT'
            WHEN UPPER(EXCEPTION_TYPE) LIKE '%WAIT%' THEN 'KV NPT'
            ELSE 'NO NPT' END AS NPT_TYPE
    FROM DBO.KEYVIEW_JOB_ACTIVITY_EXCEPTION E 
    INNER JOIN ACTIVITIES A ON (E.ACTIVITY_NUMBER = A.ACTIVITY_NUMBER)
    WHERE END_TIME > '2024-01-01 00:00:00'
)

, DATASET AS (
    /* COMPOSE FINAL DATASET */
    /* NOTE: EXCEPTION_DURATIONMINUTES COMES FROM THE KEYVIEW ACTIVITIES2 TABLE AND NOT THE ACTUAL EXCEPTIONS TABLE */
    SELECT 
        A.*,
        E.EXCEPTION_NUMBER,
        E.START_TIME AS EXCEPT_START_TIME,
        E.END_TIME AS EXCEPT_END_TIME,
        E.END_MONTH AS EXCEPT_END_MONTH,
        E.EXCEPTION_TYPE,
        CASE WHEN E.EXCEPTION_DURATION_MIN IS NULL THEN 0 ELSE E.EXCEPTION_DURATION_MIN END AS EXCEPT_DURATION_MIN,
        CASE WHEN E.EXCEPTION_DURATION_MIN IS NULL THEN 0 ELSE E.EXCEPTION_DURATION_MIN/60 END AS EXCEPT_DURATION_HR,
        E.EXCEPT_WAIT_DUR,
        CASE 
            WHEN E.EXCEPT_WAIT_DUR IS NULL THEN A.DURATIONMINUTES 
            WHEN E.EXCEPT_WAIT_DUR IS NOT NULL THEN A.DURATIONMINUTES - E.EXCEPT_WAIT_DUR
            ELSE 0 END AS DURATION_WO_DELAY_MIN,
        CASE 
            WHEN E.EXCEPT_WAIT_DUR IS NULL THEN A.DURATIONMINUTES / 60
            WHEN E.EXCEPT_WAIT_DUR IS NOT NULL THEN (A.DURATIONMINUTES - E.EXCEPT_WAIT_DUR) / 60 
            ELSE 0 END AS DURATION_WO_DELAY_HR,
        E.WAIT_CATEGORY,
        E.WAIT_REASON,
        E.RESP_EQUIP_OR_SVC,
        E.VENDOR,
        E.ROOT_CAUSE,
        E.NPT_TYPE
    FROM RECOMBINE_TBL A 
    LEFT JOIN EXCEPTIONS E ON (A.ACTIVITY_NUMBER = E.ACTIVITY_NUMBER)
)


SELECT 
    *,
    ROW_NUMBER() OVER (PARTITION BY JOBNUMBER, ACTIVITY_NUMBER ORDER BY ACTIVITYENDTIME, EXCEPT_END_TIME) AS ROWNUMBER 
FROM DATASET   

;
GO

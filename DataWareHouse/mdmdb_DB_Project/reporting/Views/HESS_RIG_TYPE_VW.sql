CREATE VIEW [REPORTING].[HESS_RIG_TYPE_VW] AS
/* START CODE BLOCK */
WITH BASE_RIGS AS (
    SELECT
        FORMAT(RIG, '0000000') AS RIG, 
        Rig_Type,
        AS_OF_DATE AS STARTDATE,
        LEAD(1) OVER (PARTITION BY RIG, As_Of_Date ORDER BY RIG, As_Of_Date) AS ENDDATE, -- THIS WILL SHOW IF THERE ARE MULTIPLE LISTINGS FOR THE SAME RIG AND USE THE NEXT START DATE AS AN END DATE
        ROW_NUMBER() OVER (PARTITION BY RIG, AS_OF_DATE ORDER BY RIG, AS_OF_DATE) AS ROWNUM -- THIS TELLS IF HOW MANY TIMES A RIG IS LISTED (IF IT CHANGED TYPES)
    FROM REPORTING.Hess_Rig_List
)

SELECT 
    RIG ,
    RIG_TYPE,
    CASE 
        WHEN ROWNUM = 1 THEN CONVERT(DATETIME, '2024-01-01') ELSE CAST(STARTDATE AS DATETIME) END AS STARTTIME,
    CASE WHEN ENDDATE IS NULL THEN GETDATE() ELSE CAST(ENDDATE AS DATETIME) END AS ENDTIME,
    M.W_STATUS AS WORKING_STATUS,
    M.LOCO_CODE,
    M.LOCO_NAME,
    M.MKTP_CODE,
    M.MKTP_NAME,
    M.YARD_CODE,
    M.YARD_NAME
FROM BASE_RIGS H
LEFT JOIN DBO.MDM_ASSETS M ON (H.RIG = M.ASSET_NUM)
;
GO


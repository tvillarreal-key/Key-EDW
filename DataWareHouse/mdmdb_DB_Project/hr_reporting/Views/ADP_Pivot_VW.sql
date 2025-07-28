CREATE VIEW [hr_reporting].[ADP_Pivot_VW] AS 

/* CREATING A DATASET FOR HE TO EXPLORE EMPLOYEE DATA */
/* SET UP A FILTER TO REMOVE PEOPLE WHO TERM'D BEFORE 2023 */
/* -----------------------------------  CODE BASE ---------------------------------------- */
WITH  __DATA__ AS (
    /* GET INITIAL DATA FROM MDMDB ADP_TRANSACTIONS */
    SELECT DISTINCT 
        EMPLOYEEID AS EIN,
        ORGINALDATEOFHIRE AS ORIG_HIRE_DT,
        MAX(LASTDATEOFHIRE) OVER (PARTITION BY EMPLOYEEID) AS MAX_LAST_DT_HIRE,
        CASE 
            WHEN [ACTION] = 'TER' THEN EFFECTIVEDATE ELSE NULL END AS TERM_DT
    FROM DBO.ADP_TRANSACTIONS 
)

, __FILTER__ AS (
    /* CREATE A FILTER */
    SELECT 
        E.EIN
    FROM (    
        SELECT DISTINCT 
            EIN,
            MAX_LAST_DT_HIRE,
            MAX(TERM_DT) OVER (PARTITION BY EIN) AS MAX_TERM_DT 
        FROM __DATA__
    ) E 
    WHERE E.MAX_LAST_DT_HIRE > E.MAX_TERM_DT OR E.MAX_TERM_DT IS NULL 
)

/* START THE PIVOTS ON THE ACTIONS AND REASONCODES ASSOCIATED WITH THEM */
, __ACTION_PVT__ AS (
/* PIVOT THE ACTION COLUMN AND COUNT THE VALUES */
    SELECT 
        EIN, 
        [PRO] AS ACTION_PRO, 
        [PJC] AS ACTION_PJC, 
        [DEM] AS ACTION_DEM, 
        [MGR] AS ACTION_MGR, 
        [JRC] AS ACTION__JRC, 
        [HIR] AS ACTION_HIR, 
        [DTA] AS ACTION_DTA, 
        [LOA] AS ACTION_LOA, 
        [RFL] AS ACTION_RFL, 
        [TER] AS ACTION_TER, 
        [POS] AS ACTION_POS, 
        [XFR] AS ACTION_XFR, 
        [PAY] AS ACTION_PAY, 
        [REH] AS ACTION_REH
    FROM (
        SELECT 
            E.EIN,
            A.ACTION
        FROM __FILTER__ E
        LEFT JOIN DBO.ADP_TRANSACTIONS A ON (E.EIN = A.EMPLOYEEID)
    ) AS SOURCETABLE
    PIVOT
    (
        COUNT(ACTION)
        FOR ACTION IN ( [PRO], [PJC], [DEM], [MGR], [JRC], [HIR], [DTA], [LOA], [RFL], [TER], [POS], [XFR], [PAY], [REH])
    ) AS PVT 
)


/* PIVOT THE REASONCODE COLUMN AND COUNT THE VALUES */
, __ACTION_REASONCODE_PVT__ AS (
    SELECT 
        EIN, 
        DEM_BUS,
        DEM_USP,
        DEM_VOL,
        DTA_,
        DTA_DBL,
        DTA_FNT,
        DTA_MAS,
        DTA_MRG,
        DTA_RGR,
        DTA_STC,
        DTA_UPD,
        HIR_,
        HIR_ACQ,
        HIR_NPS,
        HIR_RPL,
        JRC_,
        LOA_,
        LOA_FAM,
        LOA_FCF,
        LOA_FMA,
        LOA_FML,
        LOA_FPD,
        LOA_LOA,
        LOA_MAT,
        LOA_MCL,
        LOA_MIL,
        LOA_NMP,
        LOA_PDL,
        LOA_PLA,
        LOA_PLM,
        LOA_PLN,
        LOA_TFL,
        LOA_WCF,
        LOA_WCL,
        LOA_WCP,
        MGR_MCM,
        MGR_MOR,
        MGR_MRR,
        PAY_ADJ,
        PAY_COL,
        PAY_CPR,
        PAY_FUR,
        PAY_HSI,
        PAY_MAD,
        PAY_MAT,
        PAY_MCO,
        PAY_MER,
        PAY_MKT,
        PAY_MOT,
        PAY_MWD,
        PAY_RET,
        PAY_UFR,
        PAY_XFR,
        PJC_CRJ,
        PJC_JRC,
        PJC_REO,
        PJC_STA,
        PJC_UPD,
        PJC_XFR,
        POS_,
        POS_FAM,
        POS_LDN,
        POS_LDW,
        POS_LDY,
        POS_RLD,
        POS_STA,
        POS_TTL,
        PRO_,
        PRO_NCP,
        PRO_PRO,
        REH_,
        REH_REH,
        REH_RER,
        RFL_,
        RFL_RFL,
        TER_ANW,
        TER_AOD,
        TER_AOE,
        TER_AOS,
        TER_ATT,
        TER_AWO,
        TER_CNF,
        TER_CON,
        TER_COR,
        TER_DBL,
        TER_DEA,
        TER_DIV,
        TER_EAC,
        TER_ELI,
        TER_FDT,
        TER_INS,
        TER_JOB,
        TER_LCF,
        TER_LVE,
        TER_NAW,
        TER_NEU,
        TER_NRG,
        TER_OBC,
        TER_ODT,
        TER_ORS,
        TER_PER,
        TER_PRF,
        TER_QLT,
        TER_QPR,
        TER_QRG,
        TER_RET,
        TER_RIF,
        TER_RLA,
        TER_RTI,
        TER_RTS,
        TER_SDI,
        TER_TMP,
        TER_UJR,
        TER_UPF,
        TER_VCP,
        XFR_,
        XFR_CHG,
        XFR_JCH,
        XFR_LOC,
        XFR_MOR,
        XFR_MRG,
        XFR_NHR,
        XFR_ORG,
        XFR_SUP
    FROM (
         SELECT 
            E.EIN,
            CONCAT(A.ACTION,'_',A.REASONCODE) AS ACT_REASON
        FROM __FILTER__ E 
         LEFT JOIN DBO.ADP_TRANSACTIONS A ON (E.EIN = A.EMPLOYEEID)
    ) AS SOURCETABLE
    PIVOT
    (
        COUNT(ACT_REASON)
        FOR ACT_REASON IN (DEM_BUS,DEM_USP,DEM_VOL,DTA_,DTA_DBL,DTA_FNT,DTA_MAS,DTA_MRG,DTA_RGR,
                            DTA_STC,DTA_UPD,HIR_,HIR_ACQ,HIR_NPS,HIR_RPL,JRC_,LOA_,LOA_FAM,LOA_FCF,
                            LOA_FMA,LOA_FML,LOA_FPD,LOA_LOA,LOA_MAT,LOA_MCL,LOA_MIL,LOA_NMP,LOA_PDL,
                            LOA_PLA,LOA_PLM,LOA_PLN,LOA_TFL,LOA_WCF,LOA_WCL,LOA_WCP,MGR_MCM,MGR_MOR,
                            MGR_MRR,PAY_ADJ,PAY_COL,PAY_CPR,PAY_FUR,PAY_HSI,PAY_MAD,PAY_MAT,PAY_MCO,
                            PAY_MER,PAY_MKT,PAY_MOT,PAY_MWD,PAY_RET,PAY_UFR,PAY_XFR,PJC_CRJ,PJC_JRC,
                            PJC_REO,PJC_STA,PJC_UPD,PJC_XFR,POS_,POS_FAM,POS_LDN,POS_LDW,POS_LDY,POS_RLD,
                            POS_STA,POS_TTL,PRO_,PRO_NCP,PRO_PRO,REH_,REH_REH,REH_RER,RFL_,RFL_RFL,TER_ANW,
                            TER_AOD,TER_AOE,TER_AOS,TER_ATT,TER_AWO,TER_CNF,TER_CON,TER_COR,TER_DBL,TER_DEA,
                            TER_DIV,TER_EAC,TER_ELI,TER_FDT,TER_INS,TER_JOB,TER_LCF,TER_LVE,TER_NAW,TER_NEU,TER_NRG,
                            TER_OBC,TER_ODT,TER_ORS,TER_PER,TER_PRF,TER_QLT,TER_QPR,TER_QRG,TER_RET,TER_RIF,TER_RLA,
                            TER_RTI,TER_RTS,TER_SDI,TER_TMP,TER_UJR,TER_UPF,TER_VCP,XFR_,XFR_CHG,XFR_JCH,XFR_LOC,
                            XFR_MOR,XFR_MRG,XFR_NHR,XFR_ORG,XFR_SUP
        )  
    ) PVT 
)

/* COUNT DISTINCT VALUES IN FEATURES WHERE THE VALUE ISN'T AS IMPORTANT AS JUST HOW MANY TIMES IT CHANGED */
, __COUNTS__ AS (
    SELECT 
        E.EIN,
        --COUNT(DISTINCT LOCATIONCODE) AS LOCATION_COUNT, -- THIS IS THE COST LOCATION
        COUNT(DISTINCT A.WORKLOCATION) AS WORKLOCATION_COUNT, -- THIS IS THE PHYSICAL LOCATION
        COUNT(DISTINCT A.JOBTITLE) AS JOBTITLE_COUNT,
        COUNT(DISTINCT A.LASTDATEOFHIRE) AS HIRED_COUNT,
        COUNT(DISTINCT A.REPORTSTOMANGERID) AS MANAGERS,
        COUNT(DISTINCT A.DEPT_DISTRICTID) AS DEPARTMENTS
    FROM __FILTER__ E 
    LEFT JOIN DBO.ADP_TRANSACTIONS A ON (E.EIN = A.EMPLOYEEID)
    GROUP BY EIN
    
)


, __DATASET__ AS (
    SELECT 
        C.EIN,
        C.WORKLOCATION_COUNT,
        C.JOBTITLE_COUNT,
        C.HIRED_COUNT,
        C.MANAGERS,
        C.DEPARTMENTS,
        /* ACTIONS AND REASONS */
        
        /* DEM */ 
        A.ACTION_DEM, 
        R.DEM_BUS,
        R.DEM_USP,
        R.DEM_VOL,
        /* DTA */ 
        A.ACTION_DTA,
        R.DTA_,
        R.DTA_DBL,
        R.DTA_FNT,
        R.DTA_MAS,
        R.DTA_MRG,
        R.DTA_RGR,
        R.DTA_STC,
        R.DTA_UPD,
        /* HIR */ 
        A.ACTION_HIR, 
        R.HIR_,
        R.HIR_ACQ,
        R.HIR_NPS,
        R.HIR_RPL,
        /* JRC */
        A.ACTION__JRC, 
        R.JRC_,
        /* LOA */
        A.ACTION_LOA, 
        R.LOA_,
        R.LOA_FAM,
        R.LOA_FCF,
        R.LOA_FMA,
        R.LOA_FML,
        R.LOA_FPD,
        R.LOA_LOA,
        R.LOA_MAT,
        R.LOA_MCL,
        R.LOA_MIL,
        R.LOA_NMP,
        R.LOA_PDL,
        R.LOA_PLA,
        R.LOA_PLM,
        R.LOA_PLN,
        R.LOA_TFL,
        R.LOA_WCF,
        R.LOA_WCL,
        R.LOA_WCP,
        /* MGR */
        A.ACTION_MGR, 
        R.MGR_MCM,
        R.MGR_MOR,
        R.MGR_MRR,
        /* PAY */
        A.ACTION_PAY, 
        R.PAY_ADJ,
        R.PAY_COL,
        R.PAY_CPR,
        R.PAY_FUR,
        R.PAY_HSI,
        R.PAY_MAD,
        R.PAY_MAT,
        R.PAY_MCO,
        R.PAY_MER,
        R.PAY_MKT,
        R.PAY_MOT,
        R.PAY_MWD,
        R.PAY_RET,
        R.PAY_UFR,
        R.PAY_XFR,
        /* PJC */
        A.ACTION_PJC, 
        R.PJC_CRJ,
        R.PJC_JRC,
        R.PJC_REO,
        R.PJC_STA,
        R.PJC_UPD,
        R.PJC_XFR,
        /* POS */
        A.ACTION_POS, 
        R.POS_,
        R.POS_FAM,
        R.POS_LDN,
        R.POS_LDW,
        R.POS_LDY,
        R.POS_RLD,
        R.POS_STA,
        R.POS_TTL,
        /* PRO */
        A.ACTION_PRO, 
        R.PRO_,
        R.PRO_NCP,
        R.PRO_PRO,
        /* REH */
        A.ACTION_REH,
        R.REH_,
        R.REH_REH,
        R.REH_RER,
        /* RFL */
        A.ACTION_RFL, 
        R.RFL_,
        R.RFL_RFL,
        /* TER */
        A.ACTION_TER, 
        R.TER_ANW,
        R.TER_AOD,
        R.TER_AOE,
        R.TER_AOS,
        R.TER_ATT,
        R.TER_AWO,
        R.TER_CNF,
        R.TER_CON,
        R.TER_COR,
        R.TER_DBL,
        R.TER_DEA,
        R.TER_DIV,
        R.TER_EAC,
        R.TER_ELI,
        R.TER_FDT,
        R.TER_INS,
        R.TER_JOB,
        R.TER_LCF,
        R.TER_LVE,
        R.TER_NAW,
        R.TER_NEU,
        R.TER_NRG,
        R.TER_OBC,
        R.TER_ODT,
        R.TER_ORS,
        R.TER_PER,
        R.TER_PRF,
        R.TER_QLT,
        R.TER_QPR,
        R.TER_QRG,
        R.TER_RET,
        R.TER_RIF,
        R.TER_RLA,
        R.TER_RTI,
        R.TER_RTS,
        R.TER_SDI,
        R.TER_TMP,
        R.TER_UJR,
        R.TER_UPF,
        R.TER_VCP,
        /* XFR */
        A.ACTION_XFR, 
        R.XFR_,
        R.XFR_CHG,
        R.XFR_JCH,
        R.XFR_LOC,
        R.XFR_MOR,
        R.XFR_MRG,
        R.XFR_NHR,
        R.XFR_ORG,
        R.XFR_SUP
    FROM __COUNTS__ C 
    LEFT JOIN __ACTION_PVT__ A ON (C.EIN = A.EIN)
    LEFT JOIN __ACTION_REASONCODE_PVT__ R ON (C.EIN = R.EIN)
) 

SELECT * FROM __DATASET__
GO


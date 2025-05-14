-- Create the stored procedure in the specified schema
CREATE PROCEDURE [dbo].[IScout_336404_Exception_Insert]
AS
BEGIN
    DECLARE @Report_Week NVARCHAR(256)
    DECLARE @result_tbl TABLE(REPORT_WEEK NVARCHAR(256), 
            EIN NVARCHAR(10), FIRST_NAME NVARCHAR(100), LAST_NAME NVARCHAR(100), LOB_CODE NVARCHAR(10), JOB_CODE NVARCHAR(10), JOB_FAMILY NVARCHAR(100),
            MP_CODE NVARCHAR(30), MP_NAME NVARCHAR(128), LCO_CODE NVARCHAR(30), LCO_NAME NVARCHAR(128))
    DECLARE CurName CURSOR FAST_FORWARD READ_ONLY
    FOR
        SELECT DISTINCT REPORT_WEEK
        FROM [dbo].[IScout_336404_Emps]

    OPEN CurName

    FETCH NEXT FROM CurName INTO @Report_Week

    WHILE @@FETCH_STATUS = 0
        BEGIN
            INSERT INTO @result_tbl
            SELECT @Report_Week as REPORT_WEEK, E.EIN, E.FIRST_NAME, E.LAST_NAME, E.LOB_CODE, E.JOB_CODE, E.JOB_FAMILY, E.MP_CODE, E.MP_NAME, E.LCO_CODE, E.LCO_NAME
            FROM [dbo].[Employees] E
            WHERE E.EIN NOT IN (select EIN
                            from [dbo].[IScout_336404_Emps]
                            where REPORT_WEEK=@Report_Week)                                                                    
            AND E.STATUS IN ('A','L')
            FETCH NEXT FROM CurName INTO @Report_Week
        END

    CLOSE CurName
    DEALLOCATE CurName
    
    -- SELECT * FROM @result_tbl ORDER BY FORM_ID, EIN

    TRUNCATE TABLE dbo.IScout_336404_Exceptions;

    INSERT INTO dbo.IScout_336404_Exceptions (REPORT_WEEK, EIN, FIRST_NAME, LAST_NAME, LOB_CODE, JOB_CODE, JOB_FAMILY, MP_CODE, MP_NAME, LCO_CODE, LCO_NAME)
    SELECT REPORT_WEEK, EIN, FIRST_NAME, LAST_NAME, LOB_CODE, JOB_CODE, JOB_FAMILY, MP_CODE, MP_NAME, LCO_CODE, LCO_NAME
    FROM @result_tbl;
END
GO


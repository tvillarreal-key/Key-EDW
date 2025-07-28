-- Create the stored procedure in the specified schema
CREATE PROCEDURE [dbo].[WSF_Exception_Insert]
AS
BEGIN
    DECLARE @Form_ID NVARCHAR(20), @Report_Name NVARCHAR(200)
    DECLARE @result_tbl TABLE(FORM_ID NVARCHAR(20), REPORT NVARCHAR(200), 
            EIN NVARCHAR(10), FIRST_NAME NVARCHAR(100), LAST_NAME NVARCHAR(100), LOB_CODE NVARCHAR(10), JOB_CODE NVARCHAR(10), JOB_FAMILY NVARCHAR(100),
            MP_CODE NVARCHAR(30), MP_NAME NVARCHAR(128), LCO_CODE NVARCHAR(30), LCO_NAME NVARCHAR(128))
    DECLARE CurName CURSOR FAST_FORWARD READ_ONLY
    FOR
        SELECT DISTINCT S97_form_id, S02_report
        FROM [dbo].[IScout_WSF]
        --WHERE S97_form_id IN ('204863')

    OPEN CurName

    FETCH NEXT FROM CurName INTO @Form_ID, @Report_Name

    WHILE @@FETCH_STATUS = 0
        BEGIN
            -- PRINT 'Start: ' + @Form_ID
            INSERT INTO @result_tbl
            SELECT @Form_ID as FORM_ID, @Report_Name as REPORT, E.EIN, E.FIRST_NAME, E.LAST_NAME, E.LOB_CODE, E.JOB_CODE, E.JOB_FAMILY, E.MP_CODE, E.MP_NAME, E.LCO_CODE, E.LCO_NAME
            FROM [dbo].[Employees] E
            WHERE E.EIN NOT IN (select CONCAT('1111', RIGHT(S32_name, 5))
                            from [dbo].[IScout_WSF]
                            where S97_form_id=@Form_ID) 
            AND E.EIN NOT IN (select CONCAT('1111', RIGHT(S35_name, 5))
                            from [dbo].[IScout_WSF]
                            where S97_form_id=@Form_ID)  
            AND E.EIN NOT IN (select CONCAT('1111', RIGHT(S38_name, 5))
                            from [dbo].[IScout_WSF]
                            where S97_form_id=@Form_ID)    
            AND E.EIN NOT IN (select CONCAT('1111', RIGHT(S41_name, 5))
                            from [dbo].[IScout_WSF]
                            where S97_form_id=@Form_ID)                       
            AND E.EIN NOT IN (select CONCAT('1111', RIGHT(S44_name, 5))
                            from [dbo].[IScout_WSF]
                            where S97_form_id=@Form_ID)                       
            AND E.EIN NOT IN (select CONCAT('1111', RIGHT(S47_name, 5))
                            from [dbo].[IScout_WSF]
                            where S97_form_id=@Form_ID)                   
            AND E.EIN NOT IN (select CONCAT('1111', RIGHT(S50_name, 5))
                            from [dbo].[IScout_WSF]
                            where S97_form_id=@Form_ID)                                                                         
            AND E.STATUS IN ('A','L')
            -- PRINT 'End: ' + @Form_ID
            FETCH NEXT FROM CurName INTO @Form_ID, @Report_Name
        END

    CLOSE CurName
    DEALLOCATE CurName
    
    -- SELECT * FROM @result_tbl ORDER BY FORM_ID, EIN

    TRUNCATE TABLE dbo.IScout_WSF_Exceptions;

    INSERT INTO dbo.IScout_WSF_Exceptions (FORM_ID, REPORT, EIN, FIRST_NAME, LAST_NAME, LOB_CODE, JOB_CODE, JOB_FAMILY, MP_CODE, MP_NAME, LCO_CODE, LCO_NAME)
    SELECT FORM_ID, REPORT, EIN, FIRST_NAME, LAST_NAME, LOB_CODE, JOB_CODE, JOB_FAMILY, MP_CODE, MP_NAME, LCO_CODE, LCO_NAME
    FROM @result_tbl;
END
GO


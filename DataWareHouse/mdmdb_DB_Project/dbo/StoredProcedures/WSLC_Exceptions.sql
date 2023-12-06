-- Create the stored procedure in the specified schema
CREATE PROCEDURE dbo.WSLC_Exceptions
AS
BEGIN
    DECLARE @Form_ID NVARCHAR(20), @Report_Name NVARCHAR(200)
    DECLARE @result_tbl TABLE(FORM_ID NVARCHAR(20), REPORT NVARCHAR(200), 
            EIN NVARCHAR(10), FIRST_NAME NVARCHAR(100), LAST_NAME NVARCHAR(100), LOB_CODE NVARCHAR(10), JOB_CODE NVARCHAR(10), JOB_FAMILY NVARCHAR(100),
            MP_CODE NVARCHAR(30), MP_NAME NVARCHAR(128), LCO_CODE NVARCHAR(30), LCO_NAME NVARCHAR(128))
    DECLARE CurName CURSOR FAST_FORWARD READ_ONLY
    FOR
        SELECT DISTINCT S97_form_id, S02_report
        FROM [dbo].[IScout_WSLC]
        --WHERE S97_form_id IN ('179552','180007')

    OPEN CurName

    FETCH NEXT FROM CurName INTO @Form_ID, @Report_Name

    WHILE @@FETCH_STATUS = 0
        BEGIN
            -- PRINT 'Start: ' + @Form_ID
            INSERT INTO @result_tbl
            SELECT @Form_ID as FORM_ID, @Report_Name as REPORT_NAME, E.EIN, E.FIRST_NAME, E.LAST_NAME, E.LOB_CODE, E.JOB_CODE, E.JOB_FAMILY, E.MP_CODE, E.MP_NAME, E.LCO_CODE, E.LCO_NAME
            FROM [dbo].[Employees] E
            WHERE E.EIN NOT IN (select CONCAT('1111', RIGHT(S42_name, 5))
                            from [dbo].[IScout_WSLC]
                            where S97_form_id=@Form_ID) 
            AND E.EIN NOT IN (select CONCAT('1111', RIGHT(S45_name, 5))
                            from [dbo].[IScout_WSLC]
                            where S97_form_id=@Form_ID)  
            AND E.EIN NOT IN (select CONCAT('1111', RIGHT(S48_name, 5))
                            from [dbo].[IScout_WSLC]
                            where S97_form_id=@Form_ID)    
            AND E.EIN NOT IN (select CONCAT('1111', RIGHT(S51_name, 5))
                            from [dbo].[IScout_WSLC]
                            where S97_form_id=@Form_ID)                       
            AND E.EIN NOT IN (select CONCAT('1111', RIGHT(S54_name, 5))
                            from [dbo].[IScout_WSLC]
                            where S97_form_id=@Form_ID)                       
            AND E.EIN NOT IN (select CONCAT('1111', RIGHT(S57_name, 5))
                            from [dbo].[IScout_WSLC]
                            where S97_form_id=@Form_ID)                   
            AND E.EIN NOT IN (select CONCAT('1111', RIGHT(S60_name, 5))
                            from [dbo].[IScout_WSLC]
                            where S97_form_id=@Form_ID)                                                                         
            AND E.STATUS IN ('A','L')
            -- PRINT 'End: ' + @Form_ID
            FETCH NEXT FROM CurName INTO @Form_ID, @Report_Name
        END

    CLOSE CurName
    DEALLOCATE CurName
    
    SELECT * FROM @result_tbl ORDER BY FORM_ID, EIN
END
GO


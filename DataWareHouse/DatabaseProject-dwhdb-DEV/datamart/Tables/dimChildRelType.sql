SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
DROP TABLE IF EXISTS [datamart].[dimDate] 
GO
CREATE TABLE datamart.dimDate (
    Dim_Date_Id int,
    Full_Date date,
    Date_Name varchar(11),
    Day_Of_Week tinyint,
    Day_Name_Of_Week varchar(10),
    Day_Of_Month tinyint,
    Day_Of_Year smallint,
    Weekday_Weekend varchar(7),
    Week_Of_Year tinyint,
    Month_Name varchar(10),
    Month_Of_Year tinyint,
    Is_Last_Day_Of_Month Bit,
    Calendar_Quarter tinyint,
    Calendar_Year smallint,
    Calendar_Year_Month varchar(7),
    Calendar_Year_Qtr varchar(6),
    Fiscal_Month_Of_Year tinyint,
    Fiscal_Quarter tinyint,
    Fiscal_Year int,
    Fiscal_Year_Month varchar(7),
    Fiscal_Year_Qtr varchar(6),
    LoadDate datetime,
CONSTRAINT [PK_dimDate] PRIMARY KEY NONCLUSTERED 
(
	[Dim_Date_Id] ASC
) ON [PRIMARY],
CONSTRAINT [UK_dimDate] UNIQUE NONCLUSTERED 
(
	[Full_Date] ASC
) ON [PRIMARY],
) ON [PRIMARY]
GO

DECLARE @date DATE = '2000-01-01';
DECLARE @date_id INT, @day INT, @month INT, @year INT, @day_of_week INT, @day_of_year INT, @week_of_year INT;
DECLARE @is_last_day_of_month BIT, @calendar_quarter INT, @fiscal_month_of_year INT, @fiscal_quarter INT, @fiscal_year INT;
DECLARE @date_name VARCHAR(11), @day_name_of_week VARCHAR(10), @weekday_weekend VARCHAR(7), @month_name VARCHAR(10);
DECLARE @calendar_year_month VARCHAR(7), @calendar_year_qtr VARCHAR(6), @fiscal_year_month VARCHAR(7), @fiscal_year_qtr VARCHAR(6);

WHILE @date <= '2040-12-31'
BEGIN
    SET @date_id = YEAR(@date) * 10000 + MONTH(@date) * 100 + DAY(@date);
    SET @day = DAY(@date);
    SET @month = MONTH(@date);
    SET @year = YEAR(@date);
    SET @day_of_week = DATEPART(WEEKDAY, @date);
    SET @day_of_year = DATEPART(DAYOFYEAR, @date);
    SET @week_of_year = DATEPART(WEEK, @date);
    SET @is_last_day_of_month = CASE WHEN DAY(DATEADD(DAY, 1, @date)) = 1 THEN 1 ELSE 0 END;
    SET @calendar_quarter = DATEPART(QUARTER, @date);
    SET @fiscal_month_of_year = MONTH(@date);
    SET @fiscal_quarter = DATEPART(QUARTER, @date);
    SET @fiscal_year = YEAR(@date);
    SET @date_name = FORMAT(@date, 'dd-MMM-yyyy');
    SET @day_name_of_week = DATENAME(WEEKDAY, @date);
    SET @weekday_weekend = CASE WHEN DATEPART(WEEKDAY, @date) IN (1, 7) THEN 'Weekend' ELSE 'Weekday' END;
    SET @month_name = DATENAME(MONTH, @date);
    SET @calendar_year_month = FORMAT(@date, 'yyyy-MM');
    SET @calendar_year_qtr = FORMAT(@date, 'yyyy-Q');
    SET @fiscal_year_month = FORMAT(@date, 'yyyy-MM');
    SET @fiscal_year_qtr = FORMAT(@date, 'yyyy-Q');

    INSERT INTO datamart.dimDate (
        DIM_DATE_ID,
        FULL_DATE,
        DATE_NAME,
        DAY_OF_WEEK,
        DAY_NAME_OF_WEEK,
        DAY_OF_MONTH,
        DAY_OF_YEAR,
        WEEKDAY_WEEKEND,
        WEEK_OF_YEAR,
        MONTH_NAME,
        MONTH_OF_YEAR,
        IS_LAST_DAY_OF_MONTH,
        CALENDAR_QUARTER,
        CALENDAR_YEAR,
        CALENDAR_YEAR_MONTH,
        CALENDAR_YEAR_QTR,
        FISCAL_MONTH_OF_YEAR,
        FISCAL_QUARTER,
        FISCAL_YEAR,
        FISCAL_YEAR_MONTH,
        FISCAL_YEAR_QTR,
        LOADDATE
    )
    VALUES (
        @date_id,
        @date,
        @date_name,
        @day_of_week,
        @day_name_of_week,
        @day,
        @day_of_year,
        @weekday_weekend,
        @week_of_year,
        @month_name,
        @month,
        @is_last_day_of_month,
        @calendar_quarter,
        @year,
        @calendar_year_month,
        @calendar_year_qtr,
        @fiscal_month_of_year,
        @fiscal_quarter,
        @fiscal_year,
        @fiscal_year_month,
        @fiscal_year_qtr,
        GETDATE()
    );

    SET @date = DATEADD(DAY, 1, @date);
END;

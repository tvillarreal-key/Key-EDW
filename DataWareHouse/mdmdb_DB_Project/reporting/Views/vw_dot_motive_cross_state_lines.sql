--DROP VIEW [reporting].[vw_dot_motive_cross_state_lines] 
CREATE VIEW [reporting].[vw_dot_motive_cross_state_lines] AS
WITH CTE_Motive_IFTA_Trips AS 
(
    SELECT DISTINCT 
        [date]
        ,asset_num
        ,MAX(cross_state_lines_single_day_flag) as cross_state_lines_single_day_flag
    FROM (
            SELECT *, 
                CASE WHEN jurisdiction <> prev_juris then 1 else 0 end as cross_state_lines_single_day_flag
            FROM
            (
                SELECT  distinct 
                        [date], 
                        asset_num, 
                        jurisdiction, 
                        ROW_NUMBER() over (partition BY [date],[asset_num] order by date, asset_num) as rnum,
                        LAG(jurisdiction,1) OVER (partition BY [date],[asset_num] order by date, asset_num) AS prev_juris
                FROM reporting.Motive_IFTA_Trips
            ) z 
            WHERE rnum > 1
        ) x 
    GROUP BY [date], asset_num
),
CTE_MotiveMiles AS (
    SELECT DISTINCT 
        [date]
        ,asset_num
        ,MAX(cross_state_lines_single_day_flag) as cross_state_lines_single_day_flag
    FROM (
            SELECT *, 
                CASE WHEN jurisdiction <> prev_juris then 1 else 0 end as cross_state_lines_single_day_flag
            FROM
            (
                SELECT  distinct 
                    [date], 
                    asset_num, 
                    jurisdiction = dbo.fn_GetStateAbbreviation(jurisdiction),         
                    ROW_NUMBER() over (partition BY [date],[asset_num] order by date, asset_num) as rnum,
                    prev_juris = 
                    dbo.fn_GetStateAbbreviation(LAG(jurisdiction,1)
                    OVER (partition by [date],[asset_num] ORDER BY [date],[asset_num]))
                FROM reporting.MotiveMiles
            ) z 
            WHERE rnum > 1
        ) x 
    GROUP BY [date], asset_num
)
SELECT * FROM CTE_Motive_IFTA_Trips
UNION ALL 
SELECT * FROM CTE_MotiveMiles

GO


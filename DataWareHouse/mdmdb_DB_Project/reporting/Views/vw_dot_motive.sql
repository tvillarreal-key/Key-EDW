--DROP VIEW [reporting].[vw_dot_motive] AS
CREATE VIEW [reporting].[vw_dot_motive] AS
WITH CTE_Motive_IFTA_Trips AS (
    SELECT  [date], 
            jurisdiction, 
            LAG(jurisdiction,1) OVER (ORDER BY [date],[asset_num]) AS prev_juris,
            asset_num, 
            start_odometer, 
            end_odometer, 
            start_lat, 
            start_lon, 
            end_lat, 
            end_lon, 
            distance, 
            dvir_record,
            CASE WHEN jurisdiction = 
            ISNULL(LAG(jurisdiction,1) OVER (ORDER BY [date],[asset_num]),jurisdiction) THEN 0 ELSE 1 END AS cross_state_lines_single_day_flag        
    FROM reporting.Motive_IFTA_Trips
), 
CTE_MotiveMiles AS (
    SELECT  [date], 
            jurisdiction = dbo.fn_GetStateAbbreviation(jurisdiction), 
            prev_juris = 
                dbo.fn_GetStateAbbreviation(LAG(jurisdiction,1) OVER (ORDER BY [date],[asset_num])),
            asset_num, 
            odometer_start, 
            odometer_end, 
            latitude_start, 
            longitude_start, 
            latitude_end, 
            longitude_end, 
            distance_mi, 
            dvir_record,
            CASE WHEN jurisdiction = 
            ISNULL(LAG(jurisdiction,1) OVER (ORDER BY [date],[asset_num]),jurisdiction) THEN 0 ELSE 1 END AS cross_state_lines_single_day_flag
    FROM reporting.MotiveMiles
    WHERE [DATE] < '2023-08-01'
)
SELECT * FROM CTE_Motive_IFTA_Trips
UNION ALL 
SELECT * FROM CTE_MotiveMiles

GO


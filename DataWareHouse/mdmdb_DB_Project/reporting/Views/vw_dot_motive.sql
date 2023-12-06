CREATE VIEW [reporting].[vw_dot_motive] AS
SELECT  [date], 
        jurisdiction, 
        asset_num, 
        start_odometer, 
        end_odometer, 
        start_lat, 
        start_lon, 
        end_lat, 
        end_lon, 
        distance, 
        dvir_record
FROM reporting.Motive_IFTA_Trips
UNION ALL 
-- Motive_IFTA_Trips contains reporting from 8/01/2023 onward.
-- Filter out all records after 08/01/2023 from MotiveMiles to avoid overlap.
SELECT  [date], 
        jurisdiction =
            CASE 
                WHEN jurisdiction = 'Alabama' THEN 'AL'
                WHEN jurisdiction = 'Alaska' THEN 'AK' 
                WHEN jurisdiction = 'Arizona' THEN 'AZ' 
                WHEN jurisdiction = 'Arkansas' THEN 'AR' 
                WHEN jurisdiction = 'California' THEN 'CA' 
                WHEN jurisdiction = 'Colorado' THEN 'CO' 
                WHEN jurisdiction = 'Connecticut' THEN 'CT' 
                WHEN jurisdiction = 'Delaware' THEN 'DE' 
                WHEN jurisdiction = 'District of Columbia' THEN 'DC' 
                WHEN jurisdiction = 'Florida' THEN 'FL' 
                WHEN jurisdiction = 'Georgia' THEN 'GA' 
                WHEN jurisdiction = 'Hawaii' THEN 'HI' 
                WHEN jurisdiction = 'Idaho' THEN 'ID' 
                WHEN jurisdiction = 'Illinois' THEN 'IL' 
                WHEN jurisdiction = 'Indiana' THEN 'IN' 
                WHEN jurisdiction = 'Iowa' THEN 'IA' 
                WHEN jurisdiction = 'Kansas' THEN 'KS' 
                WHEN jurisdiction = 'Kentucky' THEN 'KY' 
                WHEN jurisdiction = 'Louisiana' THEN 'LA' 
                WHEN jurisdiction = 'Maine' THEN 'ME' 
                WHEN jurisdiction = 'Maryland' THEN 'MD' 
                WHEN jurisdiction = 'Massachusetts' THEN 'MA' 
                WHEN jurisdiction = 'Michigan' THEN 'MI' 
                WHEN jurisdiction = 'Minnesota' THEN 'MN' 
                WHEN jurisdiction = 'Mississippi' THEN 'MS' 
                WHEN jurisdiction = 'Missouri' THEN 'MO' 
                WHEN jurisdiction = 'Montana' THEN 'MT' 
                WHEN jurisdiction = 'Nebraska' THEN 'NE' 
                WHEN jurisdiction = 'Nevada' THEN 'NV' 
                WHEN jurisdiction = 'New Hampshire' THEN 'NH' 
                WHEN jurisdiction = 'New Jersey' THEN 'NJ' 
                WHEN jurisdiction = 'New Mexico' THEN 'NM' 
                WHEN jurisdiction = 'New York' THEN 'NY' 
                WHEN jurisdiction = 'North Carolina' THEN 'NC' 
                WHEN jurisdiction = 'North Dakota' THEN 'ND' 
                WHEN jurisdiction = 'Ohio' THEN 'OH' 
                WHEN jurisdiction = 'Oklahoma' THEN 'OK' 
                WHEN jurisdiction = 'Oregon' THEN 'OR' 
                WHEN jurisdiction = 'Pennsylvania' THEN 'PA' 
                WHEN jurisdiction = 'Rhode Island' THEN 'RI' 
                WHEN jurisdiction = 'South Carolina' THEN 'SC' 
                WHEN jurisdiction = 'South Dakota' THEN 'SD' 
                WHEN jurisdiction = 'Tennessee' THEN 'TN' 
                WHEN jurisdiction = 'Texas' THEN 'TX' 
                WHEN jurisdiction = 'Utah' THEN 'UT' 
                WHEN jurisdiction = 'Vermont' THEN 'VT' 
                WHEN jurisdiction = 'Virginia' THEN 'VA' 
                WHEN jurisdiction = 'Washington' THEN 'WA' 
                WHEN jurisdiction = 'West Virginia' THEN 'WV' 
                WHEN jurisdiction = 'Wisconsin' THEN 'WI' 
                WHEN jurisdiction = 'Wyoming' THEN 'WY' 
                ELSE NULL
            END, 
        asset_num, 
        odometer_start, 
        odometer_end, 
        latitude_start, 
        longitude_start, 
        latitude_end, 
        longitude_end, 
        distance_mi, 
        dvir_record
FROM reporting.MotiveMiles
WHERE [DATE] < '2023-08-01'
GO


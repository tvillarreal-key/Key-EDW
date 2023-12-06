CREATE VIEW [reporting].[vw_dot_assets] AS
SELECT asset_id, asset_num, asset_desc, asset_class, manufacturer, model, model_year, 
        series, serial_num, [status], status_desc, source, marketed, revenue_track, 
        parent_asset_num, child_relationship_type, loco_code, loco_name, loca_code, 
        loca_name,mktp_code, mktp_name, lvl1_code, lvl1_name, lob_code, lob_name, dist_code, 
        dist_name, mare_code, mare_name, yard_code, yard_name, tire_size, fifth_wheel, 
        crosses_state_lines, trailer_attached_dvir, attached_as_trailer_dvir, dot_fields_populated,
        work_order, has_documentation
FROM reporting.MDM_Assets
--Filter out expired assets
WHERE status_desc IN ('WORKING', 'DOWN FOR REPAIR', 'IDLE', 'AVAILABLE', 'NEEDS REPAIR', 'DEPLOYED') AND 
(
-- In scope assets TRUK, BULK, CRAU, PUMP, CTU, SPEC, WIRU
  asset_class IN ('TRUK', 'BULK', 'CRAU', 'PUMP', 'CTU', 'SPEC', 'WIRU') OR
-- Trailers where 5th wheel is set to yes
  (asset_class ='TRLR' AND fifth_wheel = 'Yes') OR
-- 'HPMP', 'FRAC', 'PIT', 'PUMP': If attached as a trailer on DVIR
  (asset_class IN ('HPMP', 'FRAC', 'PIT', 'PUMP') AND attached_as_trailer_dvir = 1) OR
-- 'ACCUM', 'PSWV': if attached as a trailer on DVIR and crosses state lines
  (asset_class IN ('ACCUM', 'PSWV') AND attached_as_trailer_dvir = 1 AND crosses_state_lines = 1) OR
-- 'LTVL', 'MDTY': if asset has DVIR with a trailer attached and crosses state lines
  (asset_class IN ('LTVL', 'MDTY') AND trailer_attached_dvir = 1 AND crosses_state_lines = 1) OR
-- RIG: if it crosses state lines
  (asset_class = 'RIG' AND crosses_state_lines = 1) OR
 -- RIG: if it is in Andrews, Buckhannon, Hobbs, Kilgore, Odessa completions, WV Rigs
  (asset_class = 'RIG' AND yard_code in ('303','401', '411', '504', '514', '516', '800', 'B57', 'F90'))
) 
UNION
-- 'TRLR' - if attached as a trailer on DVIR,  and the DVIR vehicle asset crosses state lines and trailer customer attribute of 5th wheel NOT set to 'Yes'
SELECT  asset_id, asset_num, asset_desc, asset_class, manufacturer, model, model_year, 
        series, serial_num, [status], status_desc, source, marketed, revenue_track, 
        parent_asset_num, child_relationship_type, loco_code, loco_name, loca_code, 
        loca_name,mktp_code, mktp_name, lvl1_code, lvl1_name, lob_code, lob_name, dist_code, 
        dist_name, mare_code, mare_name, yard_code, yard_name, tire_size, fifth_wheel, 
        crosses_state_lines, trailer_attached_dvir, attached_as_trailer_dvir, dot_fields_populated,
        work_order, has_documentation
FROM reporting.MDM_Assets
-- Filter trailer assets with a customer attribute of 5th wheel not set to Yes
WHERE asset_class = 'TRLR' AND fifth_wheel = 'No' AND 
    -- Identify trailers that have been attached to vehicles in a DVIR
    -- Identify if the vehicle they are attached to ever crosses state lines
    asset_num IN (
    SELECT DISTINCT trailer_asset_num FROM (
        SELECT  dvir.asset_num, 
                dvir.is_trailer_pulled, 
                dvir.trailer_asset_num, 
                assets.crosses_state_lines,
                assets.fifth_wheel
        FROM reporting.IScout_159094 dvir
        LEFT JOIN reporting.MDM_Assets assets 
            ON dvir.asset_num = assets.asset_num
        WHERE dvir.trailer_asset_num IS NOT NULL 
        AND assets.crosses_state_lines = 1
    ) AS dot_trailers
)
GO


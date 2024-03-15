SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--DROP VIEW [reporting].[vw_dot_assets]
CREATE VIEW [reporting].[vw_dot_assets] AS
SELECT asset_id, asset_num, asset_desc, asset_class, manufacturer, model, model_year, 
        series, serial_num, [status], status_desc, source, marketed, revenue_track, 
        parent_asset_num, child_relationship_type, loco_code, loco_name, loca_code, 
        loca_name,mktp_code, mktp_name, lvl1_code, lvl1_name, lob_code, lob_name, dist_code, 
        dist_name, mare_code, mare_name, yard_code, yard_name, tire_size, tire_size2, license_plate, 
        number_of_axles, fifth_wheel, Gross_Vehicle_Weight, dot_roadside_inspection, crosses_state_lines, crosses_state_lines_with_trailer,
        trailer_attached_dvir, attached_as_trailer_dvir, dot_fields_populated,
        work_order, has_documentation
FROM reporting.MDM_Assets
--Filter out expired assets
WHERE status_desc IN ('WORKING', 'DOWN FOR REPAIR', 'IDLE', 'AVAILABLE', 'NEEDS REPAIR', 'DEPLOYED') AND 
(

-- In scope assets TRUK, BULK, CRAU, PUMP, CTU, SPEC, WIRU
--  asset_class IN ('TRUK', 'BULK', 'CRAU', 'CTU', 'WIRU') OR
  asset_class IN ('TRUK', 'BULK', 'CRAU', 'CTU') OR
-- All DOT roadside inspections are automatically DOT in scope
  dot_roadside_inspection = 1 OR
-- Trailers where 5th wheel is set to yes
--  (asset_class ='TRLR' AND fifth_wheel = 'Yes') OR --- need to use gross weight limit
  (asset_class ='TRLR' AND Gross_Vehicle_Weight >= 16000) OR --- need to use gross weight limit
  (asset_class ='TRLR' AND Gross_Vehicle_Weight < 16000 AND crosses_state_lines = 1) OR 
-- 'HPMP', 'FRAC', 'PIT', 'PUMP': If attached as a trailer on DVIR
  (asset_class IN ('HPMP', 'FRAC', 'PIT', 'PUMP', 'SPEC') AND attached_as_trailer_dvir = 1) OR
-- 'ACCUM', 'PSWV': if attached as a trailer on DVIR and crosses state lines
--(asset_class IN ('ACCUM', 'PSWV') AND attached_as_trailer_dvir = 1 AND crosses_state_lines = 1) OR
  (asset_class IN ('ACCUM', 'PSWV') AND crosses_state_lines_with_trailer = 1) OR
-- 'LTVL', 'MDTY': if asset has DVIR with a trailer attached and crosses state lines
--  (asset_class IN ('LTVL', 'MDTY') AND trailer_attached_dvir = 1 AND crosses_state_lines = 1) OR
  (asset_class IN ('LTVL', 'MDTY') AND crosses_state_lines_with_trailer = 1) OR
-- RIG: if it crosses state lines
  (asset_class = 'RIG' AND crosses_state_lines = 1) OR
-- RIG: if it is in Andrews, Buckhannon, Hobbs, Kilgore, Odessa completions, WV Rigs
  (asset_class = 'RIG' AND yard_code in ('303','401', '411', '504', '514', '516', '800', 'B57', 'F90')) OR
  (asset_class IN ('LTVL', 'MDTY') AND crosses_state_lines = 1 
      AND yard_code in ('800','504', 'B35', 'F90', 'F89', '533', '514', '411', '416', '401', '420'))
-- MDTY and LTVL that cross state lines in the following yard codes ......

);
GO

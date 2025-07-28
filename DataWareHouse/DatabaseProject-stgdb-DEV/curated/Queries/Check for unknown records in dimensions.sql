--DELETE
SELECT *
  FROM [datamart].[dimLocation]
  WHERE LocationHashKey = '00000000000000000000000000000000'
;
--DELETE
SELECT *
  FROM [datamart].[dimMktPlace]
  WHERE MktPlaceHashKey = '00000000000000000000000000000000'
;
--DELETE
SELECT *
  FROM [datamart].[dimYard]
  WHERE YardHashKey = '00000000000000000000000000000000'
;
--DELETE
SELECT *
  FROM [datamart].[dimLOB]
  WHERE LOBHashKey = '00000000000000000000000000000000';
INSERT INTO [datamart].[dimLOB]
    ([LOBHashKey]
    ,[LOB_Key_Code]
    ,[SourceSystem]
    ,[Yard_Code]
    ,[Yard_Name]
    ,[Lvl1_Code]
    ,[Lvl1_Name]
    ,[Lob_Code]
    ,[Lob_Name]
    ,[LoadDate])
VALUES
    (
     REPLICATE('0',32)
     ,'?'
     ,'?'
     ,'Unknown'
     ,'Unknown'
     ,'Unknown'
     ,'Unknown'
     ,'Unknown'
     ,'Unknown'
     ,getdate()
    );
--DELETE
SELECT *
  FROM [datamart].[dimAssets]
  WHERE AssetsHashKey = '00000000000000000000000000000000';  
;
--DELETE
SELECT *
  FROM [datamart].[dimAssetClass]
  WHERE ClassKey = '0';    
;
--DELETE
SELECT *
  FROM [datamart].[dimAssetStatus]
  WHERE AssetStatusKey = '00000000000000000000000000000000';    
;

sys.sp_cdc_enable_db
sys.sp_cdc_enable_table @source_schema = 'curated', @source_name = 'dimAsset', @role_name = 'dwh_dba'
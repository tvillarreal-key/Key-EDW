CREATE ROLE [dwh_etl_service]
    AUTHORIZATION [dbo];


GO

ALTER ROLE [dwh_etl_service] ADD MEMBER [dwh_etl_svc];


GO


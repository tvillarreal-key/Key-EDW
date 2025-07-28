CREATE ROLE [dwh_data_engineer]
    AUTHORIZATION [dbo];


GO

ALTER ROLE [dwh_data_engineer] ADD MEMBER [dwh_dev];


GO


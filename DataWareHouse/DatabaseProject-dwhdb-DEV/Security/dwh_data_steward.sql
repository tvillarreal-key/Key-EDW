CREATE ROLE [dwh_data_steward]
    AUTHORIZATION [dbo];


GO

ALTER ROLE [dwh_data_steward] ADD MEMBER [dwh_dsteward];


GO


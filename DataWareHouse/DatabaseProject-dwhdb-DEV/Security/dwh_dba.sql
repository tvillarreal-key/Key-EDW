CREATE ROLE [dwh_dba]
    AUTHORIZATION [dbo];


GO

ALTER ROLE [dwh_dba] ADD MEMBER [dwh_admin];


GO


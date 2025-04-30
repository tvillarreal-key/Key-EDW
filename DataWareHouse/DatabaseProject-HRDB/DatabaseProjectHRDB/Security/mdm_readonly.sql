CREATE ROLE [mdm_readonly]
    AUTHORIZATION [dbo];


GO

ALTER ROLE [mdm_readonly] ADD MEMBER [varonis_dbuser];


GO


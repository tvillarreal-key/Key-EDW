CREATE ROLE [hr_dba_role]
    AUTHORIZATION [dbo];
GO

ALTER ROLE [hr_dba_role] ADD MEMBER [hru_admin];
GO


CREATE ROLE [rubrik_backup_reader_DO_NOT_DELETE]
    AUTHORIZATION [dbo];
GO

ALTER ROLE [rubrik_backup_reader_DO_NOT_DELETE] ADD MEMBER [rubrik_login_p3slt6CIhmEdHtqtwsBj];
GO

ALTER ROLE [rubrik_backup_reader_DO_NOT_DELETE] ADD MEMBER [rubrik_login_hP8B2AbepgWH1FIeULsG];
GO


CREATE TABLE [rubrik].[backup_checkpoints] (
    [time_stamp] DATETIME NOT NULL,
    PRIMARY KEY CLUSTERED ([time_stamp] ASC)
);
GO

GRANT DELETE
    ON OBJECT::[rubrik].[backup_checkpoints] TO [rubrik_backup_reader_DO_NOT_DELETE]
    AS [rubrik_login_p3slt6CIhmEdHtqtwsBj];
GO

GRANT INSERT
    ON OBJECT::[rubrik].[backup_checkpoints] TO [rubrik_backup_reader_DO_NOT_DELETE]
    AS [rubrik_login_p3slt6CIhmEdHtqtwsBj];
GO


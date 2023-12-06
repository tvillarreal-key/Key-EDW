CREATE TABLE [rubrik].[schema_changelog] (
    [major_version] TINYINT       NOT NULL,
    [minor_version] TINYINT       NOT NULL,
    [last_run_at]   DATETIME2 (7) DEFAULT (getutcdate()) NULL,
    PRIMARY KEY CLUSTERED ([major_version] ASC, [minor_version] ASC)
);
GO


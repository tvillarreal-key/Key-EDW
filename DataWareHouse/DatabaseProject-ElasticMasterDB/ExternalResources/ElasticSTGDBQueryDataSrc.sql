CREATE EXTERNAL DATA SOURCE [ElasticSTGDBQueryDataSrc]
    WITH (
    TYPE = RDBMS,
    LOCATION = N'SRVDWH-DEV.DATABASE.WINDOWS.NET',
    DATABASE_NAME = N'stgdb-DEV',
    CREDENTIAL = [ElasticDBCredential]
    );
GO


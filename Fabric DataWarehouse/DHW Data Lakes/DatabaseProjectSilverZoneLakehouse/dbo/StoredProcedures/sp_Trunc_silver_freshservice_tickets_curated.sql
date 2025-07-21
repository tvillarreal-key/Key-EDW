CREATE PROC [dbo].[sp_Trunc_silver_freshservice_tickets_curated]
AS
BEGIN
    TRUNCATE TABLE [SilverZoneLakehouse].[dbo].[silver.freshservice_tickets_curated];
END

GO


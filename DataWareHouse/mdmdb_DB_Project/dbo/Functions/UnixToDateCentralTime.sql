CREATE FUNCTION dbo.UnixToDateCentralTime
(
   @UnixTimestamp BIGINT
)
RETURNS DATETIME2
AS
BEGIN
   DECLARE @UTCDate DATETIME2;
   -- Convert Unix timestamp to UTC datetime
   SET @UTCDate = DATEADD(SECOND, @UnixTimestamp, '1970-01-01');
   -- Convert UTC to Central Time
   RETURN CAST(@UTCDate AT TIME ZONE 'UTC' AT TIME ZONE 'Central Standard Time' AS DATETIME2);
END
GO


CREATE PROCEDURE metricsvault.sp_GetNextAuditSeqValue
    @seqvalue bigint OUTPUT
AS
BEGIN
    SET NOCOUNT ON;
    SET @seqvalue = NEXT VALUE FOR [metricsvault].[Integration_AuditLogSeq];
END
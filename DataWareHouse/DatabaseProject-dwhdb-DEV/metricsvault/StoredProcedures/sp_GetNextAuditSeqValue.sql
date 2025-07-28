SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
DROP PROCEDURE [metricsvault].[sp_GetNextAuditSeqValue];
GO
CREATE PROCEDURE [metricsvault].[sp_GetNextAuditSeqValue]
AS
BEGIN
    DECLARE @seqvalue bigint; 
    SET NOCOUNT ON;
    SET @seqvalue = NEXT VALUE FOR [metricsvault].[Integration_AuditLogSeq];
    TRUNCATE TABLE [metricsvault].[Next_AuditLogSeq_SeqValue];
    INSERT INTO [metricsvault].[Next_AuditLogSeq_SeqValue] (SeqValue) VALUES (@seqvalue);
END
GO

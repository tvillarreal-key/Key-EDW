SELECT COUNT(*) 
FROM dbo.D365_General_Journal_entry

SELECT *
INTO dbo.D365_General_Journal_entry_Backup
FROM dbo.D365_General_Journal_entry;

UPDATE STATISTICS dbo.D365_General_Journal_entry;
UPDATE STATISTICS dbo.D365_MainAccount;
UPDATE STATISTICS dbo.D365_Yard;
UPDATE STATISTICS dbo.GL_REPORTING_BUCKETS_DTL;
UPDATE STATISTICS dbo.D365_KES_Vend_Trans;
UPDATE STATISTICS dbo.D365_VendorJournalLines;

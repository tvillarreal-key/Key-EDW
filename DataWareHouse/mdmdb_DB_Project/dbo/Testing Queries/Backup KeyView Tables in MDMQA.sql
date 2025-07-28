------------- 311,970 -------------

SELECT * INTO dbo.Bkp_KeyView_Activities2 FROM dbo.KeyView_Activities2 WHERE 1 = 0;

INSERT INTO dbo.Bkp_KeyView_Activities2 SELECT * FROM dbo.KeyView_Activities2;

SELECT COUNT(*) CNT 
FROM dbo.KeyView_Activities2;

SELECT COUNT(*) CNT 
FROM dbo.Bkp_KeyView_Activities2;

------------- 0 -------------
SELECT * INTO dbo.Bkp_KeyView_Delays FROM dbo.KeyView_Delays WHERE 1 = 0;

INSERT INTO dbo.Bkp_KeyView_Delays SELECT * FROM dbo.KeyView_Delays;

SELECT COUNT(*) CNT 
FROM dbo.KeyView_Delays;

SELECT COUNT(*) CNT 
FROM dbo.Bkp_KeyView_Delays;

------------- 4,967 -------------

SELECT * INTO dbo.Bkp_KeyView_Job FROM dbo.KeyView_Job WHERE 1 = 0;

INSERT INTO dbo.Bkp_KeyView_Job SELECT * FROM dbo.KeyView_Job;

SELECT COUNT(*) CNT 
FROM dbo.KeyView_Job;

SELECT COUNT(*) CNT 
FROM dbo.Bkp_KeyView_Job;

---------- 11,149 ---------------

SELECT * INTO dbo.Bkp_KeyView_Job_Activity_Exception FROM dbo.KeyView_Job_Activity_Exception WHERE 1 = 0;

INSERT INTO   dbo.Bkp_KeyView_Job_Activity_Exception SELECT * FROM dbo.KeyView_Job_Activity_Exception;

SELECT COUNT(*) CNT 
FROM dbo.KeyView_Job_Activity_Exception;

SELECT COUNT(*) CNT 
FROM dbo.Bkp_KeyView_Job_Activity_Exception;
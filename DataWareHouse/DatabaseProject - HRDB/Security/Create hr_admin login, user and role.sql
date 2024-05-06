-- Create a new HRDB admin SQL login (only once!)
CREATE LOGIN hr_admin WITH PASSWORD = 'Plm8hw06Itnh';
GO
-- Connect to your database
--USE HRDB;
--GO
-- ==== Create the database user for the hr_admin login ====
-- Create a user for the login
CREATE USER hru_admin FOR LOGIN hr_admin;
GO

-- Add the user to the role
EXEC sp_addrolemember 'hr_dba_role', 'hru_admin';
GO
GRANT CREATE TABLE TO hr_dba_role;
GRANT CREATE PROCEDURE TO hr_dba_role;
GRANT CREATE VIEW TO hr_dba_role;
GRANT EXECUTE TO hr_dba_role;
GRANT ALTER ANY SCHEMA TO hr_dba_role;
GRANT VIEW DEFINITION TO hr_dba_role;
GRANT CONTROL TO hr_dba_role;
CREATE ROLE hr_dba_role;
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

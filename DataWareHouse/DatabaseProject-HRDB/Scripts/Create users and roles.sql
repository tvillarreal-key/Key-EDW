-- =============================================================================================================================
-- Create SQL Login template for Azure SQL Database, Azure Synapse Analytics Database, and Azure Synapse SQL Analytics on-demand
-- =============================================================================================================================

CREATE LOGIN hr_admin WITH PASSWORD = 'Plm8hw06Itnh';
GO

CREATE USER hr_admin FOR LOGIN hr_dba;
GO

CREATE USER hru_admin FOR LOGIN hr_admin;
GO


------
CREATE USER hru_etl_engr FOR LOGIN hr_etl_engr;
GO

--USE HRDB;
CREATE USER hru_etl_engr FOR LOGIN hr_etl_engr;
GO


CREATE LOGIN hr_etl_engr WITH PASSWORD = 'wqA9helq7Vem';
GO

--USE HRDB;
CREATE USER hru_etl_engr FOR LOGIN hr_etl_engr;
GO

CREATE LOGIN hr_data_rpting WITH PASSWORD = 'uc40OmLltpPY';
GO

--USE HRDB;
CREATE USER hrU_data_rpting FOR LOGIN hr_data_rpting;
GO



-- Connect to your database
--USE HRDB;
--GO
-- ==== Create the database user for the hr_admin login ====
-- Create a user for the login
CREATE USER hru_etl_engr FOR LOGIN hr_etl_engr;
GO

CREATE USER hru_data_rpting FOR LOGIN hr_data_rpting;
GO

-- Create Roles if needed
CREATE ROLE hr_etl_engr_role;
CREATE ROLE hr_data_rpting_role;
 
-- Grant Permissions
GRANT EXECUTE, INSERT, UPDATE, DELETE ON SCHEMA::hr TO hr_etl_engr_role;
GRANT SELECT ON SCHEMA::hr TO hr_data_rpting_role;

-- Create Roles if needed
CREATE ROLE hr_etl_engr_role;
CREATE ROLE hr_data_rpting_role;
 
-- Grant Permissions
GRANT EXECUTE, INSERT, UPDATE, DELETE ON SCHEMA::hr TO hr_etl_engr_role;
GRANT SELECT ON SCHEMA::hr TO hr_data_rpting_role;

EXEC sp_addrolemember 'hr_dba_role', 'hru_admin';
GO


CREATE TABLE [dbo].[ComData1003Transactions] (
    [TransactionID]                          INT           NULL,
    [T1003_01_EmployeeVehicleCard]           NVARCHAR (1)  NULL,
    [T1003_02_CardAssignedFirstName]         NVARCHAR (15) NULL,
    [T1003_03_CardAssignedLastName]          NVARCHAR (20) NULL,
    [T1003_04_CardAssignedEmployeeNumber]    NVARCHAR (16) NULL,
    [T1003_05_DriverLicenseNumber]           NVARCHAR (20) NULL,
    [T1003_06_DriverLicenseStateProvince]    NVARCHAR (3)  NULL,
    [T1003_07_DriverLicenseCountry]          NVARCHAR (3)  NULL,
    [T1003_08_CustomerStandardProfileNumber] NVARCHAR (6)  NULL,
    [T1003_09_UseCustomerProfile]            NVARCHAR (1)  NULL,
    [T1003_10_TripNumber]                    NVARCHAR (10) NULL,
    [T1003_11_IDNumber]                      NVARCHAR (17) NULL,
    [T1003_12_VehicleNumber]                 NVARCHAR (17) NULL,
    [T1003_13_VehicleDescription]            NVARCHAR (30) NULL,
    [T1003_14_VIN]                           NVARCHAR (30) NULL,
    [T1003_15_VehicleLicensePlate]           NVARCHAR (15) NULL,
    [T1003_16_VehicleRegistrationExpiration] NVARCHAR (4)  NULL,
    [T1003_17_Misc1]                         NVARCHAR (15) NULL,
    [T1003_18_Misc2]                         NVARCHAR (15) NULL,
    [T1003_19_Misc3]                         NVARCHAR (15) NULL,
    [T1003_20_Misc4]                         NVARCHAR (15) NULL,
    [T1003_21_VehicleFuelType]               NVARCHAR (15) NULL,
    [T1003_22_VehicleTankCapacity]           NVARCHAR (10) NULL,
    [T1003_23_TrailerNumber]                 NVARCHAR (10) NULL,
    [T1003_24_PromptedDriverID]              NVARCHAR (17) NULL,
    [T1003_25_POSFirstName]                  NVARCHAR (15) NULL,
    [T1003_26_POSLastName]                   NVARCHAR (20) NULL,
    [T1003_27_VirtualCardRepairOrderNumber]  NVARCHAR (10) NULL,
    [T1003_28_VirtualCardInvoiceNumber]      NVARCHAR (15) NULL,
    [T1003_29_VirtualCardWarrantyReport]     NVARCHAR (1)  NULL,
    [T1003_30_VirtualCardWarrantyPeriod]     NVARCHAR (8)  NULL,
    [T1003_31_VirtualCardVendorNumber]       NVARCHAR (15) NULL,
    [T1003_32_CardType]                      NVARCHAR (1)  NULL,
    [T1003_33_CustomerIDSubAccount]          NVARCHAR (14) NULL
);
GO


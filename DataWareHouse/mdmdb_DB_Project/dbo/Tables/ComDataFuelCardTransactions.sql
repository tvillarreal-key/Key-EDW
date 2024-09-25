CREATE TABLE [dbo].[ComDataFuelCardTransactions] (
    [TransactionID]                            INT             NOT NULL,
    [T1006_01_CreditDebit]                     NVARCHAR (1)    NULL,
    [T1006_02_ServiceType]                     NVARCHAR (1)    NULL,
    [T1006_03_BillingFlag]                     NVARCHAR (1)    NULL,
    [T1006_04_ProductCode]                     NVARCHAR (15)   NULL,
    [T1006_05_ProductDescription]              NVARCHAR (35)   NULL,
    [T1006_06_ProductQuantity]                 NUMERIC (18, 6) NULL,
    [T1006_07_ProductPrice]                    NUMERIC (18, 5) NULL,
    [T1006_08_ProductTotalCost]                NUMERIC (18, 2) NULL,
    [T1006_09_MerchantDiscountIndicator]       NVARCHAR (1)    NULL,
    [T1006_10_MerchantDiscountAmountNet]       NUMERIC (9)     NULL,
    [T1006_11_CommodityCode]                   NVARCHAR (15)   NULL,
    [T1006_12_TaxAmountIndicator1]             NVARCHAR (1)    NULL,
    [T1006_13_TaxAmount1]                      NUMERIC (18, 2) NULL,
    [T1006_14_TaxRate1]                        NUMERIC (18, 5) NULL,
    [T1006_15_TaxID1]                          NVARCHAR (3)    NULL,
    [T1006_16_CardAcceptorTaxID1]              NVARCHAR (20)   NULL,
    [T1006_17_TaxAmountIndicator2]             NVARCHAR (1)    NULL,
    [T1006_18_TaxAmount2]                      NUMERIC (18, 2) NULL,
    [T1006_19_TaxRate2]                        NUMERIC (18, 5) NULL,
    [T1006_20_TaxID2]                          NVARCHAR (3)    NULL,
    [T1006_21_CardAcceptorTaxID2]              NVARCHAR (20)   NULL,
    [T1006_22_TaxAmountIndicator3]             NVARCHAR (1)    NULL,
    [T1006_23_TaxAmount3]                      NUMERIC (18, 2) NULL,
    [T1006_24_TaxRate3]                        NUMERIC (18, 5) NULL,
    [T1006_25_TaxID3]                          NVARCHAR (3)    NULL,
    [T1006_26_CardAcceptorTaxID3]              NVARCHAR (20)   NULL,
    [T1006_27_TaxAmountIndicator4]             NVARCHAR (1)    NULL,
    [T1006_28_TaxAmount4]                      NUMERIC (18, 2) NULL,
    [T1006_29_TaxRate4]                        NUMERIC (18, 5) NULL,
    [T1006_30_TaxID4]                          NVARCHAR (3)    NULL,
    [T1006_31_CardAcceptorTaxID4]              NVARCHAR (20)   NULL,
    [T1006_32_TaxAmountIndicatorTot]           NVARCHAR (1)    NULL,
    [T1006_33_TaxAmountTot]                    NUMERIC (18, 2) NULL,
    [T1006_34_TaxRateTot]                      NUMERIC (18, 5) NULL,
    [T1006_35_TaxIDTot]                        NVARCHAR (3)    NULL,
    [T1006_36_CardAcceptorTaxIDTot]            NVARCHAR (20)   NULL,
    [T1006_37_TaxExemptIndicator]              NVARCHAR (1)    NULL,
    [T1006_38_GrossPrice]                      NUMERIC (18, 6) NULL,
    [T1006_39_GrossTotalCost]                  NUMERIC (18, 2) NULL,
    [T1006_40_ProductTypeCode]                 NVARCHAR (1)    NULL,
    [T1006_41_BasePriceperunit]                NUMERIC (18, 3) NULL,
    [T1006_42_DeliveryFee]                     NUMERIC (18, 3) NULL,
    [T1006_43_TotalTaxPPU]                     NUMERIC (18, 3) NULL,
    [T1006_44_OdometerReading]                 NUMERIC (18)    NULL,
    [T1006_45_PreviousOdometerReading]         NUMERIC (18)    NULL,
    [T1006_46_YearToDateMPG]                   NUMERIC (7, 2)  NULL,
    [T1006_47_MPGforthisfillup]                NUMERIC (7, 2)  NULL,
    [T1006_48_MilesDriven]                     NUMERIC (18)    NULL,
    [T1006_49_CostperMile]                     NUMERIC (7, 2)  NULL,
    [T1006_50_TrailerHubReading]               NUMERIC (18, 1) NULL,
    [T1006_51_T2006RecordKey]                  NVARCHAR (5)    NULL,
    [T1006_52_AlternateTaxID]                  NVARCHAR (15)   NULL,
    [T1006_53_ItemDiscountRate]                NUMERIC (18, 6) NULL,
    [T1006_54_TypeofSupply]                    NVARCHAR (2)    NULL,
    [T1006_55_UniqueVATInvoiceReferenceNumber] NVARCHAR (13)   NULL,
    [T1006_56_CustomerMiscNumber]              NVARCHAR (17)   NULL,
    [T1006_57_UnitOfMeasure]                   NVARCHAR (1)    NULL,
    [T1006_58_TankCapacityException]           NVARCHAR (1)    NULL,
    [T1006_59_MilesPerGallonException]         NVARCHAR (1)    NULL,
    [T1006_60_CostPerGallonException]          NVARCHAR (1)    NULL,
    [T1006_61_ProductException]                NVARCHAR (1)    NULL,
    [T1006_62_HighGradeFuelExceptionFlag]      NVARCHAR (1)    NULL,
    [T1006_63_OtherFuelExceptionFlag]          NVARCHAR (1)    NULL,
    [T1006_64_TotalChargesforCycleFlag]        NVARCHAR (1)    NULL,
    [T1006_65_RebateIndicator]                 NVARCHAR (1)    NULL,
    [T1006_66_RebateAmountNet]                 NUMERIC (18, 2) NULL,
    [T1006_67_ComdataDiscount2006]             INT             NULL,
    [T1006_68_CustomerIDSubAccount1006]        NVARCHAR (14)   NULL,
    [T1002_01_MerchantGroup]                   NVARCHAR (5)    NULL,
    [T1002_02_MasterCardCategoryCode]          NVARCHAR (4)    NULL,
    [T1002_03_MerchantMinorityStatus]          NVARCHAR (3)    NULL,
    [T1002_04_MasterCardAcquirer]              NVARCHAR (11)   NULL,
    [T1002_05_MasterCardAcceptor]              NVARCHAR (15)   NULL,
    [T1002_06_MasterCardTerminal]              NVARCHAR (8)    NULL,
    [T1002_07_MerchantName]                    NVARCHAR (30)   NULL,
    [T1002_08_MerchantAddress1]                NVARCHAR (40)   NULL,
    [T1002_09_MerchantAddress2]                NVARCHAR (40)   NULL,
    [T1002_10_MerchantCity]                    NVARCHAR (15)   NULL,
    [T1002_11_MerchantPostalCode]              NVARCHAR (10)   NULL,
    [T1002_12_MerchantStateProvince]           NVARCHAR (3)    NULL,
    [T1002_13_MerchantChainBrandX]             NVARCHAR (5)    NULL,
    [T1002_14_MerchantCorporateCode]           NVARCHAR (5)    NULL,
    [T1002_15_MerchantCountryCurrencyCode]     NVARCHAR (3)    NULL,
    [T1002_16_MerchantCode]                    NVARCHAR (14)   NULL,
    [T1002_17_MerchantChain_BrandDescription]  NVARCHAR (30)   NULL,
    [T1002_18_MerchantTaxID]                   NVARCHAR (20)   NULL,
    [T1002_19_MerchantReferenceNumber]         NVARCHAR (17)   NULL,
    [T1002_20_CorporationVATNumber]            NVARCHAR (13)   NULL,
    [T1002_21_MerchantVATNumber]               NVARCHAR (13)   NULL,
    [T1002_22_CustomerVatNumber]               NVARCHAR (13)   NULL,
    [T1002_23_MerchantCustomerName]            NVARCHAR (30)   NULL,
    [T1002_24_MerchantCustomerAccountNumber]   NVARCHAR (17)   NULL,
    [T1002_25_MarketerID]                      NVARCHAR (10)   NULL,
    [T1002_26_MarketerName]                    NVARCHAR (30)   NULL,
    [T1002_27_FirstPresentmentAcceptorId]      NVARCHAR (15)   NULL,
    [T1002_28_FuelLoc24Hours]                  NVARCHAR (1)    NULL,
    [T1002_29_FuelLoc18Wheel]                  NVARCHAR (1)    NULL,
    [T1002_30_FuelLocDiesel]                   NVARCHAR (1)    NULL,
    [T1002_31_FuelLocInterStateExit]           NVARCHAR (1)    NULL,
    [T1002_32_FuelLocConverienceStore]         NVARCHAR (1)    NULL,
    [T1002_33_FuelLocRestraurant]              NVARCHAR (1)    NULL,
    [T1002_34_FuelLocHotel]                    NVARCHAR (1)    NULL,
    [T1002_35_FuelLocShower]                   NVARCHAR (1)    NULL,
    [T1002_36_FuelLocVehicleMaint]             NVARCHAR (1)    NULL,
    [T1002_37_FuelLocCarWash]                  NVARCHAR (1)    NULL,
    [T1002_38_FuelLocAVFuel]                   NVARCHAR (1)    NULL,
    [T1002_39_FuelLocMarineFuel]               NVARCHAR (1)    NULL,
    [T1002_40_FuelLocAltFuel]                  NVARCHAR (1)    NULL,
    [T1002_41_FuelLocPATP]                     NVARCHAR (1)    NULL,
    [T1002_42_OilCompanyBrand]                 NVARCHAR (4)    NULL,
    [T1002_43_CardAccpTaxProvider]             NVARCHAR (1)    NULL,
    [T1002_44_Latitude]                        NVARCHAR (11)   NULL,
    [T1002_45_Longitude]                       NVARCHAR (11)   NULL,
    [T1002_46_CardAccpTaxProvider]             NVARCHAR (1)    NULL,
    [T1002_47_CustomerIDSubAccount]            NVARCHAR (14)   NULL,
    [T1003_01_EmployeeVehicleCard]             NVARCHAR (1)    NULL,
    [T1003_02_CardAssignedFirstName]           NVARCHAR (15)   NULL,
    [T1003_03_CardAssignedLastName]            NVARCHAR (20)   NULL,
    [T1003_04_CardAssignedEmployeeNumber]      NVARCHAR (16)   NULL,
    [T1003_05_DriverLicenseNumber]             NVARCHAR (20)   NULL,
    [T1003_06_DriverLicenseStateProvince]      NVARCHAR (3)    NULL,
    [T1003_07_DriverLicenseCountry]            NVARCHAR (3)    NULL,
    [T1003_08_CustomerStandardProfileNumber]   NVARCHAR (6)    NULL,
    [T1003_09_UseCustomerProfile]              NVARCHAR (1)    NULL,
    [T1003_10_TripNumber]                      NVARCHAR (10)   NULL,
    [T1003_11_IDNumber]                        NVARCHAR (17)   NULL,
    [T1003_12_VehicleNumber]                   NVARCHAR (17)   NULL,
    [T1003_13_VehicleDescription]              NVARCHAR (30)   NULL,
    [T1003_14_VIN]                             NVARCHAR (30)   NULL,
    [T1003_15_VehicleLicensePlate]             NVARCHAR (15)   NULL,
    [T1003_16_VehicleRegistrationExpiration]   NVARCHAR (4)    NULL,
    [T1003_17_Misc1]                           NVARCHAR (15)   NULL,
    [T1003_18_Misc2]                           NVARCHAR (15)   NULL,
    [T1003_19_Misc3]                           NVARCHAR (15)   NULL,
    [T1003_20_Misc4]                           NVARCHAR (15)   NULL,
    [T1003_21_VehicleFuelType]                 NVARCHAR (15)   NULL,
    [T1003_22_VehicleTankCapacity]             NVARCHAR (10)   NULL,
    [T1003_23_TrailerNumber]                   NVARCHAR (10)   NULL,
    [T1003_24_PromptedDriverID]                NVARCHAR (17)   NULL,
    [T1003_25_POSFirstName]                    NVARCHAR (15)   NULL,
    [T1003_26_POSLastName]                     NVARCHAR (20)   NULL,
    [T1003_27_VirtualCardRepairOrderNumber]    NVARCHAR (10)   NULL,
    [T1003_28_VirtualCardInvoiceNumber]        NVARCHAR (15)   NULL,
    [T1003_29_VirtualCardWarrantyReport]       NVARCHAR (1)    NULL,
    [T1003_30_VirtualCardWarrantyPeriod]       NVARCHAR (8)    NULL,
    [T1003_31_VirtualCardVendorNumber]         NVARCHAR (15)   NULL,
    [T1003_32_CardType]                        NVARCHAR (1)    NULL,
    [T1003_33_CustomerIDSubAccount]            NVARCHAR (14)   NULL,
    [LoadFile]                                 NVARCHAR (50)   NULL,
    [DateLoaded]                               DATETIME2 (7)   NULL
);
GO

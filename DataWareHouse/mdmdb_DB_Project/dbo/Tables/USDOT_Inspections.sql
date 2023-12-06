CREATE TABLE [dbo].[USDOT_Inspections] (
    [Date]                            NVARCHAR (20)  NOT NULL,
    [State]                           NVARCHAR (5)   NOT NULL,
    [Number]                          NVARCHAR (20)  NOT NULL,
    [Level]                           NVARCHAR (5)   NULL,
    [PlacardableHMVehicleInspections] NVARCHAR (5)   NULL,
    [HMInpsection]                    NVARCHAR (5)   NULL,
    [BASIC]                           NVARCHAR (50)  NULL,
    [ViolationGroupDescription]       NVARCHAR (MAX) NULL,
    [Code]                            NVARCHAR (50)  NOT NULL,
    [Description]                     NVARCHAR (MAX) NULL,
    [OutOfService]                    NVARCHAR (5)   NULL,
    [ConvictedDifferentCharge]        NVARCHAR (5)   NULL,
    [ViolationSeverityWeight]         NVARCHAR (5)   NULL,
    [TimeWeight]                      NVARCHAR (5)   NULL,
    [BASICViolationsPerInspection]    NVARCHAR (5)   NULL,
    [Unit]                            NVARCHAR (5)   NULL,
    [LastName]                        NVARCHAR (50)  NULL,
    [FirstName]                       NVARCHAR (50)  NULL,
    [DateOfBirth]                     NVARCHAR (20)  NULL,
    [LicenseState]                    NVARCHAR (5)   NULL,
    [LicenseNumber]                   NVARCHAR (20)  NULL,
    [V1Type]                          NVARCHAR (20)  NULL,
    [V1Make]                          NVARCHAR (20)  NULL,
    [V1LicenseState]                  NVARCHAR (5)   NULL,
    [V1LicenseNumber]                 NVARCHAR (20)  NULL,
    [V1VIN]                           NVARCHAR (50)  NULL,
    [V2Type]                          NVARCHAR (20)  NULL,
    [V2Make]                          NVARCHAR (20)  NULL,
    [V2LicenseState]                  NVARCHAR (5)   NULL,
    [V2LicenseNumber]                 NVARCHAR (20)  NULL,
    [V2VIN]                           NVARCHAR (50)  NULL
);
GO

ALTER TABLE [dbo].[USDOT_Inspections]
    ADD CONSTRAINT [PK_USDOT_Inspections] PRIMARY KEY CLUSTERED ([Number] ASC, [Code] ASC);
GO


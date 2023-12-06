CREATE TABLE [dbo].[BOA_AccountInfo] (
    [AccountNumber]            VARCHAR (20) NOT NULL,
    [ReportsTo]                VARCHAR (20) NULL,
    [PostedCurrencyCode]       VARCHAR (5)  NULL,
    [BillingType]              VARCHAR (5)  NULL,
    [AcceptanceBrandIdCode]    VARCHAR (5)  NULL,
    [CorporateProduct]         VARCHAR (5)  NULL,
    [AccountTypeCode]          VARCHAR (5)  NULL,
    [AlternateAccountNumber]   VARCHAR (20) NULL,
    [AlternateAccountType]     VARCHAR (5)  NULL,
    [TransferFromAccount]      VARCHAR (20) NULL,
    [EffectiveDate]            VARCHAR (10) NULL,
    [ExpirationDate]           VARCHAR (10) NULL,
    [EmployeeId]               VARCHAR (64) NULL,
    [NameLocaleCode]           VARCHAR (5)  NULL,
    [NameLine1]                VARCHAR (50) NULL,
    [NameLine2]                VARCHAR (50) NULL,
    [TaxExemptIndicator]       VARCHAR (5)  NULL,
    [TransitRoutingNum]        VARCHAR (10) NULL,
    [TravelersChecksIndicator] VARCHAR (5)  NULL,
    [NumOfCards]               INT          NULL,
    [PendingCompanyNum]        VARCHAR (10) NULL,
    [CustomerId]               VARCHAR (10) NULL,
    [AccountIdentifier]        VARCHAR (15) NULL,
    [NextBillingCycle]         VARCHAR (5)  NULL,
    [CRVIndicator]             VARCHAR (5)  NULL,
    [CreditLimit]              DECIMAL (18) NULL,
    [FirstName]                VARCHAR (50) NULL,
    [LastName]                 VARCHAR (50) NULL
);
GO

ALTER TABLE [dbo].[BOA_AccountInfo]
    ADD CONSTRAINT [PK_NewTable] PRIMARY KEY CLUSTERED ([AccountNumber] ASC);
GO


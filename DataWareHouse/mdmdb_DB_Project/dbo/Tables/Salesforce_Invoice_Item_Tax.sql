CREATE TABLE [dbo].[Salesforce_Invoice_Item_Tax] (
    [Id]                       NVARCHAR (18)   NOT NULL,
    [IsDeleted]                NVARCHAR (5)    NULL,
    [Name]                     NVARCHAR (80)   NULL,
    [CreatedDate]              DATETIME2 (0)   NULL,
    [CreatedById]              NVARCHAR (18)   NULL,
    [LastModifiedDate]         DATETIME2 (0)   NULL,
    [LastModifiedById]         NVARCHAR (18)   NULL,
    [SystemModstamp]           DATETIME2 (0)   NULL,
    [LastViewedDate]           DATETIME2 (0)   NULL,
    [LastReferencedDate]       DATETIME2 (0)   NULL,
    [FK__Invoice_Item__c]      NVARCHAR (18)   NULL,
    [Calculated_Tax__c]        DECIMAL (18, 2) NULL,
    [Certificate_Number__c]    NVARCHAR (255)  NULL,
    [Integration_ID__c]        NVARCHAR (50)   NULL,
    [Jurisdiction_Level__c]    NVARCHAR (255)  NULL,
    [Sales_Tax_Roll_Up__c]     DECIMAL (18, 2) NULL,
    [Sales_Tax__c]             DECIMAL (18, 2) NULL,
    [Tax_Rate__c]              DECIMAL (18, 4) NULL,
    [Tax_Result__c]            NVARCHAR (255)  NULL,
    [Tax_Type__c]              NVARCHAR (255)  NULL,
    [Vertex_Calculated_Tax__c] DECIMAL (18, 2) NULL,
    [Updated_by_Workflow__c]   NVARCHAR (5)    NULL,
    [State_Initials__c]        NVARCHAR (255)  NULL,
    [Type__c]                  NVARCHAR (MAX)  NULL
);
GO

ALTER TABLE [dbo].[Salesforce_Invoice_Item_Tax]
    ADD CONSTRAINT [PK_Salesforce_Invoice_Item_Tax] PRIMARY KEY CLUSTERED ([Id] ASC);
GO


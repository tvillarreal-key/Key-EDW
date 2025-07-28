CREATE TABLE [dbo].[Salesforce_Ticket_Items_Utilization] (
    [ticket_id]              VARCHAR (20)    NOT NULL,
    [ticket_name]            VARCHAR (50)    NULL,
    [ticket_date]            DATE            NULL,
    [customer]               VARCHAR (100)   NULL,
    [marketplace]            VARCHAR (50)    NULL,
    [ticket_status]          VARCHAR (50)    NULL,
    [ticket_number]          VARCHAR (50)    NULL,
    [office_loco]            VARCHAR (50)    NULL,
    [ticket_asset_number]    VARCHAR (50)    NULL,
    [ticket_asset_id]        VARCHAR (20)    NULL,
    [ticket_asset_name]      VARCHAR (100)   NULL,
    [item_id]                VARCHAR (20)    NULL,
    [item_name]              VARCHAR (50)    NULL,
    [item_code]              VARCHAR (50)    NULL,
    [item_code_description]  VARCHAR (256)   NULL,
    [item_asset_number]      VARCHAR (50)    NULL,
    [item_asset_description] VARCHAR (100)   NULL,
    [utilization_hours]      NUMERIC (18, 2) NULL,
    [lco]                    VARCHAR (10)    NULL,
    [level1]                 VARCHAR (10)    NULL,
    [level2]                 VARCHAR (10)    NULL,
    [type]                   VARCHAR (5)     NULL,
    [omit]                   TINYINT         NULL,
    [item_sf_asset_id]       VARCHAR (20)    NULL,
    [item_sf_asset_number]   VARCHAR (20)    NULL,
    [item_sf_asset_name]     VARCHAR (100)   NULL,
    [item_revenue_total]     NUMERIC (18, 2) NULL
);
GO

ALTER TABLE [dbo].[Salesforce_Ticket_Items_Utilization]
    ADD CONSTRAINT [DEFAULT_Salesforce_Ticket_Items_Utilization_omit] DEFAULT ((0)) FOR [omit];
GO


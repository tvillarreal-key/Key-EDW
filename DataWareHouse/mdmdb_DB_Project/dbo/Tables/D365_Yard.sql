CREATE TABLE [dbo].[D365_Yard] (
    [FUNCTIONALLOCATIONID]               VARCHAR (10)  NULL,
    [FUNCTIONALLOCATIONLIFECYCLESTATEID] VARCHAR (10)  NULL,
    [FUNCTIONALLOCATIONTYPEID]           VARCHAR (10)  NULL,
    [NAME]                               VARCHAR (MAX) NULL,
    [NOTES]                              VARCHAR (MAX) NULL,
    [XXLOB_CUSTOM]                       VARCHAR (MAX) NULL,
    [XXMKT_CUSTOM]                       VARCHAR (MAX) NULL,
    [XXACCTSEG_CUSTOM]                   VARCHAR (50)  NULL,
    [XXCITY_CUSTOM]                      VARCHAR (MAX) NULL,
    [XXFULLADDRESS_CUSTOM]               VARCHAR (MAX) NULL,
    [XXSTATE_CUSTOM]                     VARCHAR (10)  NULL,
    [XXSTREET_CUSTOM]                    VARCHAR (MAX) NULL,
    [XXZIP_CUSTOM]                       VARCHAR (20)  NULL,
    [KES_AcctSegments]                   VARCHAR (50)  NULL,
    [KES_LineOfBusiness]                 VARCHAR (50)  NULL,
    [KES_Marketplace]                    VARCHAR (50)  NULL,
    [INSERTED]                           DATETIME      NULL,
    [ExecutionRunId]                     VARCHAR (100) NULL
);
GO


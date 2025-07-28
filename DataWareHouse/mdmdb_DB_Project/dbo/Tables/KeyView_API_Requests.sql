CREATE TABLE [dbo].[KeyView_API_Requests] (
    [execID]                 VARCHAR (100) NOT NULL,
    [execution_date]         DATETIME2 (7) NULL,
    [request_type]           VARCHAR (50)  NULL,
    [request_parm_1]         VARCHAR (100) NULL,
    [request_parm_2]         VARCHAR (100) NULL,
    [request_parm_3]         VARCHAR (100) NULL,
    [request_parm_4]         VARCHAR (100) NULL,
    [request_parm_5]         VARCHAR (100) NULL,
    [request_parm_6]         VARCHAR (100) NULL,
    [total_records_queried]  INT           NULL,
    [total_records_returned] INT           NULL,
    [startTime]              DATETIME2 (7) NULL,
    [endTime]                DATETIME2 (7) NULL
);
GO

ALTER TABLE [dbo].[KeyView_API_Requests]
    ADD CONSTRAINT [PK_KeyView_API_Requests] PRIMARY KEY CLUSTERED ([execID] ASC);
GO


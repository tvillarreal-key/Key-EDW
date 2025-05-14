CREATE TABLE [dbo].[Training_Trainings_List] (
    [id]                                INT             NULL,
    [title]                             NVARCHAR (500)  NULL,
    [created]                           NVARCHAR (30)   NULL,
    [lesson_id]                         NVARCHAR (30)   NULL,
    [course_id]                         NVARCHAR (200)  NULL,
    [included_trainings_id]             NVARCHAR (200)  NULL,
    [schedule_type]                     NVARCHAR (30)   NULL,
    [renewal_months]                    NVARCHAR (30)   NULL,
    [certificate_text]                  NVARCHAR (200)  NULL,
    [assigned_to_type]                  NVARCHAR (100)  NULL,
    [is_highlighted]                    BIT             NULL,
    [notes]                             NVARCHAR (1000) NULL,
    [expires_on_month]                  NVARCHAR (30)   NULL,
    [expires_on_day]                    NVARCHAR (30)   NULL,
    [expiring_days]                     NVARCHAR (30)   NULL,
    [window_open_month]                 NVARCHAR (30)   NULL,
    [window_open_day]                   NVARCHAR (30)   NULL,
    [window_close_month]                NVARCHAR (30)   NULL,
    [window_close_day]                  NVARCHAR (30)   NULL,
    [window_last_offered_date_number]   NVARCHAR (30)   NULL,
    [window_required_for_new_employees] BIT             NULL,
    [record_inserted_on]                DATETIME        NULL,
    [record_updated_on]                 DATETIME        NULL
);
GO


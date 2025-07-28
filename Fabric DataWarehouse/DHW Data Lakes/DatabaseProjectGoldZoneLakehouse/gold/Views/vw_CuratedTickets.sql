CREATE VIEW gold.vw_CuratedTickets AS
SELECT a.[id]
      ,b.[Priorities]
      ,c.[Status]
      ,e.[name] as 'Group'
      ,case when f.[name] is null then 'n/a' else f.[name] end as 'Department'
      ,case when g.[first_name] is null then 'n/a' else g.[first_name] end as 'Requester First Name'
      ,case when g.[last_name] is null then 'n/a' else g.[last_name] end as 'Requester Last Name'      
      ,case when h.[first_name] is null then 'n/a' else h.[first_name] end as 'Requested For First Name'
      ,case when h.[last_name] is null then 'n/a' else h.[last_name] end as 'Requested For Last Name'      
      ,case when i.[first_name] is null then 'n/a' else i.[first_name] end as 'Responder First Name'
      ,case when i.[last_name] is null then 'n/a' else i.[last_name] end as 'Responder Last Name'      
      ,[description_text]
      ,[subject]
      ,[type]
      ,[category]
      ,[sub_category]
      ,[item_category]
      ,[to_emails]
      ,[fwd_emails]
      ,[cc_emails]
      ,[reply_cc_emails]
      ,[due_by]
      ,[fr_due_by]
      ,a.[created_at]
      ,a.[updated_at]
      ,[is_escalated]
      ,[fr_escalated]
      ,[spam]
      ,[deleted]
      ,a.[_ingestion_timestamp]
      ,a.[_pipeline_run_id]
      ,a.[_source_name]
  FROM [SilverZoneLakehouse].[dbo].[silver.freshservice_tickets_curated] a 
  LEFT JOIN [SilverZoneLakehouse].[dbo].[silver.ticket_priority_type] b 
  ON a.priority = b.[Value]
  LEFT JOIN [SilverZoneLakehouse].[dbo].[silver.ticket_status_type] c
  ON a.status = c.[Value]  
  LEFT JOIN [SilverZoneLakehouse].[dbo].[silver.ticket_source_type] d
  ON a.source = d.[Value]  
  LEFT JOIN [SilverZoneLakehouse].[dbo].[silver.freshservice_groups_curated] e
  ON a.group_id = e.[id]    
  LEFT JOIN [SilverZoneLakehouse].[dbo].[silver.freshservice_departments_curated] f
  ON a.department_id = f.[id]        
  LEFT JOIN [SilverZoneLakehouse].[dbo].[silver.freshservice_agents_curated] g
  ON a.requester_id = g.[id]      
  LEFT JOIN [SilverZoneLakehouse].[dbo].[silver.freshservice_agents_curated] h
  ON a.requested_for_id = h.[id]      
  LEFT JOIN [SilverZoneLakehouse].[dbo].[silver.freshservice_agents_curated] i
  ON a.responder_id = i.[id]    
;

GO


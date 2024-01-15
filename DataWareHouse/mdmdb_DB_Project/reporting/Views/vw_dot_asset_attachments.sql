SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- DROP VIEW [reporting].[vw_dot_asset_attachments];
CREATE VIEW [reporting].[vw_dot_asset_attachments] AS
SELECT  document_id, default_attachment, file_name, file_type, asset_num, 
        kex_expiration_datetime, [name], notes, parent_asset_num, [path], 
        restriction, type_id
FROM reporting.D365_AssetAttachments
where kex_expiration_datetime >= getdate()
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
DROP TABLE IF EXISTS [dbo].[D365_General_Journal_entry_temp]
GO
DROP INDEX IF EXISTS [IDX_D365_General_Journal_entry_temp_GL_ACCOUNT] ON [dbo].[D365_General_Journal_entry_temp]
GO
DROP INDEX IF EXISTS [IDX_D365_General_Journal_entry_temp_LEDGERACCOUNT] ON [dbo].[D365_General_Journal_entry_temp]
GO
DROP INDEX IF EXISTS [IDX_D365_General_Journal_entry_temp_VOUCHER] ON [dbo].[D365_General_Journal_entry_temp]
GO
DROP INDEX IF EXISTS [IDX_D365_General_Journal_entry_temp_FN_LOC] ON [dbo].[D365_General_Journal_entry_temp]
GO


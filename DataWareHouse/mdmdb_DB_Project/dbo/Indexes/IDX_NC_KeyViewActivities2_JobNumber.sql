SET ANSI_PADDING ON
GO
DROP INDEX IF EXISTS [dbo].[IDX_NC_KeyViewActivities2_JobNumber]
GO
CREATE NONCLUSTERED INDEX [IDX_NC_KeyViewActivities2_JobNumber]
ON [dbo].[KeyView_Activities2] ([JobNumber])
INCLUDE ([Well_Name],[Rig],[ActivityStartTime],[ActivityEndTime],[Activity_Description],[CustomerOrgUnit]);

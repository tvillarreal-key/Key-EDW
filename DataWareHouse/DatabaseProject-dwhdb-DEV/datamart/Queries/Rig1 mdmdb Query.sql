-- With PostRigCountStatus = 643
-- Without PostRigCountStatus = 61,930
SELECT [Source_LastUpdateDate]
      ,[Source_LastUpdateBy]
  FROM [dbo].[MDM_Assets]
/*  WHERE [Source_LastUpdateBy] != 'PostRigCountStatus'
   OR  [Source_LastUpdateBy] IS NULL */
WHERE [Source_LastUpdateBy] = 'PostRigCountStatus'  
;


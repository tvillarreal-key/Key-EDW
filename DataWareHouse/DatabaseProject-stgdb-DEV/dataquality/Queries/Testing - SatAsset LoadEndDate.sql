SELECT [AssetsHashKey], Count(*) CNT, max(LoadDate) MAXLoadDate, max(LoadEndDate) MAXLoadEndDate
--      ,[LoadDate]
  FROM [datavault].[SatAsset]
  WHERE LoadEndDate IS NULL
--WHERE AssetsHashKey IN ('0a42f9b1544e065e0db8580c740aa85e')
GROUP BY [AssetsHashKey]
HAVING COUNT(*) > 1
ORDER BY 2 DESC, 1 ASC
;

SELECT *
  FROM [datavault].[SatAsset]
  --WHERE LoadEndDate IS NULL
WHERE AssetsHashKey IN ('5e19c39917980cb25dfb3da4df75b07b','d2e2f3ceb1db690e7713219c21bc0cc6')
--WHERE LoadEndDate IS NOT NULL
ORDER BY 1 DESC, 2 DESC, 3 DESC
;

-- Select duplicate Hashkeys with NULL LoadEndDate
SELECT [AssetsHashKey]
      ,[LoadEndDate]
      ,[LoadDate]
  FROM [datavault].[SatAsset]
  WHERE AssetsHashKey IN (
    '0a42f9b1544e065e0db8580c740aa85e'
  )
  ORDER BY 1 ASC,3 DESC
  ;
  
-- Select duplicate Hashkeys with NULL LoadEndDate
SELECT [AssetsHashKey]
      ,[LoadEndDate]
      ,COUNT(*) CNT
  FROM [datavault].[SatAsset]
  WHERE [LoadEndDate] IS NULL
  GROUP BY [AssetsHashKey],[LoadEndDate]
  HAVING COUNT(AssetsHashKey) > 1
  ORDER BY 1 ASC
  ;

--UPDATE [datavault].[SatAsset]
   SET [LoadEndDate] = (
      SELECT DATEADD(ss,-1,MIN(z.LoadDate))
      FROM [datavault].[SatAsset] z 
      WHERE z.AssetsHashKey = a.AssetsHashKey
         AND z.LoadDate > a.LoadDate
      )
  FROM [datavault].[SatAsset] a 
  WHERE [LoadEndDate] IS NULL
      AND a.AssetsHashKey IN (
        SELECT [AssetsHashKey]
        FROM [datavault].[SatAsset]
        WHERE [LoadEndDate] IS NULL
        GROUP BY [AssetsHashKey],[LoadEndDate]
        HAVING COUNT(AssetsHashKey) > 1
      )
;

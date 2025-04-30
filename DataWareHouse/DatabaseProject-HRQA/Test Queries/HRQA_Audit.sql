SELECT '[staging].[GR8P_EIN_LOOKUP]' JOB, MAX(CAST(LoadDate AS DATE)) MAXDT, FORMAT(COUNT(*), 'N0') AS CNT 
  FROM [staging].[GR8P_EIN_LOOKUP]
UNION
  SELECT '[raw].[GR8P_EIN_LOOKUP]' JOB, MAX(CAST(LoadDate AS DATE)) MAXDT, FORMAT(COUNT(*), 'N0') AS CNT 
  FROM [raw].[GR8P_EIN_LOOKUP]
UNION
  SELECT '[curated].[GR8P_EIN_LOOKUP]' JOB, MAX(CAST(LoadDate AS DATE)) MAXDT, FORMAT(COUNT(*), 'N0') AS CNT 
  FROM [curated].[GR8P_EIN_LOOKUP]
UNION
  SELECT '[staging].[GR8P_CandidateJobTracking]' JOB, MAX(CAST(LoadDate AS DATE)) MAXDT, FORMAT(COUNT(*), 'N0') AS CNT 
  FROM [staging].[GR8P_CandidateJobTracking]
UNION
  SELECT '[raw].[GR8P_CandidateJobTracking]' JOB, MAX(CAST(LoadDate AS DATE)) MAXDT, FORMAT(COUNT(*), 'N0') AS CNT 
  FROM [raw].[GR8P_CandidateJobTracking]
UNION
  SELECT '[curated].[GR8P_CandidateJobTracking]' JOB, MAX(CAST(LoadDate AS DATE)) MAXDT, FORMAT(COUNT(*), 'N0') AS CNT 
  FROM [curated].[GR8P_CandidateJobTracking]
;

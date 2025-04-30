SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
DROP TABLE IF EXISTS[raw].[GR8P_CandidateJobTracking]
GO
CREATE TABLE [raw].[GR8P_CandidateJobTracking](
	[HashKey] [nvarchar](32) NOT NULL,
	[ChkSum] [nvarchar](32) NOT NULL,
	[LoadDate] [datetime2](7) NOT NULL,
	[SourceSystem] [nvarchar](50) NOT NULL,    
	[JobID] [int] NOT NULL,
	[DateOpened] [datetime2](3) NULL,
	[DateCreated] [datetime2](3) NULL,
	[JobStatus] [varchar](50) NULL,
	[PositionTitle] [varchar](100) NULL,
	[JobCategory] [varchar](100) NULL,
	[Location] [varchar](100) NULL,
	[HiringManager] [varchar](100) NULL,
	[Recruiter] [varchar](100) NULL,
	[Marketplace] [varchar](100) NULL,
	[ManagementDistrict] [varchar](100) NULL,
	[CostLocation] [varchar](100) NULL,
	[LOB] [varchar](100) NULL,
	[ReasonForJob] [varchar](100) NULL,
	[PersonID] [varchar](20) NULL,
	[CandidateName] [varchar](100) NULL,
	[City] [varchar](100) NULL,
	[Abbreviation] [varchar](10) NULL,
	[Ethnicity] [varchar](100) NULL,
	[Gender] [varchar](50) NULL,
	[DL] [varchar](50) NULL,
	[Experience] [varchar](100) NULL,
	[EducationType] [varchar](100) NULL,
	[VeteranStatus_Description] [varchar](100) NULL,
	[AverageIndustryExperienceYears] [varchar](10) NULL,
	[Employer] [varchar](max) NULL,
	[PrevPositionTitle] [varchar](max) NULL,
	[ReferredBy] [varchar](100) NULL,
	[ReferralBonus] [varchar](20) NULL,
	[Source] [varchar](100) NULL,
	[SubmittalDate] [datetime2](3) NULL,
	[ActivityStatus] [varchar](100) NULL,
	[DispositionCode] [varchar](100) NULL,
	[ActivityDate] [datetime2](3) NULL,
	[FunnelStatus] [varchar](100) NULL,
	[CandidateType] [varchar](100) NULL,
	[OfferAcceptDate] [datetime2](3) NULL,
	[StartDate] [datetime2](3) NULL,
	[Employer_Resized] [varchar](150) NULL,
	[PrevPositionTitle_Resized] [varchar](200) NULL
) ON [PRIMARY] 
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [reporting].[Motive_IFTA_Trips](
	[id] [bigint] NOT NULL,
	[date] [date] NULL,
	[jurisdiction] [nvarchar](5) NOT NULL,
	[vehicle_id] [int] NOT NULL,
	[asset_num] [nvarchar](20) NOT NULL,
	[year] [int] NULL,
	[make] [nvarchar](20) NULL,
	[model] [nvarchar](50) NULL,
	[vin] [nvarchar](20) NULL,
	[metric_units] [nvarchar](5) NULL,
	[start_odometer] [numeric](20, 12) NULL,
	[end_odometer] [numeric](20, 12) NULL,
	[start_lat] [numeric](12, 7) NULL,
	[start_lon] [numeric](12, 7) NULL,
	[end_lat] [numeric](12, 7) NULL,
	[end_lon] [numeric](12, 7) NULL,
	[distance] [numeric](20, 12) NULL,
	[time_zone] [nvarchar](50) NULL,
	[dvir_record] [bit] NULL,
	[upload_date] [datetime] NULL
) ON [PRIMARY]
GO

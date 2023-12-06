--DROP View [dbo].[Motus_View]
Create View [dbo].[Motus_View] AS (
SELECT distinct m.EIN, m.Last_Name, m.First_Name, e.LOC_CODE as Location, e.LEVEL1_CODE as LVL1, e.LEVEL2_CODE as LVL2, e.MP_CODE as Market_Place, mgr.FIRST_NAME + ' ' + mgr.LAST_NAME as Manager_Name, m.Mileage, m.[Date]
FROM [dbo].[MotusMiles] m
join [dbo].[Employees] e on m.EIN = e.EIN
join [dbo].[Employees] mgr on mgr.EIN = e.MANAGER_ID)
GO


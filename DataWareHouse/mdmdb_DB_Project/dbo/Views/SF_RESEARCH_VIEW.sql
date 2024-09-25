


--DROP VIEW [dbo].[SF_RESEARCH_VIEW]
CREATE VIEW [dbo].[SF_RESEARCH_VIEW]
AS
SELECT STI.[Ticket_Number2__c], 
ST.[FX5__Ticket_Date__c],
ST.[Customer__c],
SJ.[Name] as Job_Name, -- Job Name
ST.[Name] as Ticket_Id,  -- Ticket Id
STI.[Name] AS Ticket_Item_Id, --Ticket Item Id
STI.[FX5__Parent_Ticket_Item__c],
STI.[Item_Code_Description__c],
STI.[Qty__c],
STI.[Customer_Price__c],
STI.[Revenue_Total__c],
ST.[Status_Name__c],
STI.[Asset_Number__c] As Ticket_Item_Asset_#,
ST.[FX5__Office__c],
STI.[Line_Asset_Number__c],
SJ.[LOCO__c],
STI.[LCO__c],
STI.[Level_1__c],
STI.[Level_2__c],
STI.[FX5__Override__c],-- Unable to find Asset Override: Name.  Not sure if this is the same.
STI.[Asset_Description__c],
STI.[Asset_Utilization_Hours__c],
STI.[Parent_Item_Record_Type__c],
STI.[Type__c],
ST.[CreatedDate],
ST.[CreatedById], -- Need to convert ID to a name  Use this field to connect to the User Object via Id field and pull the Name field.
ST.[AFE_Requirements__c], --- AFE #?
STI.[AFE_Requirements__c] as Ticket_ITEM_AFE_REQ,  --- AFE #?
ST.[Asset_Number__c],
--SJ.[Bill_To__c], -- Use to link to the Id field in the Account object.  It has Name and Site
SA.[Name] AS Account_Name,-- Could not find bill to Account Name on ticket.  
SA.[Site],-- Could not find bill to Site on ticket.  ST.[Site__c], was not a fit.
ST.[Contract_Requirements__c] AS Contract_Number,
ST.[Requestor_Requirements__c],
ST.[PO_Requirements__c],  -- PO #?
ST.[General_Ledger_ID_Requirements__c],  -- General Ledger ID
ST.[Purchasing_Group_Requirements__c],
ST.[Cost_Center_Requirements__c],
ST.[Pricing_Agreement__c],  -- Could not find on Job, but found on Ticket
ST.[Job_Class__c],
ST.[Service_Type__c],
SI.[Invoice_Number__c],  
SI.[FX5__Invoice_Date__c],  
ST.[EFT_Ticket_Type__c],
ST.[EFT_Work_Description__c],
STI.[PO_Line_Requirements__c] AS PO_Line_#, 
STI.[Additional_Description__c],
STI.[Ticket_Record_Type__c],
STI.[Item_Record_Type__c],
ST.[Marketplace__c],
--*************
CASE ST.[Multi_Day_Ticket_Temp__c]
	When 0 THEN 'Unchecked'
	ELSE 'Checked'
END AS Multi_Day_Ticket,  
ST.[Parent_Ticket__c],
SJ.[Customer_Formula__c],
SJ.[OfficeServiceType__c],
SJ.[Well_Name__c],
SJ.[State__c] AS Job_State,
ST.[State__c] As Ticket_State,
ST.[County__c],
ST.[Well_API__c],
ST.[Contact__c],
ST.[Other_EDI_Info_Requirements__c],
ST.[Key_Ticket_Number_Formatted__c],
ST.Ticket_Number__c,
ST.[Site__c],
ST.[Customer_Email__c],
ST.[Approver_Requirements__c] AS Customer_Approver,
STI.[FX5__Item_Code__c],
STI.[FX5__Catalog_UOM__c],
STI.[Extended_Amount__c],  -- Extended Total?
STI.[WBS_Element_Requirements__c],
STI.[Cost_Center_Requirements__c] As Ticket_Item_Cost_Center_Req,
STI.[Network_Activity_Requirements__c],
STI.[KES_ID_Requirements__c],
ST.[No_Signature_Required__c],
STI.[Start_Date_TI__c],
STI.[End_Date__c],
ST.[Name] As Ticket_Number_Id,  -- Ticket Number ID
ST.[Contract_Requirements__c],
ST.[Work_Order__c],
ST.[Single_Day_Ticket__c],
ST.[Correction_Required__c],
ST.[Void_Reason__c],
ST.[Grouping__c],
ST.[Dispatcher_Notes__c],
ST.[FX5__Notes__c],
SI.[Name]
FROM [dbo].[Salesforce_Tickets] ST
LEFT OUTER JOIN [dbo].[Salesforce_Ticket_Item] STI ON ST.Ticket_Number__c = STI.[Ticket_Number2__c]
LEFT OUTER JOIN [dbo].[Salesforce_Jobs] SJ ON ST.[FX5__Job__c] = SJ.Id
LEFT OUTER JOIN [dbo].[Salesforce_Invoice] SI ON ST.[Invoice__c] = SI.[ID]
LEFT OUTER JOIN [dbo].[Salesforce_Account] SA ON SJ.[Bill_To__c] = SA.[ID]
--WHERE ST.[FX5__Ticket_Date__c] > '08/16/2023'
--WHERE ST.[FX5__Ticket_Date__c] > '08/16/2023'
--WHERE ST.[FX5__Ticket_Date__c] > '08/16/2023'
GO


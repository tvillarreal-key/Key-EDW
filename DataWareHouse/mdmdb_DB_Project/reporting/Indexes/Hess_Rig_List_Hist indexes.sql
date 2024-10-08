CREATE INDEX IDX_Hess_Rig_List_Hist_RIG_OPDATE
ON reporting.Hess_Rig_List_Hist (RIG, OPDATE);

CREATE INDEX IDX_Hess_Rig_List_Hist_RIG_OPDATE_RIGTYPE
ON reporting.Hess_Rig_List_Hist (RIG, OPDATE)
INCLUDE (RIGTYPE);

CREATE INDEX IDX_Hess_Rig_List_Hist_RIG
ON reporting.Hess_Rig_List_Hist (RIG);


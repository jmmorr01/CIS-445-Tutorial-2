*------------------------------------------------------------*;
* Data Source Setup;
*------------------------------------------------------------*;
libname EMWS1 "J:\JMMORR01\CIS 445\Tutorial 2\My Project\Workspaces\EMWS1";
*------------------------------------------------------------*;
* Ids2: Creating DATA data;
*------------------------------------------------------------*;
data EMWS1.Ids2_DATA (label="All: Home-Equity Loan Scoring Data")
/ view=EMWS1.Ids2_DATA
;
set SAMPSIO.DMAHMEQ;
run;

*------------------------------------------------------------* ;
* EM: DMDBClass Macro ;
*------------------------------------------------------------* ;
%macro DMDBClass;
    BAD(DESC) JOB(ASC) REASON(ASC)
%mend DMDBClass;
*------------------------------------------------------------* ;
* EM: DMDBVar Macro ;
*------------------------------------------------------------* ;
%macro DMDBVar;
    CLAGE CLNO DELINQ LOAN MORTDUE NINQ VALUE YOJ
%mend DMDBVar;
*------------------------------------------------------------*;
* EM: Create DMDB;
*------------------------------------------------------------*;
libname _spdslib SPDE "C:\Users\jmmorr01\AppData\Local\Temp\SAS Temporary Files\_TD10576_COB-MBA021_\Prc2";
proc dmdb batch data=EMWS1.Part_TRAIN
dmdbcat=WORK.EM_DMDB
maxlevel = 101
out=_spdslib.EM_DMDB
;
class %DMDBClass;
var %DMDBVar;
target
BAD
;
run;
quit;
*------------------------------------------------------------* ;
* Varsel: Input Variables Macro ;
*------------------------------------------------------------* ;
%macro INPUTS;
    CLAGE CLNO DELINQ JOB LOAN MORTDUE NINQ REASON VALUE YOJ
%mend INPUTS;
proc dmine data=_spdslib.EM_DMDB dmdbcat=WORK.EM_DMDB
minr2=0.005 maxrows=3000 stopr2=0.0005 NOAOV16 NOINTER USEGROUPS OUTGROUP=EMWS1.Varsel_OUTGROUP outest=EMWS1.Varsel_OUTESTDMINE outeffect=EMWS1.Varsel_OUTEFFECT outrsquare =EMWS1.Varsel_OUTRSQUARE
NOMONITOR
PSHORT
;
var %INPUTS;
target BAD;
code file="J:\JMMORR01\CIS 445\Tutorial 2\My Project\Workspaces\EMWS1\Varsel\EMFLOWSCORE.sas";
code file="J:\JMMORR01\CIS 445\Tutorial 2\My Project\Workspaces\EMWS1\Varsel\EMPUBLISHSCORE.sas";
run;
quit;
/*      proc print data =EMWS1.Varsel_OUTEFFECT;      proc print data =EMWS1.Varsel_OUTRSQUARE;      */
run;

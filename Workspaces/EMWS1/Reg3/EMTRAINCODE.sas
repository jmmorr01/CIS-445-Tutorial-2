*------------------------------------------------------------*;
* Reg3: Create decision matrix;
*------------------------------------------------------------*;
data WORK.BAD;
  length   BAD                              $  32
           COUNT                                8
           DATAPRIOR                            8
           TRAINPRIOR                           8
           DECPRIOR                             8
           DECISION1                            8
           DECISION2                            8
           ;

  label    COUNT="Level Counts"
           DATAPRIOR="Data Proportions"
           TRAINPRIOR="Training Proportions"
           DECPRIOR="Decision Priors"
           DECISION1="1"
           DECISION2="0"
           ;
  format   COUNT 10.
           ;
BAD="1"; COUNT=1189; DATAPRIOR=0.1994966442953; TRAINPRIOR=0.1994966442953; DECPRIOR=.; DECISION1=1; DECISION2=0;
output;
BAD="0"; COUNT=4771; DATAPRIOR=0.80050335570469; TRAINPRIOR=0.80050335570469; DECPRIOR=.; DECISION1=0; DECISION2=1;
output;
;
run;
proc datasets lib=work nolist;
modify BAD(type=PROFIT label=BAD);
label DECISION1= '1';
label DECISION2= '0';
run;
quit;
data EM_DMREG / view=EM_DMREG;
set EMWS1.BINNING_TRAIN(keep=
BAD GRP_INDELINQ GRP_INDEROG GRP_JOB GRP_LOG_CLAGE GRP_LOG_CLNO
GRP_LOG_DEBTINC GRP_LOG_DELINQ GRP_LOG_DEROG GRP_LOG_LOAN GRP_LOG_MORTDUE
GRP_LOG_VALUE GRP_LOG_YOJ GRP_NINQ GRP_REASON );
run;
*------------------------------------------------------------* ;
* Reg3: DMDBClass Macro ;
*------------------------------------------------------------* ;
%macro DMDBClass;
    BAD(DESC) GRP_INDELINQ(ASC) GRP_INDEROG(ASC) GRP_JOB(ASC) GRP_LOG_CLAGE(ASC)
   GRP_LOG_CLNO(ASC) GRP_LOG_DEBTINC(ASC) GRP_LOG_DELINQ(ASC) GRP_LOG_DEROG(ASC)
   GRP_LOG_LOAN(ASC) GRP_LOG_MORTDUE(ASC) GRP_LOG_VALUE(ASC) GRP_LOG_YOJ(ASC)
   GRP_NINQ(ASC) GRP_REASON(ASC)
%mend DMDBClass;
*------------------------------------------------------------* ;
* Reg3: DMDBVar Macro ;
*------------------------------------------------------------* ;
%macro DMDBVar;

%mend DMDBVar;
*------------------------------------------------------------*;
* Reg3: Create DMDB;
*------------------------------------------------------------*;
proc dmdb batch data=WORK.EM_DMREG
dmdbcat=WORK.Reg3_DMDB
maxlevel = 513
;
class %DMDBClass;
var %DMDBVar;
target
BAD
;
run;
quit;
*------------------------------------------------------------*;
* Reg3: Run DMREG procedure;
*------------------------------------------------------------*;
proc dmreg data=EM_DMREG dmdbcat=WORK.Reg3_DMDB
validata = EMWS1.BINNING_VALIDATE
outest = EMWS1.Reg3_EMESTIMATE
outterms = EMWS1.Reg3_OUTTERMS
outmap= EMWS1.Reg3_MAPDS namelen=200
;
class
BAD
GRP_INDELINQ
GRP_INDEROG
GRP_JOB
GRP_LOG_CLAGE
GRP_LOG_CLNO
GRP_LOG_DEBTINC
GRP_LOG_DELINQ
GRP_LOG_DEROG
GRP_LOG_LOAN
GRP_LOG_MORTDUE
GRP_LOG_VALUE
GRP_LOG_YOJ
GRP_NINQ
GRP_REASON
;
model BAD =
GRP_INDELINQ
GRP_INDEROG
GRP_JOB
GRP_LOG_CLAGE
GRP_LOG_CLNO
GRP_LOG_DEBTINC
GRP_LOG_DELINQ
GRP_LOG_DEROG
GRP_LOG_LOAN
GRP_LOG_MORTDUE
GRP_LOG_VALUE
GRP_LOG_YOJ
GRP_NINQ
GRP_REASON
/error=binomial link=LOGIT
coding=DEVIATION
nodesignprint
selection=FORWARD choose=NONE
Hierarchy=CLASS
Rule=NONE
SlEntry=0.05
SlStay=0.025
Start=10
include=0
MaxStep=0
;
;
score data=EMWS1.BINNING_TEST
out=_null_
outfit=EMWS1.Reg3_FITTEST
role = TEST
;
code file="J:\JMMORR01\CIS 445\Tutorial 2\My Project\Workspaces\EMWS1\Reg3\EMPUBLISHSCORE.sas"
group=Reg3
;
code file="J:\JMMORR01\CIS 445\Tutorial 2\My Project\Workspaces\EMWS1\Reg3\EMFLOWSCORE.sas"
group=Reg3
residual
;
run;
quit;

*------------------------------------------------------------*;
* Reg2: Create decision matrix;
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
set EMWS1.Impt_TRAIN(keep=
BAD IMP_CLAGE IMP_CLNO IMP_DEBTINC IMP_DELINQ IMP_DEROG IMP_JOB IMP_MORTDUE
IMP_NINQ IMP_REASON IMP_VALUE IMP_YOJ LOAN M_CLAGE M_CLNO M_DEBTINC M_DELINQ
M_DEROG M_JOB M_MORTDUE M_NINQ M_REASON M_VALUE M_YOJ );
run;
*------------------------------------------------------------* ;
* Reg2: DMDBClass Macro ;
*------------------------------------------------------------* ;
%macro DMDBClass;
    BAD(DESC) IMP_JOB(ASC) IMP_REASON(ASC) M_CLAGE(ASC) M_CLNO(ASC) M_DEBTINC(ASC)
   M_DELINQ(ASC) M_DEROG(ASC) M_JOB(ASC) M_MORTDUE(ASC) M_NINQ(ASC) M_REASON(ASC)
   M_VALUE(ASC) M_YOJ(ASC)
%mend DMDBClass;
*------------------------------------------------------------* ;
* Reg2: DMDBVar Macro ;
*------------------------------------------------------------* ;
%macro DMDBVar;
    IMP_CLAGE IMP_CLNO IMP_DEBTINC IMP_DELINQ IMP_DEROG IMP_MORTDUE IMP_NINQ
   IMP_VALUE IMP_YOJ LOAN
%mend DMDBVar;
*------------------------------------------------------------*;
* Reg2: Create DMDB;
*------------------------------------------------------------*;
proc dmdb batch data=WORK.EM_DMREG
dmdbcat=WORK.Reg2_DMDB
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
* Reg2: Run DMREG procedure;
*------------------------------------------------------------*;
proc dmreg data=EM_DMREG dmdbcat=WORK.Reg2_DMDB
validata = EMWS1.Impt_VALIDATE
outest = EMWS1.Reg2_EMESTIMATE
outterms = EMWS1.Reg2_OUTTERMS
outmap= EMWS1.Reg2_MAPDS namelen=200
;
class
BAD
IMP_JOB
IMP_REASON
M_CLAGE
M_CLNO
M_DEBTINC
M_DELINQ
M_DEROG
M_JOB
M_MORTDUE
M_NINQ
M_REASON
M_VALUE
M_YOJ
;
model BAD =
IMP_CLAGE
IMP_CLNO
IMP_DEBTINC
IMP_DELINQ
IMP_DEROG
IMP_JOB
IMP_MORTDUE
IMP_NINQ
IMP_REASON
IMP_VALUE
IMP_YOJ
LOAN
M_CLAGE
M_CLNO
M_DEBTINC
M_DELINQ
M_DEROG
M_JOB
M_MORTDUE
M_NINQ
M_REASON
M_VALUE
M_YOJ
/error=binomial link=LOGIT
coding=DEVIATION
nodesignprint
;
;
score data=EMWS1.Impt_TEST
out=_null_
outfit=EMWS1.Reg2_FITTEST
role = TEST
;
code file="J:\JMMORR01\CIS 445\Tutorial 2\My Project\Workspaces\EMWS1\Reg2\EMPUBLISHSCORE.sas"
group=Reg2
;
code file="J:\JMMORR01\CIS 445\Tutorial 2\My Project\Workspaces\EMWS1\Reg2\EMFLOWSCORE.sas"
group=Reg2
residual
;
run;
quit;

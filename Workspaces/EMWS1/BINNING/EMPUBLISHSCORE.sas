length _UFormat $200;
drop _UFormat;
_UFormat='';

*------------------------------------------------------------*;
* Variable: INDELINQ;
*------------------------------------------------------------*;
LABEL GRP_INDELINQ = "Grouped: INDELINQ";

if MISSING(INDELINQ) then do;
GRP_INDELINQ = 1;
end;
else if NOT MISSING(INDELINQ) then do;
if INDELINQ < 0 then do;
GRP_INDELINQ = 2;
end;
else
if 0 <= INDELINQ AND INDELINQ < 0.5 then do;
GRP_INDELINQ = 3;
end;
else
if 0.5 <= INDELINQ then do;
GRP_INDELINQ = 4;
end;
end;

*------------------------------------------------------------*;
* Variable: INDEROG;
*------------------------------------------------------------*;
LABEL GRP_INDEROG = "Grouped: INDEROG";

if MISSING(INDEROG) then do;
GRP_INDEROG = 1;
end;
else if NOT MISSING(INDEROG) then do;
if INDEROG < 0 then do;
GRP_INDEROG = 2;
end;
else
if 0 <= INDEROG AND INDEROG < 0.5 then do;
GRP_INDEROG = 3;
end;
else
if 0.5 <= INDEROG then do;
GRP_INDEROG = 4;
end;
end;

*------------------------------------------------------------*;
* Variable: LOG_CLAGE;
*------------------------------------------------------------*;
LABEL GRP_LOG_CLAGE =
'Grouped: Transformed CLAGE';

if MISSING(LOG_CLAGE) then do;
GRP_LOG_CLAGE = 1;
end;
else if NOT MISSING(LOG_CLAGE) then do;
if LOG_CLAGE < 4.77 then do;
GRP_LOG_CLAGE = 2;
end;
else
if 4.77 <= LOG_CLAGE AND LOG_CLAGE < 5.17 then do;
GRP_LOG_CLAGE = 3;
end;
else
if 5.17 <= LOG_CLAGE AND LOG_CLAGE < 5.46 then do;
GRP_LOG_CLAGE = 4;
end;
else
if 5.46 <= LOG_CLAGE then do;
GRP_LOG_CLAGE = 5;
end;
end;

*------------------------------------------------------------*;
* Variable: LOG_CLNO;
*------------------------------------------------------------*;
LABEL GRP_LOG_CLNO =
'Grouped: Transformed CLNO';

if MISSING(LOG_CLNO) then do;
GRP_LOG_CLNO = 1;
end;
else if NOT MISSING(LOG_CLNO) then do;
if LOG_CLNO < 2.71 then do;
GRP_LOG_CLNO = 2;
end;
else
if 2.71 <= LOG_CLNO AND LOG_CLNO < 3.04 then do;
GRP_LOG_CLNO = 3;
end;
else
if 3.04 <= LOG_CLNO AND LOG_CLNO < 3.3 then do;
GRP_LOG_CLNO = 4;
end;
else
if 3.3 <= LOG_CLNO then do;
GRP_LOG_CLNO = 5;
end;
end;

*------------------------------------------------------------*;
* Variable: LOG_DEBTINC;
*------------------------------------------------------------*;
LABEL GRP_LOG_DEBTINC =
'Grouped: Transformed DEBTINC';

if MISSING(LOG_DEBTINC) then do;
GRP_LOG_DEBTINC = 1;
end;
else if NOT MISSING(LOG_DEBTINC) then do;
if LOG_DEBTINC < 3.4 then do;
GRP_LOG_DEBTINC = 2;
end;
else
if 3.4 <= LOG_DEBTINC AND LOG_DEBTINC < 3.58 then do;
GRP_LOG_DEBTINC = 3;
end;
else
if 3.58 <= LOG_DEBTINC AND LOG_DEBTINC < 3.69 then do;
GRP_LOG_DEBTINC = 4;
end;
else
if 3.69 <= LOG_DEBTINC then do;
GRP_LOG_DEBTINC = 5;
end;
end;

*------------------------------------------------------------*;
* Variable: LOG_DELINQ;
*------------------------------------------------------------*;
LABEL GRP_LOG_DELINQ =
'Grouped: Transformed DELINQ';

if MISSING(LOG_DELINQ) then do;
GRP_LOG_DELINQ = 1;
end;
else if NOT MISSING(LOG_DELINQ) then do;
if LOG_DELINQ < 0 then do;
GRP_LOG_DELINQ = 2;
end;
else
if 0 <= LOG_DELINQ then do;
GRP_LOG_DELINQ = 3;
end;
end;

*------------------------------------------------------------*;
* Variable: LOG_DEROG;
*------------------------------------------------------------*;
LABEL GRP_LOG_DEROG =
'Grouped: Transformed DEROG';

if MISSING(LOG_DEROG) then do;
GRP_LOG_DEROG = 1;
end;
else if NOT MISSING(LOG_DEROG) then do;
if LOG_DEROG < 0 then do;
GRP_LOG_DEROG = 2;
end;
else
if 0 <= LOG_DEROG then do;
GRP_LOG_DEROG = 3;
end;
end;

*------------------------------------------------------------*;
* Variable: LOG_LOAN;
*------------------------------------------------------------*;
LABEL GRP_LOG_LOAN =
'Grouped: Transformed LOAN';

if MISSING(LOG_LOAN) then do;
GRP_LOG_LOAN = 1;
end;
else if NOT MISSING(LOG_LOAN) then do;
if LOG_LOAN < 9.32 then do;
GRP_LOG_LOAN = 2;
end;
else
if 9.32 <= LOG_LOAN AND LOG_LOAN < 9.7 then do;
GRP_LOG_LOAN = 3;
end;
else
if 9.7 <= LOG_LOAN AND LOG_LOAN < 10.06 then do;
GRP_LOG_LOAN = 4;
end;
else
if 10.06 <= LOG_LOAN then do;
GRP_LOG_LOAN = 5;
end;
end;

*------------------------------------------------------------*;
* Variable: LOG_MORTDUE;
*------------------------------------------------------------*;
LABEL GRP_LOG_MORTDUE =
'Grouped: Transformed MORTDUE';

if MISSING(LOG_MORTDUE) then do;
GRP_LOG_MORTDUE = 1;
end;
else if NOT MISSING(LOG_MORTDUE) then do;
if LOG_MORTDUE < 10.74 then do;
GRP_LOG_MORTDUE = 2;
end;
else
if 10.74 <= LOG_MORTDUE AND LOG_MORTDUE < 11.07 then do;
GRP_LOG_MORTDUE = 3;
end;
else
if 11.07 <= LOG_MORTDUE AND LOG_MORTDUE < 11.44 then do;
GRP_LOG_MORTDUE = 4;
end;
else
if 11.44 <= LOG_MORTDUE then do;
GRP_LOG_MORTDUE = 5;
end;
end;

*------------------------------------------------------------*;
* Variable: LOG_VALUE;
*------------------------------------------------------------*;
LABEL GRP_LOG_VALUE =
'Grouped: Transformed VALUE';

if MISSING(LOG_VALUE) then do;
GRP_LOG_VALUE = 1;
end;
else if NOT MISSING(LOG_VALUE) then do;
if LOG_VALUE < 11.1 then do;
GRP_LOG_VALUE = 2;
end;
else
if 11.1 <= LOG_VALUE AND LOG_VALUE < 11.4 then do;
GRP_LOG_VALUE = 3;
end;
else
if 11.4 <= LOG_VALUE AND LOG_VALUE < 11.71 then do;
GRP_LOG_VALUE = 4;
end;
else
if 11.71 <= LOG_VALUE then do;
GRP_LOG_VALUE = 5;
end;
end;

*------------------------------------------------------------*;
* Variable: LOG_YOJ;
*------------------------------------------------------------*;
LABEL GRP_LOG_YOJ =
'Grouped: Transformed YOJ';

if MISSING(LOG_YOJ) then do;
GRP_LOG_YOJ = 1;
end;
else if NOT MISSING(LOG_YOJ) then do;
if LOG_YOJ < 1.39 then do;
GRP_LOG_YOJ = 2;
end;
else
if 1.39 <= LOG_YOJ AND LOG_YOJ < 2.08 then do;
GRP_LOG_YOJ = 3;
end;
else
if 2.08 <= LOG_YOJ AND LOG_YOJ < 2.64 then do;
GRP_LOG_YOJ = 4;
end;
else
if 2.64 <= LOG_YOJ then do;
GRP_LOG_YOJ = 5;
end;
end;

*------------------------------------------------------------*;
* Variable: NINQ;
*------------------------------------------------------------*;
LABEL GRP_NINQ = "Grouped: NINQ";

if MISSING(NINQ) then do;
GRP_NINQ = 1;
end;
else if NOT MISSING(NINQ) then do;
if NINQ < 1 then do;
GRP_NINQ = 1;
end;
else
if 1 <= NINQ AND NINQ < 2 then do;
GRP_NINQ = 2;
end;
else
if 2 <= NINQ AND NINQ < 2.5 then do;
GRP_NINQ = 3;
end;
else
if 2.5 <= NINQ then do;
GRP_NINQ = 4;
end;
end;

*------------------------------------------------------------*;
* Variable: JOB;
*------------------------------------------------------------*;
LABEL GRP_JOB = "Grouped: JOB";

_UFormat = JOB;
%dmnormip(_UFormat);
if MISSING(_UFORMAT) then do;
GRP_JOB = 1;
end;
else if NOT MISSING(_UFORMAT) then do;
%dmnormip(_UFormat);
if (_UFORMAT eq 'OTHER'
) then do;
GRP_JOB = 2;
end;
else
if (_UFORMAT eq 'PROFEXE'
) then do;
GRP_JOB = 3;
end;
else
if (_UFORMAT eq 'OFFICE'
) then do;
GRP_JOB = 4;
end;
else
if (_UFORMAT eq 'MGR'
) then do;
GRP_JOB = 5;
end;
else
if (_UFORMAT eq 'SELF'
) then do;
GRP_JOB = 6;
end;
else
if (_UFORMAT eq 'SALES'
) then do;
GRP_JOB = 7;
end;
else do;
GRP_JOB = 1;
end;
end;

*------------------------------------------------------------*;
* Variable: REASON;
*------------------------------------------------------------*;
LABEL GRP_REASON = "Grouped: REASON";

_UFormat = REASON;
%dmnormip(_UFormat);
if MISSING(_UFORMAT) then do;
GRP_REASON = 1;
end;
else if NOT MISSING(_UFORMAT) then do;
%dmnormip(_UFormat);
if (_UFORMAT eq 'DEBTCON'
) then do;
GRP_REASON = 2;
end;
else
if (_UFORMAT eq 'HOMEIMP'
) then do;
GRP_REASON = 3;
end;
else do;
GRP_REASON = 1;
end;
end;

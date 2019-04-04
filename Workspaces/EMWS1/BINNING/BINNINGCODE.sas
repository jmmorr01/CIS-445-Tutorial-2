*------------------------------------------------------------*;
* Generating Bins for interval variables;
*------------------------------------------------------------*;
if INDELINQ eq . then BIN_INDELINQ= .;
else do;
if INDELINQ < 0 then BIN_INDELINQ=1;
else if INDELINQ >= 0 then BIN_INDELINQ=2;
end;
if INDEROG eq . then BIN_INDEROG= .;
else do;
if INDEROG < 0 then BIN_INDEROG=1;
else if INDEROG >= 0 then BIN_INDEROG=2;
end;
if LOG_CLAGE eq . then BIN_LOG_CLAGE= .;
else do;
if LOG_CLAGE < 4.77 then BIN_LOG_CLAGE=1;
else if LOG_CLAGE < 5.17 then BIN_LOG_CLAGE=2;
else if LOG_CLAGE < 5.46 then BIN_LOG_CLAGE=3;
else if LOG_CLAGE >= 5.46 then BIN_LOG_CLAGE=4;
end;
if LOG_CLNO eq . then BIN_LOG_CLNO= .;
else do;
if LOG_CLNO < 2.71 then BIN_LOG_CLNO=1;
else if LOG_CLNO < 3.04 then BIN_LOG_CLNO=2;
else if LOG_CLNO < 3.3 then BIN_LOG_CLNO=3;
else if LOG_CLNO >= 3.3 then BIN_LOG_CLNO=4;
end;
if LOG_DEBTINC eq . then BIN_LOG_DEBTINC= .;
else do;
if LOG_DEBTINC < 3.4 then BIN_LOG_DEBTINC=1;
else if LOG_DEBTINC < 3.58 then BIN_LOG_DEBTINC=2;
else if LOG_DEBTINC < 3.69 then BIN_LOG_DEBTINC=3;
else if LOG_DEBTINC >= 3.69 then BIN_LOG_DEBTINC=4;
end;
if LOG_DELINQ eq . then BIN_LOG_DELINQ= .;
else do;
if LOG_DELINQ < 0 then BIN_LOG_DELINQ=1;
else if LOG_DELINQ >= 0 then BIN_LOG_DELINQ=2;
end;
if LOG_DEROG eq . then BIN_LOG_DEROG= .;
else do;
if LOG_DEROG < 0 then BIN_LOG_DEROG=1;
else if LOG_DEROG >= 0 then BIN_LOG_DEROG=2;
end;
if LOG_LOAN eq . then BIN_LOG_LOAN= .;
else do;
if LOG_LOAN < 9.32 then BIN_LOG_LOAN=1;
else if LOG_LOAN < 9.7 then BIN_LOG_LOAN=2;
else if LOG_LOAN < 10.06 then BIN_LOG_LOAN=3;
else if LOG_LOAN >= 10.06 then BIN_LOG_LOAN=4;
end;
if LOG_MORTDUE eq . then BIN_LOG_MORTDUE= .;
else do;
if LOG_MORTDUE < 10.74 then BIN_LOG_MORTDUE=1;
else if LOG_MORTDUE < 11.07 then BIN_LOG_MORTDUE=2;
else if LOG_MORTDUE < 11.44 then BIN_LOG_MORTDUE=3;
else if LOG_MORTDUE >= 11.44 then BIN_LOG_MORTDUE=4;
end;
if LOG_VALUE eq . then BIN_LOG_VALUE= .;
else do;
if LOG_VALUE < 11.1 then BIN_LOG_VALUE=1;
else if LOG_VALUE < 11.4 then BIN_LOG_VALUE=2;
else if LOG_VALUE < 11.71 then BIN_LOG_VALUE=3;
else if LOG_VALUE >= 11.71 then BIN_LOG_VALUE=4;
end;
if LOG_YOJ eq . then BIN_LOG_YOJ= .;
else do;
if LOG_YOJ < 1.39 then BIN_LOG_YOJ=1;
else if LOG_YOJ < 2.08 then BIN_LOG_YOJ=2;
else if LOG_YOJ < 2.64 then BIN_LOG_YOJ=3;
else if LOG_YOJ >= 2.64 then BIN_LOG_YOJ=4;
end;
if NINQ eq . then BIN_NINQ= .;
else do;
if NINQ < 0 then BIN_NINQ=1;
else if NINQ < 1 then BIN_NINQ=2;
else if NINQ < 2 then BIN_NINQ=3;
else if NINQ >= 2 then BIN_NINQ=4;
end;
drop
INDELINQ
INDEROG
LOG_CLAGE
LOG_CLNO
LOG_DEBTINC
LOG_DELINQ
LOG_DEROG
LOG_LOAN
LOG_MORTDUE
LOG_VALUE
LOG_YOJ
NINQ
;

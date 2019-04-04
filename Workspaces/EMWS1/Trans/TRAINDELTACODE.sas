
if NAME="LOG_CLAGE" then do;
   COMMENT = "log(CLAGE  + 1) ";
ROLE ="INPUT";
REPORT ="N";
LEVEL  ="INTERVAL";
end;
if NAME="CLAGE" then delete;

if NAME="LOG_CLNO" then do;
   COMMENT = "log(CLNO  + 1) ";
ROLE ="INPUT";
REPORT ="N";
LEVEL  ="INTERVAL";
end;
if NAME="CLNO" then delete;

if NAME="LOG_DEBTINC" then do;
   COMMENT = "log(DEBTINC  + 1) ";
ROLE ="INPUT";
REPORT ="N";
LEVEL  ="INTERVAL";
end;
if NAME="DEBTINC" then delete;

if NAME="LOG_DELINQ" then do;
   COMMENT = "log(DELINQ  + 1) ";
ROLE ="INPUT";
REPORT ="N";
LEVEL  ="INTERVAL";
end;
if NAME="DELINQ" then delete;

if NAME="LOG_DEROG" then do;
   COMMENT = "log(DEROG  + 1) ";
ROLE ="INPUT";
REPORT ="N";
LEVEL  ="INTERVAL";
end;
if NAME="DEROG" then delete;

if NAME="LOG_LOAN" then do;
   COMMENT = "log(LOAN  + 1) ";
ROLE ="INPUT";
REPORT ="N";
LEVEL  ="INTERVAL";
end;
if NAME="LOAN" then delete;

if NAME="LOG_MORTDUE" then do;
   COMMENT = "log(MORTDUE  + 1) ";
ROLE ="INPUT";
REPORT ="N";
LEVEL  ="INTERVAL";
end;
if NAME="MORTDUE" then delete;

if NAME="LOG_VALUE" then do;
   COMMENT = "log(VALUE  + 1) ";
ROLE ="INPUT";
REPORT ="N";
LEVEL  ="INTERVAL";
end;
if NAME="VALUE" then delete;

if NAME="LOG_YOJ" then do;
   COMMENT = "log(YOJ  + 1) ";
ROLE ="INPUT";
REPORT ="N";
LEVEL  ="INTERVAL";
end;
if NAME="YOJ" then delete;

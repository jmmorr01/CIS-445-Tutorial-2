else 
if NAME  = "M_BAD " then do;
   ROLE  ="INPUT";
   LEVEL ="UNARY";
 end;
if NAME = "CLAGE" then delete;
else 
if NAME    = "IMP_CLAGE"  then do;
   ROLE    = "INPUT" ;
   FAMILY  = "" ;
   REPORT  = "N" ;
   LEVEL   = "INTERVAL" ;
   ORDER   = "" ;
end;
else 
if NAME  = "M_CLAGE " then do;
   ROLE  ="INPUT";
   LEVEL ="BINARY";
 end;
if NAME = "CLNO" then delete;
else 
if NAME    = "IMP_CLNO"  then do;
   ROLE    = "INPUT" ;
   FAMILY  = "" ;
   REPORT  = "N" ;
   LEVEL   = "INTERVAL" ;
   ORDER   = "" ;
end;
else 
if NAME  = "M_CLNO " then do;
   ROLE  ="INPUT";
   LEVEL ="BINARY";
 end;
if NAME = "DEBTINC" then delete;
else 
if NAME    = "IMP_DEBTINC"  then do;
   ROLE    = "INPUT" ;
   FAMILY  = "" ;
   REPORT  = "N" ;
   LEVEL   = "INTERVAL" ;
   ORDER   = "" ;
end;
else 
if NAME  = "M_DEBTINC " then do;
   ROLE  ="INPUT";
   LEVEL ="BINARY";
 end;
if NAME = "DELINQ" then delete;
else 
if NAME    = "IMP_DELINQ"  then do;
   ROLE    = "INPUT" ;
   FAMILY  = "" ;
   REPORT  = "N" ;
   LEVEL   = "INTERVAL" ;
   ORDER   = "" ;
end;
else 
if NAME  = "M_DELINQ " then do;
   ROLE  ="INPUT";
   LEVEL ="BINARY";
 end;
if NAME = "DEROG" then delete;
else 
if NAME    = "IMP_DEROG"  then do;
   ROLE    = "INPUT" ;
   FAMILY  = "" ;
   REPORT  = "N" ;
   LEVEL   = "INTERVAL" ;
   ORDER   = "" ;
end;
else 
if NAME  = "M_DEROG " then do;
   ROLE  ="INPUT";
   LEVEL ="BINARY";
 end;
if NAME = "JOB" then delete;
else 
if NAME    = "IMP_JOB"  then do;
   ROLE    = "INPUT" ;
   FAMILY  = "" ;
   REPORT  = "N" ;
   LEVEL   = "NOMINAL" ;
   ORDER   = "" ;
end;
else 
if NAME  = "M_JOB " then do;
   ROLE  ="INPUT";
   LEVEL ="BINARY";
 end;
else 
if NAME  = "M_LOAN " then do;
   ROLE  ="INPUT";
   LEVEL ="UNARY";
 end;
if NAME = "MORTDUE" then delete;
else 
if NAME    = "IMP_MORTDUE"  then do;
   ROLE    = "INPUT" ;
   FAMILY  = "" ;
   REPORT  = "N" ;
   LEVEL   = "INTERVAL" ;
   ORDER   = "" ;
end;
else 
if NAME  = "M_MORTDUE " then do;
   ROLE  ="INPUT";
   LEVEL ="BINARY";
 end;
if NAME = "NINQ" then delete;
else 
if NAME    = "IMP_NINQ"  then do;
   ROLE    = "INPUT" ;
   FAMILY  = "" ;
   REPORT  = "N" ;
   LEVEL   = "INTERVAL" ;
   ORDER   = "" ;
end;
else 
if NAME  = "M_NINQ " then do;
   ROLE  ="INPUT";
   LEVEL ="BINARY";
 end;
if NAME = "REASON" then delete;
else 
if NAME    = "IMP_REASON"  then do;
   ROLE    = "INPUT" ;
   FAMILY  = "" ;
   REPORT  = "N" ;
   LEVEL   = "BINARY" ;
   ORDER   = "" ;
end;
else 
if NAME  = "M_REASON " then do;
   ROLE  ="INPUT";
   LEVEL ="BINARY";
 end;
if NAME = "VALUE" then delete;
else 
if NAME    = "IMP_VALUE"  then do;
   ROLE    = "INPUT" ;
   FAMILY  = "" ;
   REPORT  = "N" ;
   LEVEL   = "INTERVAL" ;
   ORDER   = "" ;
end;
else 
if NAME  = "M_VALUE " then do;
   ROLE  ="INPUT";
   LEVEL ="BINARY";
 end;
if NAME = "YOJ" then delete;
else 
if NAME    = "IMP_YOJ"  then do;
   ROLE    = "INPUT" ;
   FAMILY  = "" ;
   REPORT  = "N" ;
   LEVEL   = "INTERVAL" ;
   ORDER   = "" ;
end;
else 
if NAME  = "M_YOJ " then do;
   ROLE  ="INPUT";
   LEVEL ="BINARY";
 end;

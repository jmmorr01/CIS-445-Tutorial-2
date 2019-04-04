 
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

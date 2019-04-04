 
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

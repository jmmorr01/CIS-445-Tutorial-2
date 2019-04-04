 
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

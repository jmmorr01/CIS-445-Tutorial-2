 
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

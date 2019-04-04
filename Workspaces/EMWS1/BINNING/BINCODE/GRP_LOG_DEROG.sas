 
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

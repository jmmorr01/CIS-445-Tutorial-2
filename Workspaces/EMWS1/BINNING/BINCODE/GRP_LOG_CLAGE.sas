 
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

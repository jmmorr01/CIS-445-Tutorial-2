 
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

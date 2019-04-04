 
*------------------------------------------------------------*;
* Variable: LOG_DELINQ;
*------------------------------------------------------------*;
LABEL GRP_LOG_DELINQ =
'Grouped: Transformed DELINQ';
 
if MISSING(LOG_DELINQ) then do;
GRP_LOG_DELINQ = 1;
end;
else if NOT MISSING(LOG_DELINQ) then do;
if LOG_DELINQ < 0 then do;
GRP_LOG_DELINQ = 2;
end;
else
if 0 <= LOG_DELINQ then do;
GRP_LOG_DELINQ = 3;
end;
end;

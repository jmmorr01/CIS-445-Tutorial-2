 
*------------------------------------------------------------*;
* Variable: LOG_YOJ;
*------------------------------------------------------------*;
LABEL GRP_LOG_YOJ =
'Grouped: Transformed YOJ';
 
if MISSING(LOG_YOJ) then do;
GRP_LOG_YOJ = 1;
end;
else if NOT MISSING(LOG_YOJ) then do;
if LOG_YOJ < 1.39 then do;
GRP_LOG_YOJ = 2;
end;
else
if 1.39 <= LOG_YOJ AND LOG_YOJ < 2.08 then do;
GRP_LOG_YOJ = 3;
end;
else
if 2.08 <= LOG_YOJ AND LOG_YOJ < 2.64 then do;
GRP_LOG_YOJ = 4;
end;
else
if 2.64 <= LOG_YOJ then do;
GRP_LOG_YOJ = 5;
end;
end;

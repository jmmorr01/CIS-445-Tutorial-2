 
*------------------------------------------------------------*;
* Variable: NINQ;
*------------------------------------------------------------*;
LABEL GRP_NINQ = "Grouped: NINQ";
 
if MISSING(NINQ) then do;
GRP_NINQ = 1;
end;
else if NOT MISSING(NINQ) then do;
if NINQ < 1 then do;
GRP_NINQ = 1;
end;
else
if 1 <= NINQ AND NINQ < 2 then do;
GRP_NINQ = 2;
end;
else
if 2 <= NINQ AND NINQ < 2.5 then do;
GRP_NINQ = 3;
end;
else
if 2.5 <= NINQ then do;
GRP_NINQ = 4;
end;
end;

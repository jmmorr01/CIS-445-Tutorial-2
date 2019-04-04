 
*------------------------------------------------------------*;
* Variable: INDEROG;
*------------------------------------------------------------*;
LABEL GRP_INDEROG = "Grouped: INDEROG";
 
if MISSING(INDEROG) then do;
GRP_INDEROG = 1;
end;
else if NOT MISSING(INDEROG) then do;
if INDEROG < 0 then do;
GRP_INDEROG = 2;
end;
else
if 0 <= INDEROG AND INDEROG < 0.5 then do;
GRP_INDEROG = 3;
end;
else
if 0.5 <= INDEROG then do;
GRP_INDEROG = 4;
end;
end;

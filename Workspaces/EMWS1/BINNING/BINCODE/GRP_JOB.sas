 
*------------------------------------------------------------*;
* Variable: JOB;
*------------------------------------------------------------*;
LABEL GRP_JOB = "Grouped: JOB";
 
_UFormat = JOB;
%dmnormip(_UFormat);
if MISSING(_UFORMAT) then do;
GRP_JOB = 1;
end;
else if NOT MISSING(_UFORMAT) then do;
%dmnormip(_UFormat);
if (_UFORMAT eq 'OTHER'
) then do;
GRP_JOB = 2;
end;
else
if (_UFORMAT eq 'PROFEXE'
) then do;
GRP_JOB = 3;
end;
else
if (_UFORMAT eq 'OFFICE'
) then do;
GRP_JOB = 4;
end;
else
if (_UFORMAT eq 'MGR'
) then do;
GRP_JOB = 5;
end;
else
if (_UFORMAT eq 'SELF'
) then do;
GRP_JOB = 6;
end;
else
if (_UFORMAT eq 'SALES'
) then do;
GRP_JOB = 7;
end;
else do;
GRP_JOB = 1;
end;
end;

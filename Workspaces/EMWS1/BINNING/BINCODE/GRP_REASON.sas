 
*------------------------------------------------------------*;
* Variable: REASON;
*------------------------------------------------------------*;
LABEL GRP_REASON = "Grouped: REASON";
 
_UFormat = REASON;
%dmnormip(_UFormat);
if MISSING(_UFORMAT) then do;
GRP_REASON = 1;
end;
else if NOT MISSING(_UFORMAT) then do;
%dmnormip(_UFormat);
if (_UFORMAT eq 'DEBTCON'
) then do;
GRP_REASON = 2;
end;
else
if (_UFORMAT eq 'HOMEIMP'
) then do;
GRP_REASON = 3;
end;
else do;
GRP_REASON = 1;
end;
end;

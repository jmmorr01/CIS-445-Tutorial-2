drop _temp_;
if (P_BAD1 ge 0.9076923076923) then do;
b_BAD = 1;
end;
else
if (P_BAD1 ge 0.71573604060913) then do;
b_BAD = 2;
end;
else
if (P_BAD1 ge 0.54838709677419) then do;
b_BAD = 3;
end;
else
if (P_BAD1 ge 0.35211267605633) then do;
b_BAD = 4;
end;
else
do;
_temp_ = dmran(1234);
b_BAD = floor(5 + 16*_temp_);
end;

 length _LABEL_ $200;
 label _LABEL_="%sysfunc(sasmsg(sashelp.dmine, rpt_groupvalues_vlabel , NOQUOTE))";
 
if DISPLAY_VAR='INDELINQ' and _GROUP_ = 2 then do;
_LABEL_='INDELINQ< 0';
UB=0;
end;
else
if DISPLAY_VAR='INDELINQ' and _GROUP_ = 3 then do;
_LABEL_='0<= INDELINQ< 0.5';
UB=0.5;
end;
else
if DISPLAY_VAR='INDELINQ' and _GROUP_ = 4 then do;
_LABEL_='0.5<= INDELINQ';
UB=.;
end;
 
if DISPLAY_VAR='INDEROG' and _GROUP_ = 2 then do;
_LABEL_='INDEROG< 0';
UB=0;
end;
else
if DISPLAY_VAR='INDEROG' and _GROUP_ = 3 then do;
_LABEL_='0<= INDEROG< 0.5';
UB=0.5;
end;
else
if DISPLAY_VAR='INDEROG' and _GROUP_ = 4 then do;
_LABEL_='0.5<= INDEROG';
UB=.;
end;
 
if DISPLAY_VAR='LOG_CLAGE' and _GROUP_ = 2 then do;
_LABEL_='LOG_CLAGE< 4.77';
UB=4.77;
end;
else
if DISPLAY_VAR='LOG_CLAGE' and _GROUP_ = 3 then do;
_LABEL_='4.77<= LOG_CLAGE< 5.17';
UB=5.17;
end;
else
if DISPLAY_VAR='LOG_CLAGE' and _GROUP_ = 4 then do;
_LABEL_='5.17<= LOG_CLAGE< 5.46';
UB=5.46;
end;
else
if DISPLAY_VAR='LOG_CLAGE' and _GROUP_ = 5 then do;
_LABEL_='5.46<= LOG_CLAGE';
UB=.;
end;
 
if DISPLAY_VAR='LOG_CLNO' and _GROUP_ = 2 then do;
_LABEL_='LOG_CLNO< 2.71';
UB=2.71;
end;
else
if DISPLAY_VAR='LOG_CLNO' and _GROUP_ = 3 then do;
_LABEL_='2.71<= LOG_CLNO< 3.04';
UB=3.04;
end;
else
if DISPLAY_VAR='LOG_CLNO' and _GROUP_ = 4 then do;
_LABEL_='3.04<= LOG_CLNO< 3.3';
UB=3.3;
end;
else
if DISPLAY_VAR='LOG_CLNO' and _GROUP_ = 5 then do;
_LABEL_='3.3<= LOG_CLNO';
UB=.;
end;
 
if DISPLAY_VAR='LOG_DEBTINC' and _GROUP_ = 2 then do;
_LABEL_='LOG_DEBTINC< 3.4';
UB=3.4;
end;
else
if DISPLAY_VAR='LOG_DEBTINC' and _GROUP_ = 3 then do;
_LABEL_='3.4<= LOG_DEBTINC< 3.58';
UB=3.58;
end;
else
if DISPLAY_VAR='LOG_DEBTINC' and _GROUP_ = 4 then do;
_LABEL_='3.58<= LOG_DEBTINC< 3.69';
UB=3.69;
end;
else
if DISPLAY_VAR='LOG_DEBTINC' and _GROUP_ = 5 then do;
_LABEL_='3.69<= LOG_DEBTINC';
UB=.;
end;
 
if DISPLAY_VAR='LOG_DELINQ' and _GROUP_ = 2 then do;
_LABEL_='LOG_DELINQ< 0';
UB=0;
end;
else
if DISPLAY_VAR='LOG_DELINQ' and _GROUP_ = 3 then do;
_LABEL_='0<= LOG_DELINQ';
UB=.;
end;
 
if DISPLAY_VAR='LOG_DEROG' and _GROUP_ = 2 then do;
_LABEL_='LOG_DEROG< 0';
UB=0;
end;
else
if DISPLAY_VAR='LOG_DEROG' and _GROUP_ = 3 then do;
_LABEL_='0<= LOG_DEROG';
UB=.;
end;
 
if DISPLAY_VAR='LOG_LOAN' and _GROUP_ = 2 then do;
_LABEL_='LOG_LOAN< 9.32';
UB=9.32;
end;
else
if DISPLAY_VAR='LOG_LOAN' and _GROUP_ = 3 then do;
_LABEL_='9.32<= LOG_LOAN< 9.7';
UB=9.7;
end;
else
if DISPLAY_VAR='LOG_LOAN' and _GROUP_ = 4 then do;
_LABEL_='9.7<= LOG_LOAN< 10.06';
UB=10.06;
end;
else
if DISPLAY_VAR='LOG_LOAN' and _GROUP_ = 5 then do;
_LABEL_='10.06<= LOG_LOAN';
UB=.;
end;
 
if DISPLAY_VAR='LOG_MORTDUE' and _GROUP_ = 2 then do;
_LABEL_='LOG_MORTDUE< 10.74';
UB=10.74;
end;
else
if DISPLAY_VAR='LOG_MORTDUE' and _GROUP_ = 3 then do;
_LABEL_='10.74<= LOG_MORTDUE< 11.07';
UB=11.07;
end;
else
if DISPLAY_VAR='LOG_MORTDUE' and _GROUP_ = 4 then do;
_LABEL_='11.07<= LOG_MORTDUE< 11.44';
UB=11.44;
end;
else
if DISPLAY_VAR='LOG_MORTDUE' and _GROUP_ = 5 then do;
_LABEL_='11.44<= LOG_MORTDUE';
UB=.;
end;
 
if DISPLAY_VAR='LOG_VALUE' and _GROUP_ = 2 then do;
_LABEL_='LOG_VALUE< 11.1';
UB=11.1;
end;
else
if DISPLAY_VAR='LOG_VALUE' and _GROUP_ = 3 then do;
_LABEL_='11.1<= LOG_VALUE< 11.4';
UB=11.4;
end;
else
if DISPLAY_VAR='LOG_VALUE' and _GROUP_ = 4 then do;
_LABEL_='11.4<= LOG_VALUE< 11.71';
UB=11.71;
end;
else
if DISPLAY_VAR='LOG_VALUE' and _GROUP_ = 5 then do;
_LABEL_='11.71<= LOG_VALUE';
UB=.;
end;
 
if DISPLAY_VAR='LOG_YOJ' and _GROUP_ = 2 then do;
_LABEL_='LOG_YOJ< 1.39';
UB=1.39;
end;
else
if DISPLAY_VAR='LOG_YOJ' and _GROUP_ = 3 then do;
_LABEL_='1.39<= LOG_YOJ< 2.08';
UB=2.08;
end;
else
if DISPLAY_VAR='LOG_YOJ' and _GROUP_ = 4 then do;
_LABEL_='2.08<= LOG_YOJ< 2.64';
UB=2.64;
end;
else
if DISPLAY_VAR='LOG_YOJ' and _GROUP_ = 5 then do;
_LABEL_='2.64<= LOG_YOJ';
UB=.;
end;
 
if DISPLAY_VAR='NINQ' and _GROUP_ = 1 then do;
_LABEL_='NINQ< 1';
UB=1;
end;
else
if DISPLAY_VAR='NINQ' and _GROUP_ = 2 then do;
_LABEL_='1<= NINQ< 2';
UB=2;
end;
else
if DISPLAY_VAR='NINQ' and _GROUP_ = 3 then do;
_LABEL_='2<= NINQ< 2.5';
UB=2.5;
end;
else
if DISPLAY_VAR='NINQ' and _GROUP_ = 4 then do;
_LABEL_='2.5<= NINQ';
UB=.;
end;
 
if DISPLAY_VAR='JOB' and _GROUP_ = 2 then
_LABEL_='OTHER';
else
if DISPLAY_VAR='JOB' and _GROUP_ = 3 then
_LABEL_='PROFEXE';
else
if DISPLAY_VAR='JOB' and _GROUP_ = 4 then
_LABEL_='OFFICE';
else
if DISPLAY_VAR='JOB' and _GROUP_ = 5 then
_LABEL_='MGR';
else
if DISPLAY_VAR='JOB' and _GROUP_ = 6 then
_LABEL_='SELF';
else
if DISPLAY_VAR='JOB' and _GROUP_ = 7 then
_LABEL_='SALES';
 
if DISPLAY_VAR='REASON' and _GROUP_ = 2 then
_LABEL_='DEBTCON';
else
if DISPLAY_VAR='REASON' and _GROUP_ = 3 then
_LABEL_='HOMEIMP';

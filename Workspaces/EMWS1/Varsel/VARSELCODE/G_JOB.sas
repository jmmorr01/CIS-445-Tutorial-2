/*----G_JOB begin----*/
length _NORM7 $ 7;
%DMNORMCP( JOB , _NORM7 )
drop _NORM7;
select(_NORM7);
when(' ' ) G_JOB = 3;
when('MGR' ) G_JOB = 0;
when('OFFICE' ) G_JOB = 3;
when('OTHER' ) G_JOB = 1;
when('PROFEXE' ) G_JOB = 2;
when('SALES' ) G_JOB = 0;
when('SELF' ) G_JOB = 0;
otherwise substr(_WARN_, 2, 1) = 'U';
end;
label G_JOB="Grouped Levels for  JOB";
/*----JOB end----*/

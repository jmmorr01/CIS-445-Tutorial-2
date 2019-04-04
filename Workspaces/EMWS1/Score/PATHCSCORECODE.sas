*------------------------------------------------------------*;
* TOOL: Input Data Source;
* TYPE: SAMPLE;
* NODE: Ids;
*------------------------------------------------------------*;
*------------------------------------------------------------*;
* TOOL: Partition Class;
* TYPE: SAMPLE;
* NODE: Part;
*------------------------------------------------------------*;
*------------------------------------------------------------*;
* TOOL: Transform;
* TYPE: MODIFY;
* NODE: Trans;
*------------------------------------------------------------*;
INDELINQ = DELINQ > 0;
INDEROG = DEROG > 0;
label LOG_CLAGE = 'Transformed CLAGE';
if CLAGE eq . then LOG_CLAGE = .;
else do;
if CLAGE + 1 > 0 then LOG_CLAGE = log(CLAGE + 1);
else LOG_CLAGE = .;
end;
label LOG_CLNO = 'Transformed CLNO';
if CLNO eq . then LOG_CLNO = .;
else do;
if CLNO + 1 > 0 then LOG_CLNO = log(CLNO + 1);
else LOG_CLNO = .;
end;
label LOG_DEBTINC = 'Transformed DEBTINC';
if DEBTINC eq . then LOG_DEBTINC = .;
else do;
if DEBTINC + 1 > 0 then LOG_DEBTINC = log(DEBTINC + 1);
else LOG_DEBTINC = .;
end;
label LOG_DELINQ = 'Transformed DELINQ';
if DELINQ eq . then LOG_DELINQ = .;
else do;
if DELINQ + 1 > 0 then LOG_DELINQ = log(DELINQ + 1);
else LOG_DELINQ = .;
end;
label LOG_DEROG = 'Transformed DEROG';
if DEROG eq . then LOG_DEROG = .;
else do;
if DEROG + 1 > 0 then LOG_DEROG = log(DEROG + 1);
else LOG_DEROG = .;
end;
label LOG_LOAN = 'Transformed LOAN';
if LOAN eq . then LOG_LOAN = .;
else do;
if LOAN + 1 > 0 then LOG_LOAN = log(LOAN + 1);
else LOG_LOAN = .;
end;
label LOG_MORTDUE = 'Transformed MORTDUE';
if MORTDUE eq . then LOG_MORTDUE = .;
else do;
if MORTDUE + 1 > 0 then LOG_MORTDUE = log(MORTDUE + 1);
else LOG_MORTDUE = .;
end;
label LOG_VALUE = 'Transformed VALUE';
if VALUE eq . then LOG_VALUE = .;
else do;
if VALUE + 1 > 0 then LOG_VALUE = log(VALUE + 1);
else LOG_VALUE = .;
end;
*------------------------------------------------------------*;
* TOOL: Extension Class;
* TYPE: MODIFY;
* NODE: BINNING;
*------------------------------------------------------------*;
length _UFormat $200;
drop _UFormat;
_UFormat='';

*------------------------------------------------------------*;
* Variable: INDELINQ;
*------------------------------------------------------------*;
LABEL GRP_INDELINQ = "Grouped: INDELINQ";

if MISSING(INDELINQ) then do;
GRP_INDELINQ = 1;
end;
else if NOT MISSING(INDELINQ) then do;
if INDELINQ < 0 then do;
GRP_INDELINQ = 2;
end;
else
if 0 <= INDELINQ AND INDELINQ < 0.5 then do;
GRP_INDELINQ = 3;
end;
else
if 0.5 <= INDELINQ then do;
GRP_INDELINQ = 4;
end;
end;

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

*------------------------------------------------------------*;
* Variable: LOG_CLAGE;
*------------------------------------------------------------*;
LABEL GRP_LOG_CLAGE =
'Grouped: Transformed CLAGE';

if MISSING(LOG_CLAGE) then do;
GRP_LOG_CLAGE = 1;
end;
else if NOT MISSING(LOG_CLAGE) then do;
if LOG_CLAGE < 4.77 then do;
GRP_LOG_CLAGE = 2;
end;
else
if 4.77 <= LOG_CLAGE AND LOG_CLAGE < 5.17 then do;
GRP_LOG_CLAGE = 3;
end;
else
if 5.17 <= LOG_CLAGE AND LOG_CLAGE < 5.46 then do;
GRP_LOG_CLAGE = 4;
end;
else
if 5.46 <= LOG_CLAGE then do;
GRP_LOG_CLAGE = 5;
end;
end;

*------------------------------------------------------------*;
* Variable: LOG_CLNO;
*------------------------------------------------------------*;
LABEL GRP_LOG_CLNO =
'Grouped: Transformed CLNO';

if MISSING(LOG_CLNO) then do;
GRP_LOG_CLNO = 1;
end;
else if NOT MISSING(LOG_CLNO) then do;
if LOG_CLNO < 2.71 then do;
GRP_LOG_CLNO = 2;
end;
else
if 2.71 <= LOG_CLNO AND LOG_CLNO < 3.04 then do;
GRP_LOG_CLNO = 3;
end;
else
if 3.04 <= LOG_CLNO AND LOG_CLNO < 3.3 then do;
GRP_LOG_CLNO = 4;
end;
else
if 3.3 <= LOG_CLNO then do;
GRP_LOG_CLNO = 5;
end;
end;

*------------------------------------------------------------*;
* Variable: LOG_DEBTINC;
*------------------------------------------------------------*;
LABEL GRP_LOG_DEBTINC =
'Grouped: Transformed DEBTINC';

if MISSING(LOG_DEBTINC) then do;
GRP_LOG_DEBTINC = 1;
end;
else if NOT MISSING(LOG_DEBTINC) then do;
if LOG_DEBTINC < 3.4 then do;
GRP_LOG_DEBTINC = 2;
end;
else
if 3.4 <= LOG_DEBTINC AND LOG_DEBTINC < 3.58 then do;
GRP_LOG_DEBTINC = 3;
end;
else
if 3.58 <= LOG_DEBTINC AND LOG_DEBTINC < 3.69 then do;
GRP_LOG_DEBTINC = 4;
end;
else
if 3.69 <= LOG_DEBTINC then do;
GRP_LOG_DEBTINC = 5;
end;
end;

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

*------------------------------------------------------------*;
* Variable: LOG_DEROG;
*------------------------------------------------------------*;
LABEL GRP_LOG_DEROG =
'Grouped: Transformed DEROG';

if MISSING(LOG_DEROG) then do;
GRP_LOG_DEROG = 1;
end;
else if NOT MISSING(LOG_DEROG) then do;
if LOG_DEROG < 0 then do;
GRP_LOG_DEROG = 2;
end;
else
if 0 <= LOG_DEROG then do;
GRP_LOG_DEROG = 3;
end;
end;

*------------------------------------------------------------*;
* Variable: LOG_LOAN;
*------------------------------------------------------------*;
LABEL GRP_LOG_LOAN =
'Grouped: Transformed LOAN';

if MISSING(LOG_LOAN) then do;
GRP_LOG_LOAN = 1;
end;
else if NOT MISSING(LOG_LOAN) then do;
if LOG_LOAN < 9.32 then do;
GRP_LOG_LOAN = 2;
end;
else
if 9.32 <= LOG_LOAN AND LOG_LOAN < 9.7 then do;
GRP_LOG_LOAN = 3;
end;
else
if 9.7 <= LOG_LOAN AND LOG_LOAN < 10.06 then do;
GRP_LOG_LOAN = 4;
end;
else
if 10.06 <= LOG_LOAN then do;
GRP_LOG_LOAN = 5;
end;
end;

*------------------------------------------------------------*;
* Variable: LOG_MORTDUE;
*------------------------------------------------------------*;
LABEL GRP_LOG_MORTDUE =
'Grouped: Transformed MORTDUE';

if MISSING(LOG_MORTDUE) then do;
GRP_LOG_MORTDUE = 1;
end;
else if NOT MISSING(LOG_MORTDUE) then do;
if LOG_MORTDUE < 10.74 then do;
GRP_LOG_MORTDUE = 2;
end;
else
if 10.74 <= LOG_MORTDUE AND LOG_MORTDUE < 11.07 then do;
GRP_LOG_MORTDUE = 3;
end;
else
if 11.07 <= LOG_MORTDUE AND LOG_MORTDUE < 11.44 then do;
GRP_LOG_MORTDUE = 4;
end;
else
if 11.44 <= LOG_MORTDUE then do;
GRP_LOG_MORTDUE = 5;
end;
end;

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
*------------------------------------------------------------*;
* TOOL: Regression;
* TYPE: MODEL;
* NODE: Reg3;
*------------------------------------------------------------*;
*************************************;
*** begin scoring code for regression;
*************************************;

length _WARN_ $4;
label _WARN_ = 'Warnings' ;

length I_BAD $ 12;
label I_BAD = 'Into: BAD' ;
*** Target Values;
array REG3DRF [2] $12 _temporary_ ('1' '0' );
label U_BAD = 'Unnormalized Into: BAD' ;
*** Unnormalized target values;
ARRAY REG3DRU[2]  _TEMPORARY_ (1 0);

drop _DM_BAD;
_DM_BAD=0;

*** Generate dummy variables for GRP_INDELINQ ;
drop _1_0 ;
if missing( GRP_INDELINQ ) then do;
   _1_0 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( GRP_INDELINQ , BEST12. );
   %DMNORMIP( _dm12 )
   if _dm12 = '3'  then do;
      _1_0 = 1;
   end;
   else if _dm12 = '4'  then do;
      _1_0 = -1;
   end;
   else do;
      _1_0 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for GRP_INDEROG ;
drop _2_0 ;
if missing( GRP_INDEROG ) then do;
   _2_0 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( GRP_INDEROG , BEST12. );
   %DMNORMIP( _dm12 )
   if _dm12 = '3'  then do;
      _2_0 = 1;
   end;
   else if _dm12 = '4'  then do;
      _2_0 = -1;
   end;
   else do;
      _2_0 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for GRP_JOB ;
drop _3_0 _3_1 _3_2 _3_3 _3_4 _3_5 ;
*** encoding is sparse, initialize to zero;
_3_0 = 0;
_3_1 = 0;
_3_2 = 0;
_3_3 = 0;
_3_4 = 0;
_3_5 = 0;
if missing( GRP_JOB ) then do;
   _3_0 = .;
   _3_1 = .;
   _3_2 = .;
   _3_3 = .;
   _3_4 = .;
   _3_5 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( GRP_JOB , BEST12. );
   %DMNORMIP( _dm12 )
   _dm_find = 0; drop _dm_find;
   if _dm12 <= '4'  then do;
      if _dm12 <= '2'  then do;
         if _dm12 = '1'  then do;
            _3_0 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '2'  then do;
               _3_1 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '3'  then do;
            _3_2 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '4'  then do;
               _3_3 = 1;
               _dm_find = 1;
            end;
         end;
      end;
   end;
   else do;
      if _dm12 <= '6'  then do;
         if _dm12 = '5'  then do;
            _3_4 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '6'  then do;
               _3_5 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '7'  then do;
            _3_0 = -1;
            _3_1 = -1;
            _3_2 = -1;
            _3_3 = -1;
            _3_4 = -1;
            _3_5 = -1;
            _dm_find = 1;
         end;
      end;
   end;
   if not _dm_find then do;
      _3_0 = .;
      _3_1 = .;
      _3_2 = .;
      _3_3 = .;
      _3_4 = .;
      _3_5 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for GRP_LOG_CLAGE ;
drop _4_0 _4_1 _4_2 _4_3 ;
*** encoding is sparse, initialize to zero;
_4_0 = 0;
_4_1 = 0;
_4_2 = 0;
_4_3 = 0;
if missing( GRP_LOG_CLAGE ) then do;
   _4_0 = .;
   _4_1 = .;
   _4_2 = .;
   _4_3 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( GRP_LOG_CLAGE , BEST12. );
   %DMNORMIP( _dm12 )
   _dm_find = 0; drop _dm_find;
   if _dm12 <= '3'  then do;
      if _dm12 <= '2'  then do;
         if _dm12 = '1'  then do;
            _4_0 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '2'  then do;
               _4_1 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '3'  then do;
            _4_2 = 1;
            _dm_find = 1;
         end;
      end;
   end;
   else do;
      if _dm12 = '4'  then do;
         _4_3 = 1;
         _dm_find = 1;
      end;
      else do;
         if _dm12 = '5'  then do;
            _4_0 = -1;
            _4_1 = -1;
            _4_2 = -1;
            _4_3 = -1;
            _dm_find = 1;
         end;
      end;
   end;
   if not _dm_find then do;
      _4_0 = .;
      _4_1 = .;
      _4_2 = .;
      _4_3 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for GRP_LOG_CLNO ;
drop _5_0 _5_1 _5_2 _5_3 ;
*** encoding is sparse, initialize to zero;
_5_0 = 0;
_5_1 = 0;
_5_2 = 0;
_5_3 = 0;
if missing( GRP_LOG_CLNO ) then do;
   _5_0 = .;
   _5_1 = .;
   _5_2 = .;
   _5_3 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( GRP_LOG_CLNO , BEST12. );
   %DMNORMIP( _dm12 )
   _dm_find = 0; drop _dm_find;
   if _dm12 <= '3'  then do;
      if _dm12 <= '2'  then do;
         if _dm12 = '1'  then do;
            _5_0 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '2'  then do;
               _5_1 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '3'  then do;
            _5_2 = 1;
            _dm_find = 1;
         end;
      end;
   end;
   else do;
      if _dm12 = '4'  then do;
         _5_3 = 1;
         _dm_find = 1;
      end;
      else do;
         if _dm12 = '5'  then do;
            _5_0 = -1;
            _5_1 = -1;
            _5_2 = -1;
            _5_3 = -1;
            _dm_find = 1;
         end;
      end;
   end;
   if not _dm_find then do;
      _5_0 = .;
      _5_1 = .;
      _5_2 = .;
      _5_3 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for GRP_LOG_DEBTINC ;
drop _6_0 _6_1 _6_2 _6_3 ;
*** encoding is sparse, initialize to zero;
_6_0 = 0;
_6_1 = 0;
_6_2 = 0;
_6_3 = 0;
if missing( GRP_LOG_DEBTINC ) then do;
   _6_0 = .;
   _6_1 = .;
   _6_2 = .;
   _6_3 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( GRP_LOG_DEBTINC , BEST12. );
   %DMNORMIP( _dm12 )
   _dm_find = 0; drop _dm_find;
   if _dm12 <= '3'  then do;
      if _dm12 <= '2'  then do;
         if _dm12 = '1'  then do;
            _6_0 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '2'  then do;
               _6_1 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '3'  then do;
            _6_2 = 1;
            _dm_find = 1;
         end;
      end;
   end;
   else do;
      if _dm12 = '4'  then do;
         _6_3 = 1;
         _dm_find = 1;
      end;
      else do;
         if _dm12 = '5'  then do;
            _6_0 = -1;
            _6_1 = -1;
            _6_2 = -1;
            _6_3 = -1;
            _dm_find = 1;
         end;
      end;
   end;
   if not _dm_find then do;
      _6_0 = .;
      _6_1 = .;
      _6_2 = .;
      _6_3 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for GRP_LOG_DELINQ ;
drop _7_0 ;
if missing( GRP_LOG_DELINQ ) then do;
   _7_0 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( GRP_LOG_DELINQ , BEST12. );
   %DMNORMIP( _dm12 )
   if _dm12 = '3'  then do;
      _7_0 = -1;
   end;
   else if _dm12 = '1'  then do;
      _7_0 = 1;
   end;
   else do;
      _7_0 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for GRP_LOG_DEROG ;
drop _8_0 ;
if missing( GRP_LOG_DEROG ) then do;
   _8_0 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( GRP_LOG_DEROG , BEST12. );
   %DMNORMIP( _dm12 )
   if _dm12 = '3'  then do;
      _8_0 = -1;
   end;
   else if _dm12 = '1'  then do;
      _8_0 = 1;
   end;
   else do;
      _8_0 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for GRP_LOG_LOAN ;
drop _9_0 _9_1 _9_2 ;
if missing( GRP_LOG_LOAN ) then do;
   _9_0 = .;
   _9_1 = .;
   _9_2 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( GRP_LOG_LOAN , BEST12. );
   %DMNORMIP( _dm12 )
   if _dm12 = '3'  then do;
      _9_0 = 0;
      _9_1 = 1;
      _9_2 = 0;
   end;
   else if _dm12 = '5'  then do;
      _9_0 = -1;
      _9_1 = -1;
      _9_2 = -1;
   end;
   else if _dm12 = '2'  then do;
      _9_0 = 1;
      _9_1 = 0;
      _9_2 = 0;
   end;
   else if _dm12 = '4'  then do;
      _9_0 = 0;
      _9_1 = 0;
      _9_2 = 1;
   end;
   else do;
      _9_0 = .;
      _9_1 = .;
      _9_2 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for GRP_LOG_MORTDUE ;
drop _10_0 _10_1 _10_2 _10_3 ;
*** encoding is sparse, initialize to zero;
_10_0 = 0;
_10_1 = 0;
_10_2 = 0;
_10_3 = 0;
if missing( GRP_LOG_MORTDUE ) then do;
   _10_0 = .;
   _10_1 = .;
   _10_2 = .;
   _10_3 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( GRP_LOG_MORTDUE , BEST12. );
   %DMNORMIP( _dm12 )
   _dm_find = 0; drop _dm_find;
   if _dm12 <= '3'  then do;
      if _dm12 <= '2'  then do;
         if _dm12 = '1'  then do;
            _10_0 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '2'  then do;
               _10_1 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '3'  then do;
            _10_2 = 1;
            _dm_find = 1;
         end;
      end;
   end;
   else do;
      if _dm12 = '4'  then do;
         _10_3 = 1;
         _dm_find = 1;
      end;
      else do;
         if _dm12 = '5'  then do;
            _10_0 = -1;
            _10_1 = -1;
            _10_2 = -1;
            _10_3 = -1;
            _dm_find = 1;
         end;
      end;
   end;
   if not _dm_find then do;
      _10_0 = .;
      _10_1 = .;
      _10_2 = .;
      _10_3 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for GRP_LOG_VALUE ;
drop _11_0 _11_1 _11_2 _11_3 ;
*** encoding is sparse, initialize to zero;
_11_0 = 0;
_11_1 = 0;
_11_2 = 0;
_11_3 = 0;
if missing( GRP_LOG_VALUE ) then do;
   _11_0 = .;
   _11_1 = .;
   _11_2 = .;
   _11_3 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( GRP_LOG_VALUE , BEST12. );
   %DMNORMIP( _dm12 )
   _dm_find = 0; drop _dm_find;
   if _dm12 <= '3'  then do;
      if _dm12 <= '2'  then do;
         if _dm12 = '1'  then do;
            _11_0 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '2'  then do;
               _11_1 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '3'  then do;
            _11_2 = 1;
            _dm_find = 1;
         end;
      end;
   end;
   else do;
      if _dm12 = '4'  then do;
         _11_3 = 1;
         _dm_find = 1;
      end;
      else do;
         if _dm12 = '5'  then do;
            _11_0 = -1;
            _11_1 = -1;
            _11_2 = -1;
            _11_3 = -1;
            _dm_find = 1;
         end;
      end;
   end;
   if not _dm_find then do;
      _11_0 = .;
      _11_1 = .;
      _11_2 = .;
      _11_3 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for GRP_NINQ ;
drop _13_0 _13_1 _13_2 ;
if missing( GRP_NINQ ) then do;
   _13_0 = .;
   _13_1 = .;
   _13_2 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( GRP_NINQ , BEST12. );
   %DMNORMIP( _dm12 )
   if _dm12 = '1'  then do;
      _13_0 = 1;
      _13_1 = 0;
      _13_2 = 0;
   end;
   else if _dm12 = '2'  then do;
      _13_0 = 0;
      _13_1 = 1;
      _13_2 = 0;
   end;
   else if _dm12 = '4'  then do;
      _13_0 = -1;
      _13_1 = -1;
      _13_2 = -1;
   end;
   else if _dm12 = '3'  then do;
      _13_0 = 0;
      _13_1 = 0;
      _13_2 = 1;
   end;
   else do;
      _13_0 = .;
      _13_1 = .;
      _13_2 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** If missing inputs, use averages;
if _DM_BAD > 0 then do;
   _P0 = 0.1994122586;
   _P1 = 0.8005877414;
   goto REG3DR1;
end;

*** Compute Linear Predictor;
drop _TEMP;
drop _LP0;
_LP0 = 0;

***  Effect: GRP_INDELINQ ;
_TEMP = 1;
_LP0 = _LP0 + (   -0.87775516834488) * _TEMP * _1_0;

***  Effect: GRP_INDEROG ;
_TEMP = 1;
_LP0 = _LP0 + (   -0.55281445474052) * _TEMP * _2_0;

***  Effect: GRP_JOB ;
_TEMP = 1;
_LP0 = _LP0 + (   -1.57351647111869) * _TEMP * _3_0;
_LP0 = _LP0 + (    0.28613983828213) * _TEMP * _3_1;
_LP0 = _LP0 + (    0.04717425869826) * _TEMP * _3_2;
_LP0 = _LP0 + (    -0.6273079991539) * _TEMP * _3_3;
_LP0 = _LP0 + (    0.46293169342544) * _TEMP * _3_4;
_LP0 = _LP0 + (    0.53314640452982) * _TEMP * _3_5;

***  Effect: GRP_LOG_CLAGE ;
_TEMP = 1;
_LP0 = _LP0 + (     0.4885261303632) * _TEMP * _4_0;
_LP0 = _LP0 + (    0.71554240420541) * _TEMP * _4_1;
_LP0 = _LP0 + (    0.18909158093947) * _TEMP * _4_2;
_LP0 = _LP0 + (   -0.53716218509574) * _TEMP * _4_3;

***  Effect: GRP_LOG_CLNO ;
_TEMP = 1;
_LP0 = _LP0 + (    2.73455654245763) * _TEMP * _5_0;
_LP0 = _LP0 + (   -0.61154389982698) * _TEMP * _5_1;
_LP0 = _LP0 + (   -0.79275770117257) * _TEMP * _5_2;
_LP0 = _LP0 + (   -0.73669529752972) * _TEMP * _5_3;

***  Effect: GRP_LOG_DEBTINC ;
_TEMP = 1;
_LP0 = _LP0 + (    2.21025315595452) * _TEMP * _6_0;
_LP0 = _LP0 + (    -0.9672227584658) * _TEMP * _6_1;
_LP0 = _LP0 + (   -0.91408931719345) * _TEMP * _6_2;
_LP0 = _LP0 + (   -0.62099733755167) * _TEMP * _6_3;

***  Effect: GRP_LOG_DELINQ ;
_TEMP = 1;
_LP0 = _LP0 + (    -0.2959510219925) * _TEMP * _7_0;

***  Effect: GRP_LOG_DEROG ;
_TEMP = 1;
_LP0 = _LP0 + (   -0.90393524464235) * _TEMP * _8_0;

***  Effect: GRP_LOG_LOAN ;
_TEMP = 1;
_LP0 = _LP0 + (    0.16385991732161) * _TEMP * _9_0;
_LP0 = _LP0 + (    0.15830771669066) * _TEMP * _9_1;
_LP0 = _LP0 + (    0.06806737420677) * _TEMP * _9_2;

***  Effect: GRP_LOG_MORTDUE ;
_TEMP = 1;
_LP0 = _LP0 + (    0.72652835503015) * _TEMP * _10_0;
_LP0 = _LP0 + (    0.19458084189349) * _TEMP * _10_1;
_LP0 = _LP0 + (   -0.18661188905406) * _TEMP * _10_2;
_LP0 = _LP0 + (   -0.45638816653046) * _TEMP * _10_3;

***  Effect: GRP_LOG_VALUE ;
_TEMP = 1;
_LP0 = _LP0 + (    3.36684754151064) * _TEMP * _11_0;
_LP0 = _LP0 + (   -0.90230378426672) * _TEMP * _11_1;
_LP0 = _LP0 + (   -0.91035575384715) * _TEMP * _11_2;
_LP0 = _LP0 + (   -1.14494565714679) * _TEMP * _11_3;

***  Effect: GRP_NINQ ;
_TEMP = 1;
_LP0 = _LP0 + (   -0.31468561657707) * _TEMP * _13_0;
_LP0 = _LP0 + (   -0.18323440424764) * _TEMP * _13_1;
_LP0 = _LP0 + (   -0.09136486214824) * _TEMP * _13_2;

*** Naive Posterior Probabilities;
drop _MAXP _IY _P0 _P1;
_TEMP =    -0.63961613873858 + _LP0;
if (_TEMP < 0) then do;
   _TEMP = exp(_TEMP);
   _P0 = _TEMP / (1 + _TEMP);
end;
else _P0 = 1 / (1 + exp(-_TEMP));
_P1 = 1.0 - _P0;

REG3DR1:


*** Posterior Probabilities and Predicted Level;
label P_BAD1 = 'Predicted: BAD=1' ;
label P_BAD0 = 'Predicted: BAD=0' ;
P_BAD1 = _P0;
_MAXP = _P0;
_IY = 1;
P_BAD0 = _P1;
if (_P1 >  _MAXP + 1E-8) then do;
   _MAXP = _P1;
   _IY = 2;
end;
I_BAD = REG3DRF[_IY];
U_BAD = REG3DRU[_IY];

*************************************;
***** end scoring code for regression;
*************************************;
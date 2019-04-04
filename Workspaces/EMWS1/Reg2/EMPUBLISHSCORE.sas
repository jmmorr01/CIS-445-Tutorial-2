*************************************;
*** begin scoring code for regression;
*************************************;

length _WARN_ $4;
label _WARN_ = 'Warnings' ;

length I_BAD $ 12;
label I_BAD = 'Into: BAD' ;
*** Target Values;
array REG2DRF [2] $12 _temporary_ ('1' '0' );
label U_BAD = 'Unnormalized Into: BAD' ;
*** Unnormalized target values;
ARRAY REG2DRU[2]  _TEMPORARY_ (1 0);

drop _DM_BAD;
_DM_BAD=0;

*** Check IMP_CLAGE for missing values ;
if missing( IMP_CLAGE ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;

*** Check IMP_CLNO for missing values ;
if missing( IMP_CLNO ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;

*** Check IMP_DEBTINC for missing values ;
if missing( IMP_DEBTINC ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;

*** Check IMP_DELINQ for missing values ;
if missing( IMP_DELINQ ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;

*** Check IMP_DEROG for missing values ;
if missing( IMP_DEROG ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;

*** Check IMP_MORTDUE for missing values ;
if missing( IMP_MORTDUE ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;

*** Check IMP_NINQ for missing values ;
if missing( IMP_NINQ ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;

*** Check IMP_VALUE for missing values ;
if missing( IMP_VALUE ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;

*** Check IMP_YOJ for missing values ;
if missing( IMP_YOJ ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;

*** Check LOAN for missing values ;
if missing( LOAN ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;

*** Generate dummy variables for IMP_JOB ;
drop _1_0 _1_1 _1_2 _1_3 _1_4 ;
*** encoding is sparse, initialize to zero;
_1_0 = 0;
_1_1 = 0;
_1_2 = 0;
_1_3 = 0;
_1_4 = 0;
if missing( IMP_JOB ) then do;
   _1_0 = .;
   _1_1 = .;
   _1_2 = .;
   _1_3 = .;
   _1_4 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm7 $ 7; drop _dm7 ;
   %DMNORMCP( IMP_JOB , _dm7 )
   _dm_find = 0; drop _dm_find;
   if _dm7 <= 'OTHER'  then do;
      if _dm7 <= 'OFFICE'  then do;
         if _dm7 = 'MGR'  then do;
            _1_0 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm7 = 'OFFICE'  then do;
               _1_1 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm7 = 'OTHER'  then do;
            _1_2 = 1;
            _dm_find = 1;
         end;
      end;
   end;
   else do;
      if _dm7 <= 'SALES'  then do;
         if _dm7 = 'PROFEXE'  then do;
            _1_3 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm7 = 'SALES'  then do;
               _1_4 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm7 = 'SELF'  then do;
            _1_0 = -1;
            _1_1 = -1;
            _1_2 = -1;
            _1_3 = -1;
            _1_4 = -1;
            _dm_find = 1;
         end;
      end;
   end;
   if not _dm_find then do;
      _1_0 = .;
      _1_1 = .;
      _1_2 = .;
      _1_3 = .;
      _1_4 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for IMP_REASON ;
drop _2_0 ;
if missing( IMP_REASON ) then do;
   _2_0 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm7 $ 7; drop _dm7 ;
   %DMNORMCP( IMP_REASON , _dm7 )
   if _dm7 = 'DEBTCON'  then do;
      _2_0 = 1;
   end;
   else if _dm7 = 'HOMEIMP'  then do;
      _2_0 = -1;
   end;
   else do;
      _2_0 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for M_CLAGE ;
drop _3_0 ;
if missing( M_CLAGE ) then do;
   _3_0 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( M_CLAGE , BEST12. );
   %DMNORMIP( _dm12 )
   if _dm12 = '0'  then do;
      _3_0 = 1;
   end;
   else if _dm12 = '1'  then do;
      _3_0 = -1;
   end;
   else do;
      _3_0 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for M_CLNO ;
drop _4_0 ;
if missing( M_CLNO ) then do;
   _4_0 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( M_CLNO , BEST12. );
   %DMNORMIP( _dm12 )
   if _dm12 = '0'  then do;
      _4_0 = 1;
   end;
   else if _dm12 = '1'  then do;
      _4_0 = -1;
   end;
   else do;
      _4_0 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for M_DEBTINC ;
drop _5_0 ;
if missing( M_DEBTINC ) then do;
   _5_0 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( M_DEBTINC , BEST12. );
   %DMNORMIP( _dm12 )
   if _dm12 = '0'  then do;
      _5_0 = 1;
   end;
   else if _dm12 = '1'  then do;
      _5_0 = -1;
   end;
   else do;
      _5_0 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for M_DELINQ ;
drop _6_0 ;
if missing( M_DELINQ ) then do;
   _6_0 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( M_DELINQ , BEST12. );
   %DMNORMIP( _dm12 )
   if _dm12 = '0'  then do;
      _6_0 = 1;
   end;
   else if _dm12 = '1'  then do;
      _6_0 = -1;
   end;
   else do;
      _6_0 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for M_DEROG ;
drop _7_0 ;
if missing( M_DEROG ) then do;
   _7_0 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( M_DEROG , BEST12. );
   %DMNORMIP( _dm12 )
   if _dm12 = '0'  then do;
      _7_0 = 1;
   end;
   else if _dm12 = '1'  then do;
      _7_0 = -1;
   end;
   else do;
      _7_0 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for M_JOB ;
drop _8_0 ;
if missing( M_JOB ) then do;
   _8_0 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( M_JOB , BEST12. );
   %DMNORMIP( _dm12 )
   if _dm12 = '0'  then do;
      _8_0 = 1;
   end;
   else if _dm12 = '1'  then do;
      _8_0 = -1;
   end;
   else do;
      _8_0 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for M_MORTDUE ;
drop _9_0 ;
if missing( M_MORTDUE ) then do;
   _9_0 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( M_MORTDUE , BEST12. );
   %DMNORMIP( _dm12 )
   if _dm12 = '0'  then do;
      _9_0 = 1;
   end;
   else if _dm12 = '1'  then do;
      _9_0 = -1;
   end;
   else do;
      _9_0 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for M_NINQ ;
drop _10_0 ;
if missing( M_NINQ ) then do;
   _10_0 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( M_NINQ , BEST12. );
   %DMNORMIP( _dm12 )
   if _dm12 = '0'  then do;
      _10_0 = 1;
   end;
   else if _dm12 = '1'  then do;
      _10_0 = -1;
   end;
   else do;
      _10_0 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for M_REASON ;
drop _11_0 ;
if missing( M_REASON ) then do;
   _11_0 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( M_REASON , BEST12. );
   %DMNORMIP( _dm12 )
   if _dm12 = '0'  then do;
      _11_0 = 1;
   end;
   else if _dm12 = '1'  then do;
      _11_0 = -1;
   end;
   else do;
      _11_0 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for M_VALUE ;
drop _12_0 ;
if missing( M_VALUE ) then do;
   _12_0 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( M_VALUE , BEST12. );
   %DMNORMIP( _dm12 )
   if _dm12 = '0'  then do;
      _12_0 = 1;
   end;
   else if _dm12 = '1'  then do;
      _12_0 = -1;
   end;
   else do;
      _12_0 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for M_YOJ ;
drop _13_0 ;
if missing( M_YOJ ) then do;
   _13_0 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( M_YOJ , BEST12. );
   %DMNORMIP( _dm12 )
   if _dm12 = '0'  then do;
      _13_0 = 1;
   end;
   else if _dm12 = '1'  then do;
      _13_0 = -1;
   end;
   else do;
      _13_0 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** If missing inputs, use averages;
if _DM_BAD > 0 then do;
   _P0 = 0.1994122586;
   _P1 = 0.8005877414;
   goto REG2DR1;
end;

*** Compute Linear Predictor;
drop _TEMP;
drop _LP0;
_LP0 = 0;

***  Effect: IMP_CLAGE ;
_TEMP = IMP_CLAGE ;
_LP0 = _LP0 + (   -0.00492592080593 * _TEMP);

***  Effect: IMP_CLNO ;
_TEMP = IMP_CLNO ;
_LP0 = _LP0 + (   -0.01872278788355 * _TEMP);

***  Effect: IMP_DEBTINC ;
_TEMP = IMP_DEBTINC ;
_LP0 = _LP0 + (    0.07940355344765 * _TEMP);

***  Effect: IMP_DELINQ ;
_TEMP = IMP_DELINQ ;
_LP0 = _LP0 + (    0.86173503852219 * _TEMP);

***  Effect: IMP_DEROG ;
_TEMP = IMP_DEROG ;
_LP0 = _LP0 + (    0.51654696891801 * _TEMP);

***  Effect: IMP_JOB ;
_TEMP = 1;
_LP0 = _LP0 + (     0.3037078653363) * _TEMP * _1_0;
_LP0 = _LP0 + (   -0.69877399167523) * _TEMP * _1_1;
_LP0 = _LP0 + (    0.14214041223415) * _TEMP * _1_2;
_LP0 = _LP0 + (    -0.3104014485613) * _TEMP * _1_3;
_LP0 = _LP0 + (    0.53792945722332) * _TEMP * _1_4;

***  Effect: IMP_MORTDUE ;
_TEMP = IMP_MORTDUE ;
_LP0 = _LP0 + ( -5.4086210378065E-6 * _TEMP);

***  Effect: IMP_NINQ ;
_TEMP = IMP_NINQ ;
_LP0 = _LP0 + (    0.24252841302862 * _TEMP);

***  Effect: IMP_REASON ;
_TEMP = 1;
_LP0 = _LP0 + (   -0.07648328110305) * _TEMP * _2_0;

***  Effect: IMP_VALUE ;
_TEMP = IMP_VALUE ;
_LP0 = _LP0 + (  5.2867161809326E-6 * _TEMP);

***  Effect: IMP_YOJ ;
_TEMP = IMP_YOJ ;
_LP0 = _LP0 + (   -0.02216785688523 * _TEMP);

***  Effect: LOAN ;
_TEMP = LOAN ;
_LP0 = _LP0 + (   -0.00001052833636 * _TEMP);

***  Effect: M_CLAGE ;
_TEMP = 1;
_LP0 = _LP0 + (     0.0137878773653) * _TEMP * _3_0;

***  Effect: M_CLNO ;
_TEMP = 1;
_LP0 = _LP0 + (   -2.24333564554187) * _TEMP * _4_0;

***  Effect: M_DEBTINC ;
_TEMP = 1;
_LP0 = _LP0 + (   -1.40610374401011) * _TEMP * _5_0;

***  Effect: M_DELINQ ;
_TEMP = 1;
_LP0 = _LP0 + (    0.50350205574404) * _TEMP * _6_0;

***  Effect: M_DEROG ;
_TEMP = 1;
_LP0 = _LP0 + (    1.20143655893052) * _TEMP * _7_0;

***  Effect: M_JOB ;
_TEMP = 1;
_LP0 = _LP0 + (    0.83139736065045) * _TEMP * _8_0;

***  Effect: M_MORTDUE ;
_TEMP = 1;
_LP0 = _LP0 + (    -0.3544714355491) * _TEMP * _9_0;

***  Effect: M_NINQ ;
_TEMP = 1;
_LP0 = _LP0 + (    0.00351134113718) * _TEMP * _10_0;

***  Effect: M_REASON ;
_TEMP = 1;
_LP0 = _LP0 + (   -0.13329984690257) * _TEMP * _11_0;

***  Effect: M_VALUE ;
_TEMP = 1;
_LP0 = _LP0 + (   -2.14238883881292) * _TEMP * _12_0;

***  Effect: M_YOJ ;
_TEMP = 1;
_LP0 = _LP0 + (    0.19156401937688) * _TEMP * _13_0;

*** Naive Posterior Probabilities;
drop _MAXP _IY _P0 _P1;
_TEMP =    -0.94270703701611 + _LP0;
if (_TEMP < 0) then do;
   _TEMP = exp(_TEMP);
   _P0 = _TEMP / (1 + _TEMP);
end;
else _P0 = 1 / (1 + exp(-_TEMP));
_P1 = 1.0 - _P0;

REG2DR1:


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
I_BAD = REG2DRF[_IY];
U_BAD = REG2DRU[_IY];

*************************************;
***** end scoring code for regression;
*************************************;

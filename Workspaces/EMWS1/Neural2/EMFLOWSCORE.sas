***********************************;
*** Begin Scoring Code for Neural;
***********************************;
DROP _DM_BAD _EPS _NOCL_ _MAX_ _MAXP_ _SUM_ _NTRIALS;
 _DM_BAD = 0;
 _NOCL_ = .;
 _MAX_ = .;
 _MAXP_ = .;
 _SUM_ = .;
 _NTRIALS = .;
 _EPS =                1E-10;
LENGTH _WARN_ $4
      F_BAD  $ 12
;
      label S_CLAGE = 'Standard: CLAGE' ;

      label S_DELINQ = 'Standard: DELINQ' ;

      label S_NINQ = 'Standard: NINQ' ;

      label S_YOJ = 'Standard: YOJ' ;

      label G_JOB0 = 'Dummy: G_JOB=0' ;

      label G_JOB1 = 'Dummy: G_JOB=1' ;

      label G_JOB2 = 'Dummy: G_JOB=2' ;

      label H11 = 'Hidden: H1=1' ;

      label H12 = 'Hidden: H1=2' ;

      label H13 = 'Hidden: H1=3' ;

      label I_BAD = 'Into: BAD' ;

      label F_BAD = 'From: BAD' ;

      label U_BAD = 'Unnormalized Into: BAD' ;

      label P_BAD1 = 'Predicted: BAD=1' ;

      label R_BAD1 = 'Residual: BAD=1' ;

      label P_BAD0 = 'Predicted: BAD=0' ;

      label R_BAD0 = 'Residual: BAD=0' ;

      label  _WARN_ = "Warnings";

*** Generate dummy variables for G_JOB ;
drop G_JOB0 G_JOB1 G_JOB2 ;
if missing( G_JOB ) then do;
   G_JOB0 = .;
   G_JOB1 = .;
   G_JOB2 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( G_JOB , BEST12. );
   %DMNORMIP( _dm12 )
   if _dm12 = '1'  then do;
      G_JOB0 = 0;
      G_JOB1 = 1;
      G_JOB2 = 0;
   end;
   else if _dm12 = '3'  then do;
      G_JOB0 = -1;
      G_JOB1 = -1;
      G_JOB2 = -1;
   end;
   else if _dm12 = '2'  then do;
      G_JOB0 = 0;
      G_JOB1 = 0;
      G_JOB2 = 1;
   end;
   else if _dm12 = '0'  then do;
      G_JOB0 = 1;
      G_JOB1 = 0;
      G_JOB2 = 0;
   end;
   else do;
      G_JOB0 = .;
      G_JOB1 = .;
      G_JOB2 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** *************************;
*** Checking missing input Interval
*** *************************;

IF NMISS(
   CLAGE ,
   DELINQ ,
   NINQ ,
   YOJ   ) THEN DO;
   SUBSTR(_WARN_, 1, 1) = 'M';

   _DM_BAD = 1;
END;
*** *************************;
*** Writing the Node intvl ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   S_CLAGE  =    -2.04191236596896 +      0.0111876895839 * CLAGE ;
   S_DELINQ  =    -0.38005794006511 +     0.81225106475149 * DELINQ ;
   S_NINQ  =    -0.68167397664091 +     0.59259466813963 * NINQ ;
   S_YOJ  =    -1.15382065820172 +     0.12991994722584 * YOJ ;
END;
ELSE DO;
   IF MISSING( CLAGE ) THEN S_CLAGE  = . ;
   ELSE S_CLAGE  =    -2.04191236596896 +      0.0111876895839 * CLAGE ;
   IF MISSING( DELINQ ) THEN S_DELINQ  = . ;
   ELSE S_DELINQ  =    -0.38005794006511 +     0.81225106475149 * DELINQ ;
   IF MISSING( NINQ ) THEN S_NINQ  = . ;
   ELSE S_NINQ  =    -0.68167397664091 +     0.59259466813963 * NINQ ;
   IF MISSING( YOJ ) THEN S_YOJ  = . ;
   ELSE S_YOJ  =    -1.15382065820172 +     0.12991994722584 * YOJ ;
END;
*** *************************;
*** Writing the Node nom ;
*** *************************;
*** *************************;
*** Writing the Node H1 ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   H11  =     0.05028461595904 * S_CLAGE  +     0.15653261877297 * S_DELINQ
          +     0.05169512017358 * S_NINQ  +    -0.01036714617493 * S_YOJ ;
   H12  =    -3.79597210863289 * S_CLAGE  +    -0.04404579578133 * S_DELINQ
          +    -1.13809489715032 * S_NINQ  +    -3.10689203063116 * S_YOJ ;
   H13  =      6.2608788774211 * S_CLAGE  +     -0.7120870700058 * S_DELINQ
          +    -1.75358762384642 * S_NINQ  +    -2.13865947820242 * S_YOJ ;
   H11  = H11  +    -0.09392941058722 * G_JOB0  +     0.01498675708377 *
        G_JOB1  +     0.01209533658058 * G_JOB2 ;
   H12  = H12  +      2.3702425078634 * G_JOB0  +     3.25166935338042 *
        G_JOB1  +     -0.2149724400745 * G_JOB2 ;
   H13  = H13  +     -3.7079420067155 * G_JOB0  +     2.35229191640509 *
        G_JOB1  +     0.44358794304064 * G_JOB2 ;
   H11  =    -0.47016247395756 + H11 ;
   H12  =    -1.01531860509272 + H12 ;
   H13  =     5.87118010680326 + H13 ;
   H11  = TANH(H11 );
   H12  = TANH(H12 );
   H13  = TANH(H13 );
END;
ELSE DO;
   H11  = .;
   H12  = .;
   H13  = .;
END;
*** *************************;
*** Writing the Node BAD ;
*** *************************;

*** Generate dummy variables for BAD ;
drop BAD1 BAD0 ;
label F_BAD = 'From: BAD' ;
length F_BAD $ 12;
F_BAD = put( BAD , BEST12. );
%DMNORMIP( F_BAD )
if missing( BAD ) then do;
   BAD1 = .;
   BAD0 = .;
end;
else do;
   if F_BAD = '0'  then do;
      BAD1 = 0;
      BAD0 = 1;
   end;
   else if F_BAD = '1'  then do;
      BAD1 = 1;
      BAD0 = 0;
   end;
   else do;
      BAD1 = .;
      BAD0 = .;
   end;
end;
IF _DM_BAD EQ 0 THEN DO;
   P_BAD1  =     7.50962538024112 * H11  +     0.94116881039918 * H12
          +    -1.08817475638741 * H13 ;
   P_BAD1  =     2.29430744773541 + P_BAD1 ;
   P_BAD0  = 0;
   _MAX_ = MAX (P_BAD1 , P_BAD0 );
   _SUM_ = 0.;
   P_BAD1  = EXP(P_BAD1  - _MAX_);
   _SUM_ = _SUM_ + P_BAD1 ;
   P_BAD0  = EXP(P_BAD0  - _MAX_);
   _SUM_ = _SUM_ + P_BAD0 ;
   P_BAD1  = P_BAD1  / _SUM_;
   P_BAD0  = P_BAD0  / _SUM_;
END;
ELSE DO;
   P_BAD1  = .;
   P_BAD0  = .;
END;
IF _DM_BAD EQ 1 THEN DO;
   P_BAD1  =     0.20233265720081;
   P_BAD0  =     0.79766734279918;
END;
*** *****************************;
*** Writing the Residuals  of the Node BAD ;
*** ******************************;
IF MISSING( BAD1 ) THEN R_BAD1  = . ;
ELSE R_BAD1  = BAD1  - P_BAD1 ;
IF MISSING( BAD0 ) THEN R_BAD0  = . ;
ELSE R_BAD0  = BAD0  - P_BAD0 ;
*** *************************;
*** Writing the I_BAD  AND U_BAD ;
*** *************************;
_MAXP_ = P_BAD1 ;
I_BAD  = "1           " ;
U_BAD  =                    1;
IF( _MAXP_ LT P_BAD0  ) THEN DO;
   _MAXP_ = P_BAD0 ;
   I_BAD  = "0           " ;
   U_BAD  =                    0;
END;
********************************;
*** End Scoring Code for Neural;
********************************;
drop
H11
H12
H13
;
drop S_:;

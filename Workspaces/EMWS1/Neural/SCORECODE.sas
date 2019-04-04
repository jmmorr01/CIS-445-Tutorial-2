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
;
      label GRP_INDELINQ3 = 'Dummy: GRP_INDELINQ=3' ;

      label GRP_INDEROG3 = 'Dummy: GRP_INDEROG=3' ;

      label GRP_JOB1 = 'Dummy: GRP_JOB=1' ;

      label GRP_JOB2 = 'Dummy: GRP_JOB=2' ;

      label GRP_JOB3 = 'Dummy: GRP_JOB=3' ;

      label GRP_JOB4 = 'Dummy: GRP_JOB=4' ;

      label GRP_JOB5 = 'Dummy: GRP_JOB=5' ;

      label GRP_JOB6 = 'Dummy: GRP_JOB=6' ;

      label GRP_LOG_CLAGE1 = 'Dummy: GRP_LOG_CLAGE=1' ;

      label GRP_LOG_CLAGE2 = 'Dummy: GRP_LOG_CLAGE=2' ;

      label GRP_LOG_CLAGE3 = 'Dummy: GRP_LOG_CLAGE=3' ;

      label GRP_LOG_CLAGE4 = 'Dummy: GRP_LOG_CLAGE=4' ;

      label GRP_LOG_CLNO1 = 'Dummy: GRP_LOG_CLNO=1' ;

      label GRP_LOG_CLNO2 = 'Dummy: GRP_LOG_CLNO=2' ;

      label GRP_LOG_CLNO3 = 'Dummy: GRP_LOG_CLNO=3' ;

      label GRP_LOG_CLNO4 = 'Dummy: GRP_LOG_CLNO=4' ;

      label GRP_LOG_DEBTINC1 = 'Dummy: GRP_LOG_DEBTINC=1' ;

      label GRP_LOG_DEBTINC2 = 'Dummy: GRP_LOG_DEBTINC=2' ;

      label GRP_LOG_DEBTINC3 = 'Dummy: GRP_LOG_DEBTINC=3' ;

      label GRP_LOG_DEBTINC4 = 'Dummy: GRP_LOG_DEBTINC=4' ;

      label GRP_LOG_DELINQ1 = 'Dummy: GRP_LOG_DELINQ=1' ;

      label GRP_LOG_DEROG1 = 'Dummy: GRP_LOG_DEROG=1' ;

      label GRP_LOG_LOAN2 = 'Dummy: GRP_LOG_LOAN=2' ;

      label GRP_LOG_LOAN3 = 'Dummy: GRP_LOG_LOAN=3' ;

      label GRP_LOG_LOAN4 = 'Dummy: GRP_LOG_LOAN=4' ;

      label GRP_LOG_MORTDUE1 = 'Dummy: GRP_LOG_MORTDUE=1' ;

      label GRP_LOG_MORTDUE2 = 'Dummy: GRP_LOG_MORTDUE=2' ;

      label GRP_LOG_MORTDUE3 = 'Dummy: GRP_LOG_MORTDUE=3' ;

      label GRP_LOG_MORTDUE4 = 'Dummy: GRP_LOG_MORTDUE=4' ;

      label GRP_LOG_VALUE1 = 'Dummy: GRP_LOG_VALUE=1' ;

      label GRP_LOG_VALUE2 = 'Dummy: GRP_LOG_VALUE=2' ;

      label GRP_LOG_VALUE3 = 'Dummy: GRP_LOG_VALUE=3' ;

      label GRP_LOG_VALUE4 = 'Dummy: GRP_LOG_VALUE=4' ;

      label GRP_LOG_YOJ1 = 'Dummy: GRP_LOG_YOJ=1' ;

      label GRP_LOG_YOJ2 = 'Dummy: GRP_LOG_YOJ=2' ;

      label GRP_LOG_YOJ3 = 'Dummy: GRP_LOG_YOJ=3' ;

      label GRP_LOG_YOJ4 = 'Dummy: GRP_LOG_YOJ=4' ;

      label GRP_NINQ1 = 'Dummy: GRP_NINQ=1' ;

      label GRP_NINQ2 = 'Dummy: GRP_NINQ=2' ;

      label GRP_NINQ3 = 'Dummy: GRP_NINQ=3' ;

      label GRP_REASON1 = 'Dummy: GRP_REASON=1' ;

      label GRP_REASON2 = 'Dummy: GRP_REASON=2' ;

      label H11 = 'Hidden: H1=1' ;

      label H12 = 'Hidden: H1=2' ;

      label H13 = 'Hidden: H1=3' ;

      label I_BAD = 'Into: BAD' ;

      label U_BAD = 'Unnormalized Into: BAD' ;

      label P_BAD1 = 'Predicted: BAD=1' ;

      label P_BAD0 = 'Predicted: BAD=0' ;

      label  _WARN_ = "Warnings"; 

*** Generate dummy variables for GRP_INDELINQ ;
drop GRP_INDELINQ3 ;
if missing( GRP_INDELINQ ) then do;
   GRP_INDELINQ3 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( GRP_INDELINQ , BEST12. );
   %DMNORMIP( _dm12 )
   if _dm12 = '3'  then do;
      GRP_INDELINQ3 = -1;
   end;
   else if _dm12 = '4'  then do;
      GRP_INDELINQ3 = 1;
   end;
   else do;
      GRP_INDELINQ3 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for GRP_INDEROG ;
drop GRP_INDEROG3 ;
if missing( GRP_INDEROG ) then do;
   GRP_INDEROG3 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( GRP_INDEROG , BEST12. );
   %DMNORMIP( _dm12 )
   if _dm12 = '3'  then do;
      GRP_INDEROG3 = -1;
   end;
   else if _dm12 = '4'  then do;
      GRP_INDEROG3 = 1;
   end;
   else do;
      GRP_INDEROG3 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for GRP_JOB ;
drop GRP_JOB1 GRP_JOB2 GRP_JOB3 GRP_JOB4 GRP_JOB5 GRP_JOB6 ;
if missing( GRP_JOB ) then do;
   GRP_JOB1 = .;
   GRP_JOB2 = .;
   GRP_JOB3 = .;
   GRP_JOB4 = .;
   GRP_JOB5 = .;
   GRP_JOB6 = .;
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
            GRP_JOB1 = -0.46770717334674;
            GRP_JOB2 = -0.46770717334674;
            GRP_JOB3 = -0.46770717334674;
            GRP_JOB4 = -0.46770717334674;
            GRP_JOB5 = -0.46770717334674;
            GRP_JOB6 = -0.46770717334674;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '2'  then do;
               GRP_JOB1 = 0.46770717334674;
               GRP_JOB2 = -0.46770717334674;
               GRP_JOB3 = -0.46770717334674;
               GRP_JOB4 = -0.46770717334674;
               GRP_JOB5 = -0.46770717334674;
               GRP_JOB6 = -0.46770717334674;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '3'  then do;
            GRP_JOB1 = 0.46770717334674;
            GRP_JOB2 = 0.46770717334674;
            GRP_JOB3 = -0.46770717334674;
            GRP_JOB4 = -0.46770717334674;
            GRP_JOB5 = -0.46770717334674;
            GRP_JOB6 = -0.46770717334674;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '4'  then do;
               GRP_JOB1 = 0.46770717334674;
               GRP_JOB2 = 0.46770717334674;
               GRP_JOB3 = 0.46770717334674;
               GRP_JOB4 = -0.46770717334674;
               GRP_JOB5 = -0.46770717334674;
               GRP_JOB6 = -0.46770717334674;
               _dm_find = 1;
            end;
         end;
      end;
   end;
   else do;
      if _dm12 <= '6'  then do;
         if _dm12 = '5'  then do;
            GRP_JOB1 = 0.46770717334674;
            GRP_JOB2 = 0.46770717334674;
            GRP_JOB3 = 0.46770717334674;
            GRP_JOB4 = 0.46770717334674;
            GRP_JOB5 = -0.46770717334674;
            GRP_JOB6 = -0.46770717334674;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '6'  then do;
               GRP_JOB1 = 0.46770717334674;
               GRP_JOB2 = 0.46770717334674;
               GRP_JOB3 = 0.46770717334674;
               GRP_JOB4 = 0.46770717334674;
               GRP_JOB5 = 0.46770717334674;
               GRP_JOB6 = -0.46770717334674;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '7'  then do;
            GRP_JOB1 = 0.46770717334674;
            GRP_JOB2 = 0.46770717334674;
            GRP_JOB3 = 0.46770717334674;
            GRP_JOB4 = 0.46770717334674;
            GRP_JOB5 = 0.46770717334674;
            GRP_JOB6 = 0.46770717334674;
            _dm_find = 1;
         end;
      end;
   end;
   if not _dm_find then do;
      GRP_JOB1 = .;
      GRP_JOB2 = .;
      GRP_JOB3 = .;
      GRP_JOB4 = .;
      GRP_JOB5 = .;
      GRP_JOB6 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for GRP_LOG_CLAGE ;
drop GRP_LOG_CLAGE1 GRP_LOG_CLAGE2 GRP_LOG_CLAGE3 GRP_LOG_CLAGE4 ;
if missing( GRP_LOG_CLAGE ) then do;
   GRP_LOG_CLAGE1 = .;
   GRP_LOG_CLAGE2 = .;
   GRP_LOG_CLAGE3 = .;
   GRP_LOG_CLAGE4 = .;
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
            GRP_LOG_CLAGE1 = -0.55901699437494;
            GRP_LOG_CLAGE2 = -0.55901699437494;
            GRP_LOG_CLAGE3 = -0.55901699437494;
            GRP_LOG_CLAGE4 = -0.55901699437494;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '2'  then do;
               GRP_LOG_CLAGE1 = 0.55901699437494;
               GRP_LOG_CLAGE2 = -0.55901699437494;
               GRP_LOG_CLAGE3 = -0.55901699437494;
               GRP_LOG_CLAGE4 = -0.55901699437494;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '3'  then do;
            GRP_LOG_CLAGE1 = 0.55901699437494;
            GRP_LOG_CLAGE2 = 0.55901699437494;
            GRP_LOG_CLAGE3 = -0.55901699437494;
            GRP_LOG_CLAGE4 = -0.55901699437494;
            _dm_find = 1;
         end;
      end;
   end;
   else do;
      if _dm12 = '4'  then do;
         GRP_LOG_CLAGE1 = 0.55901699437494;
         GRP_LOG_CLAGE2 = 0.55901699437494;
         GRP_LOG_CLAGE3 = 0.55901699437494;
         GRP_LOG_CLAGE4 = -0.55901699437494;
         _dm_find = 1;
      end;
      else do;
         if _dm12 = '5'  then do;
            GRP_LOG_CLAGE1 = 0.55901699437494;
            GRP_LOG_CLAGE2 = 0.55901699437494;
            GRP_LOG_CLAGE3 = 0.55901699437494;
            GRP_LOG_CLAGE4 = 0.55901699437494;
            _dm_find = 1;
         end;
      end;
   end;
   if not _dm_find then do;
      GRP_LOG_CLAGE1 = .;
      GRP_LOG_CLAGE2 = .;
      GRP_LOG_CLAGE3 = .;
      GRP_LOG_CLAGE4 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for GRP_LOG_CLNO ;
drop GRP_LOG_CLNO1 GRP_LOG_CLNO2 GRP_LOG_CLNO3 GRP_LOG_CLNO4 ;
if missing( GRP_LOG_CLNO ) then do;
   GRP_LOG_CLNO1 = .;
   GRP_LOG_CLNO2 = .;
   GRP_LOG_CLNO3 = .;
   GRP_LOG_CLNO4 = .;
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
            GRP_LOG_CLNO1 = -0.55901699437494;
            GRP_LOG_CLNO2 = -0.55901699437494;
            GRP_LOG_CLNO3 = -0.55901699437494;
            GRP_LOG_CLNO4 = -0.55901699437494;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '2'  then do;
               GRP_LOG_CLNO1 = 0.55901699437494;
               GRP_LOG_CLNO2 = -0.55901699437494;
               GRP_LOG_CLNO3 = -0.55901699437494;
               GRP_LOG_CLNO4 = -0.55901699437494;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '3'  then do;
            GRP_LOG_CLNO1 = 0.55901699437494;
            GRP_LOG_CLNO2 = 0.55901699437494;
            GRP_LOG_CLNO3 = -0.55901699437494;
            GRP_LOG_CLNO4 = -0.55901699437494;
            _dm_find = 1;
         end;
      end;
   end;
   else do;
      if _dm12 = '4'  then do;
         GRP_LOG_CLNO1 = 0.55901699437494;
         GRP_LOG_CLNO2 = 0.55901699437494;
         GRP_LOG_CLNO3 = 0.55901699437494;
         GRP_LOG_CLNO4 = -0.55901699437494;
         _dm_find = 1;
      end;
      else do;
         if _dm12 = '5'  then do;
            GRP_LOG_CLNO1 = 0.55901699437494;
            GRP_LOG_CLNO2 = 0.55901699437494;
            GRP_LOG_CLNO3 = 0.55901699437494;
            GRP_LOG_CLNO4 = 0.55901699437494;
            _dm_find = 1;
         end;
      end;
   end;
   if not _dm_find then do;
      GRP_LOG_CLNO1 = .;
      GRP_LOG_CLNO2 = .;
      GRP_LOG_CLNO3 = .;
      GRP_LOG_CLNO4 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for GRP_LOG_DEBTINC ;
drop GRP_LOG_DEBTINC1 GRP_LOG_DEBTINC2 GRP_LOG_DEBTINC3 GRP_LOG_DEBTINC4 ;
if missing( GRP_LOG_DEBTINC ) then do;
   GRP_LOG_DEBTINC1 = .;
   GRP_LOG_DEBTINC2 = .;
   GRP_LOG_DEBTINC3 = .;
   GRP_LOG_DEBTINC4 = .;
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
            GRP_LOG_DEBTINC1 = -0.55901699437494;
            GRP_LOG_DEBTINC2 = -0.55901699437494;
            GRP_LOG_DEBTINC3 = -0.55901699437494;
            GRP_LOG_DEBTINC4 = -0.55901699437494;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '2'  then do;
               GRP_LOG_DEBTINC1 = 0.55901699437494;
               GRP_LOG_DEBTINC2 = -0.55901699437494;
               GRP_LOG_DEBTINC3 = -0.55901699437494;
               GRP_LOG_DEBTINC4 = -0.55901699437494;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '3'  then do;
            GRP_LOG_DEBTINC1 = 0.55901699437494;
            GRP_LOG_DEBTINC2 = 0.55901699437494;
            GRP_LOG_DEBTINC3 = -0.55901699437494;
            GRP_LOG_DEBTINC4 = -0.55901699437494;
            _dm_find = 1;
         end;
      end;
   end;
   else do;
      if _dm12 = '4'  then do;
         GRP_LOG_DEBTINC1 = 0.55901699437494;
         GRP_LOG_DEBTINC2 = 0.55901699437494;
         GRP_LOG_DEBTINC3 = 0.55901699437494;
         GRP_LOG_DEBTINC4 = -0.55901699437494;
         _dm_find = 1;
      end;
      else do;
         if _dm12 = '5'  then do;
            GRP_LOG_DEBTINC1 = 0.55901699437494;
            GRP_LOG_DEBTINC2 = 0.55901699437494;
            GRP_LOG_DEBTINC3 = 0.55901699437494;
            GRP_LOG_DEBTINC4 = 0.55901699437494;
            _dm_find = 1;
         end;
      end;
   end;
   if not _dm_find then do;
      GRP_LOG_DEBTINC1 = .;
      GRP_LOG_DEBTINC2 = .;
      GRP_LOG_DEBTINC3 = .;
      GRP_LOG_DEBTINC4 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for GRP_LOG_DELINQ ;
drop GRP_LOG_DELINQ1 ;
if missing( GRP_LOG_DELINQ ) then do;
   GRP_LOG_DELINQ1 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( GRP_LOG_DELINQ , BEST12. );
   %DMNORMIP( _dm12 )
   if _dm12 = '3'  then do;
      GRP_LOG_DELINQ1 = 1;
   end;
   else if _dm12 = '1'  then do;
      GRP_LOG_DELINQ1 = -1;
   end;
   else do;
      GRP_LOG_DELINQ1 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for GRP_LOG_DEROG ;
drop GRP_LOG_DEROG1 ;
if missing( GRP_LOG_DEROG ) then do;
   GRP_LOG_DEROG1 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( GRP_LOG_DEROG , BEST12. );
   %DMNORMIP( _dm12 )
   if _dm12 = '3'  then do;
      GRP_LOG_DEROG1 = 1;
   end;
   else if _dm12 = '1'  then do;
      GRP_LOG_DEROG1 = -1;
   end;
   else do;
      GRP_LOG_DEROG1 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for GRP_LOG_LOAN ;
drop GRP_LOG_LOAN2 GRP_LOG_LOAN3 GRP_LOG_LOAN4 ;
if missing( GRP_LOG_LOAN ) then do;
   GRP_LOG_LOAN2 = .;
   GRP_LOG_LOAN3 = .;
   GRP_LOG_LOAN4 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( GRP_LOG_LOAN , BEST12. );
   %DMNORMIP( _dm12 )
   if _dm12 = '3'  then do;
      GRP_LOG_LOAN2 = 0.63245553203367;
      GRP_LOG_LOAN3 = -0.63245553203367;
      GRP_LOG_LOAN4 = -0.63245553203367;
   end;
   else if _dm12 = '5'  then do;
      GRP_LOG_LOAN2 = 0.63245553203367;
      GRP_LOG_LOAN3 = 0.63245553203367;
      GRP_LOG_LOAN4 = 0.63245553203367;
   end;
   else if _dm12 = '2'  then do;
      GRP_LOG_LOAN2 = -0.63245553203367;
      GRP_LOG_LOAN3 = -0.63245553203367;
      GRP_LOG_LOAN4 = -0.63245553203367;
   end;
   else if _dm12 = '4'  then do;
      GRP_LOG_LOAN2 = 0.63245553203367;
      GRP_LOG_LOAN3 = 0.63245553203367;
      GRP_LOG_LOAN4 = -0.63245553203367;
   end;
   else do;
      GRP_LOG_LOAN2 = .;
      GRP_LOG_LOAN3 = .;
      GRP_LOG_LOAN4 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for GRP_LOG_MORTDUE ;
drop GRP_LOG_MORTDUE1 GRP_LOG_MORTDUE2 GRP_LOG_MORTDUE3 GRP_LOG_MORTDUE4 ;
if missing( GRP_LOG_MORTDUE ) then do;
   GRP_LOG_MORTDUE1 = .;
   GRP_LOG_MORTDUE2 = .;
   GRP_LOG_MORTDUE3 = .;
   GRP_LOG_MORTDUE4 = .;
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
            GRP_LOG_MORTDUE1 = -0.55901699437494;
            GRP_LOG_MORTDUE2 = -0.55901699437494;
            GRP_LOG_MORTDUE3 = -0.55901699437494;
            GRP_LOG_MORTDUE4 = -0.55901699437494;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '2'  then do;
               GRP_LOG_MORTDUE1 = 0.55901699437494;
               GRP_LOG_MORTDUE2 = -0.55901699437494;
               GRP_LOG_MORTDUE3 = -0.55901699437494;
               GRP_LOG_MORTDUE4 = -0.55901699437494;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '3'  then do;
            GRP_LOG_MORTDUE1 = 0.55901699437494;
            GRP_LOG_MORTDUE2 = 0.55901699437494;
            GRP_LOG_MORTDUE3 = -0.55901699437494;
            GRP_LOG_MORTDUE4 = -0.55901699437494;
            _dm_find = 1;
         end;
      end;
   end;
   else do;
      if _dm12 = '4'  then do;
         GRP_LOG_MORTDUE1 = 0.55901699437494;
         GRP_LOG_MORTDUE2 = 0.55901699437494;
         GRP_LOG_MORTDUE3 = 0.55901699437494;
         GRP_LOG_MORTDUE4 = -0.55901699437494;
         _dm_find = 1;
      end;
      else do;
         if _dm12 = '5'  then do;
            GRP_LOG_MORTDUE1 = 0.55901699437494;
            GRP_LOG_MORTDUE2 = 0.55901699437494;
            GRP_LOG_MORTDUE3 = 0.55901699437494;
            GRP_LOG_MORTDUE4 = 0.55901699437494;
            _dm_find = 1;
         end;
      end;
   end;
   if not _dm_find then do;
      GRP_LOG_MORTDUE1 = .;
      GRP_LOG_MORTDUE2 = .;
      GRP_LOG_MORTDUE3 = .;
      GRP_LOG_MORTDUE4 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for GRP_LOG_VALUE ;
drop GRP_LOG_VALUE1 GRP_LOG_VALUE2 GRP_LOG_VALUE3 GRP_LOG_VALUE4 ;
if missing( GRP_LOG_VALUE ) then do;
   GRP_LOG_VALUE1 = .;
   GRP_LOG_VALUE2 = .;
   GRP_LOG_VALUE3 = .;
   GRP_LOG_VALUE4 = .;
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
            GRP_LOG_VALUE1 = -0.55901699437494;
            GRP_LOG_VALUE2 = -0.55901699437494;
            GRP_LOG_VALUE3 = -0.55901699437494;
            GRP_LOG_VALUE4 = -0.55901699437494;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '2'  then do;
               GRP_LOG_VALUE1 = 0.55901699437494;
               GRP_LOG_VALUE2 = -0.55901699437494;
               GRP_LOG_VALUE3 = -0.55901699437494;
               GRP_LOG_VALUE4 = -0.55901699437494;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '3'  then do;
            GRP_LOG_VALUE1 = 0.55901699437494;
            GRP_LOG_VALUE2 = 0.55901699437494;
            GRP_LOG_VALUE3 = -0.55901699437494;
            GRP_LOG_VALUE4 = -0.55901699437494;
            _dm_find = 1;
         end;
      end;
   end;
   else do;
      if _dm12 = '4'  then do;
         GRP_LOG_VALUE1 = 0.55901699437494;
         GRP_LOG_VALUE2 = 0.55901699437494;
         GRP_LOG_VALUE3 = 0.55901699437494;
         GRP_LOG_VALUE4 = -0.55901699437494;
         _dm_find = 1;
      end;
      else do;
         if _dm12 = '5'  then do;
            GRP_LOG_VALUE1 = 0.55901699437494;
            GRP_LOG_VALUE2 = 0.55901699437494;
            GRP_LOG_VALUE3 = 0.55901699437494;
            GRP_LOG_VALUE4 = 0.55901699437494;
            _dm_find = 1;
         end;
      end;
   end;
   if not _dm_find then do;
      GRP_LOG_VALUE1 = .;
      GRP_LOG_VALUE2 = .;
      GRP_LOG_VALUE3 = .;
      GRP_LOG_VALUE4 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for GRP_LOG_YOJ ;
drop GRP_LOG_YOJ1 GRP_LOG_YOJ2 GRP_LOG_YOJ3 GRP_LOG_YOJ4 ;
if missing( GRP_LOG_YOJ ) then do;
   GRP_LOG_YOJ1 = .;
   GRP_LOG_YOJ2 = .;
   GRP_LOG_YOJ3 = .;
   GRP_LOG_YOJ4 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( GRP_LOG_YOJ , BEST12. );
   %DMNORMIP( _dm12 )
   _dm_find = 0; drop _dm_find;
   if _dm12 <= '3'  then do;
      if _dm12 <= '2'  then do;
         if _dm12 = '1'  then do;
            GRP_LOG_YOJ1 = -0.55901699437494;
            GRP_LOG_YOJ2 = -0.55901699437494;
            GRP_LOG_YOJ3 = -0.55901699437494;
            GRP_LOG_YOJ4 = -0.55901699437494;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '2'  then do;
               GRP_LOG_YOJ1 = 0.55901699437494;
               GRP_LOG_YOJ2 = -0.55901699437494;
               GRP_LOG_YOJ3 = -0.55901699437494;
               GRP_LOG_YOJ4 = -0.55901699437494;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '3'  then do;
            GRP_LOG_YOJ1 = 0.55901699437494;
            GRP_LOG_YOJ2 = 0.55901699437494;
            GRP_LOG_YOJ3 = -0.55901699437494;
            GRP_LOG_YOJ4 = -0.55901699437494;
            _dm_find = 1;
         end;
      end;
   end;
   else do;
      if _dm12 = '4'  then do;
         GRP_LOG_YOJ1 = 0.55901699437494;
         GRP_LOG_YOJ2 = 0.55901699437494;
         GRP_LOG_YOJ3 = 0.55901699437494;
         GRP_LOG_YOJ4 = -0.55901699437494;
         _dm_find = 1;
      end;
      else do;
         if _dm12 = '5'  then do;
            GRP_LOG_YOJ1 = 0.55901699437494;
            GRP_LOG_YOJ2 = 0.55901699437494;
            GRP_LOG_YOJ3 = 0.55901699437494;
            GRP_LOG_YOJ4 = 0.55901699437494;
            _dm_find = 1;
         end;
      end;
   end;
   if not _dm_find then do;
      GRP_LOG_YOJ1 = .;
      GRP_LOG_YOJ2 = .;
      GRP_LOG_YOJ3 = .;
      GRP_LOG_YOJ4 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for GRP_NINQ ;
drop GRP_NINQ1 GRP_NINQ2 GRP_NINQ3 ;
if missing( GRP_NINQ ) then do;
   GRP_NINQ1 = .;
   GRP_NINQ2 = .;
   GRP_NINQ3 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( GRP_NINQ , BEST12. );
   %DMNORMIP( _dm12 )
   if _dm12 = '1'  then do;
      GRP_NINQ1 = -0.63245553203367;
      GRP_NINQ2 = -0.63245553203367;
      GRP_NINQ3 = -0.63245553203367;
   end;
   else if _dm12 = '2'  then do;
      GRP_NINQ1 = 0.63245553203367;
      GRP_NINQ2 = -0.63245553203367;
      GRP_NINQ3 = -0.63245553203367;
   end;
   else if _dm12 = '4'  then do;
      GRP_NINQ1 = 0.63245553203367;
      GRP_NINQ2 = 0.63245553203367;
      GRP_NINQ3 = 0.63245553203367;
   end;
   else if _dm12 = '3'  then do;
      GRP_NINQ1 = 0.63245553203367;
      GRP_NINQ2 = 0.63245553203367;
      GRP_NINQ3 = -0.63245553203367;
   end;
   else do;
      GRP_NINQ1 = .;
      GRP_NINQ2 = .;
      GRP_NINQ3 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for GRP_REASON ;
drop GRP_REASON1 GRP_REASON2 ;
if missing( GRP_REASON ) then do;
   GRP_REASON1 = .;
   GRP_REASON2 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( GRP_REASON , BEST12. );
   %DMNORMIP( _dm12 )
   if _dm12 = '2'  then do;
      GRP_REASON1 = 0.75;
      GRP_REASON2 = -0.75;
   end;
   else if _dm12 = '3'  then do;
      GRP_REASON1 = 0.75;
      GRP_REASON2 = 0.75;
   end;
   else if _dm12 = '1'  then do;
      GRP_REASON1 = -0.75;
      GRP_REASON2 = -0.75;
   end;
   else do;
      GRP_REASON1 = .;
      GRP_REASON2 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;
*** *************************;
*** Writing the Node ord ;
*** *************************;
*** *************************;
*** Writing the Node H1 ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   H11  =  9.9999999600419E-11 * GRP_INDELINQ3  +  1.0000000133514E-10 * 
        GRP_INDEROG3  +   1.000000000341E-10 * GRP_JOB1
          +     0.05008717989805 * GRP_JOB2  +     0.08023042969491 * GRP_JOB3
          +   1.000000000341E-10 * GRP_JOB4  +  9.9999999600419E-11 * GRP_JOB5
          +      0.1850031165278 * GRP_JOB6  +      0.0236044559772 * 
        GRP_LOG_CLAGE1  +     0.18353369591421 * GRP_LOG_CLAGE2
          +     0.04452662957432 * GRP_LOG_CLAGE3  +     0.17795522482642 * 
        GRP_LOG_CLAGE4  +     0.13453214051882 * GRP_LOG_CLNO1
          +   9.999999992568E-11 * GRP_LOG_CLNO2  +   1.000000000341E-10 * 
        GRP_LOG_CLNO3  +   1.000000000341E-10 * GRP_LOG_CLNO4
          +     1.21265583748325 * GRP_LOG_DEBTINC1  +     0.15112909156485 * 
        GRP_LOG_DEBTINC2  +   1.000000000341E-10 * GRP_LOG_DEBTINC3
          +     0.17873684560066 * GRP_LOG_DEBTINC4  +  1.0000000133514E-10 * 
        GRP_LOG_DELINQ1  +     0.01539244480238 * GRP_LOG_DEROG1
          +     0.08868945875758 * GRP_LOG_LOAN2  +     0.06961668106695 * 
        GRP_LOG_LOAN3  +     0.07046851132703 * GRP_LOG_LOAN4
          +  1.0000000133514E-10 * GRP_LOG_MORTDUE1  +  9.9999999600419E-11 * 
        GRP_LOG_MORTDUE2  +   1.000000000341E-10 * GRP_LOG_MORTDUE3
          +  9.9999999600419E-11 * GRP_LOG_MORTDUE4  +     0.56263103121987 * 
        GRP_LOG_VALUE1  +     0.16292857947328 * GRP_LOG_VALUE2
          +   1.000000000341E-10 * GRP_LOG_VALUE3  +  9.9999999600419E-11 * 
        GRP_LOG_VALUE4  +  9.9999999600419E-11 * GRP_LOG_YOJ1
          +   1.000000000341E-10 * GRP_LOG_YOJ2  +   1.000000000341E-10 * 
        GRP_LOG_YOJ3  +  1.0000000014252E-10 * GRP_LOG_YOJ4
          +  9.9999994396249E-11 * GRP_NINQ1  +  1.0000000025094E-10 * 
        GRP_NINQ2  +     0.00148397298285 * GRP_NINQ3
          +     0.00024098412364 * GRP_REASON1  +     0.12246745134608 * 
        GRP_REASON2 ;
   H12  =     0.68984348905144 * GRP_INDELINQ3  +     0.45645864713083 * 
        GRP_INDEROG3  +     0.38623080361566 * GRP_JOB1
          +   1.000000000341E-10 * GRP_JOB2  +  9.9999999600419E-11 * GRP_JOB3
          +     0.47476223931695 * GRP_JOB4  +     0.04143822312697 * GRP_JOB5
          +      0.0479561732778 * GRP_JOB6  +     0.13113144170919 * 
        GRP_LOG_CLAGE1  +  1.0000000046778E-10 * GRP_LOG_CLAGE2
          +     0.00789278468195 * GRP_LOG_CLAGE3  +     0.00189921003957 * 
        GRP_LOG_CLAGE4  +     0.14606928633448 * GRP_LOG_CLNO1
          +   1.000000000341E-10 * GRP_LOG_CLNO2  +     0.00607480435339 * 
        GRP_LOG_CLNO3  +   1.000000000341E-10 * GRP_LOG_CLNO4
          +  9.9999999600419E-11 * GRP_LOG_DEBTINC1  +     0.12651297905145 * 
        GRP_LOG_DEBTINC2  +     0.28836150522523 * GRP_LOG_DEBTINC3
          +     0.50134618658119 * GRP_LOG_DEBTINC4  +     0.28092464730212 * 
        GRP_LOG_DELINQ1  +     0.57659304900786 * GRP_LOG_DEROG1
          +     0.23128310697574 * GRP_LOG_LOAN2  +     0.02567952367831 * 
        GRP_LOG_LOAN3  +     0.04464000976882 * GRP_LOG_LOAN4
          +   1.000000000341E-10 * GRP_LOG_MORTDUE1  +     0.00018169062081 * 
        GRP_LOG_MORTDUE2  +   1.000000000341E-10 * GRP_LOG_MORTDUE3
          +     0.24418316012477 * GRP_LOG_MORTDUE4  +   1.000000000341E-10 * 
        GRP_LOG_VALUE1  +  1.0000000133514E-10 * GRP_LOG_VALUE2
          +  9.9999999600419E-11 * GRP_LOG_VALUE3  +     0.23833599903531 * 
        GRP_LOG_VALUE4  +     0.16418753386424 * GRP_LOG_YOJ1
          +  9.9999999600419E-11 * GRP_LOG_YOJ2  +  9.9999999600419E-11 * 
        GRP_LOG_YOJ3  +   9.999999997989E-11 * GRP_LOG_YOJ4
          +     0.20121728634519 * GRP_NINQ1  +      0.0824273831373 * 
        GRP_NINQ2  +     0.43986255487106 * GRP_NINQ3
          +     0.01374331483548 * GRP_REASON1  +     0.35938352013272 * 
        GRP_REASON2 ;
   H13  =  9.9999999600419E-11 * GRP_INDELINQ3  +  1.0000000133514E-10 * 
        GRP_INDEROG3  +      0.0850787266472 * GRP_JOB1
          +     0.08697698049009 * GRP_JOB2  +     0.09487999844943 * GRP_JOB3
          +  1.0000000133514E-10 * GRP_JOB4  +   9.999999997989E-11 * GRP_JOB5
          +     0.09476311924983 * GRP_JOB6  +     0.09633628402877 * 
        GRP_LOG_CLAGE1  +     0.40590180699987 * GRP_LOG_CLAGE2
          +     0.56243410114358 * GRP_LOG_CLAGE3  +     0.09813793418579 * 
        GRP_LOG_CLAGE4  +     0.00214687772347 * GRP_LOG_CLNO1
          +     0.09363855516409 * GRP_LOG_CLNO2  +  9.9999999600419E-11 * 
        GRP_LOG_CLNO3  +   1.000000000341E-10 * GRP_LOG_CLNO4
          +     0.43543098237579 * GRP_LOG_DEBTINC1  +     0.11593382607123 * 
        GRP_LOG_DEBTINC2  +   1.000000000341E-10 * GRP_LOG_DEBTINC3
          +  9.9999999600419E-11 * GRP_LOG_DEBTINC4  +     0.21453998748928 * 
        GRP_LOG_DELINQ1  +     0.13739316440012 * GRP_LOG_DEROG1
          +  9.9999999600419E-11 * GRP_LOG_LOAN2  +  1.0000000133514E-10 * 
        GRP_LOG_LOAN3  +     0.09794806265167 * GRP_LOG_LOAN4
          +     0.17076415843403 * GRP_LOG_MORTDUE1  +     0.35923992103045 * 
        GRP_LOG_MORTDUE2  +     0.06888684238484 * GRP_LOG_MORTDUE3
          +     0.19287015294738 * GRP_LOG_MORTDUE4  +     0.33179247749502 * 
        GRP_LOG_VALUE1  +     0.17642957444055 * GRP_LOG_VALUE2
          +     0.09863773992669 * GRP_LOG_VALUE3  +  9.9999999993443E-11 * 
        GRP_LOG_VALUE4  +  1.0000000133514E-10 * GRP_LOG_YOJ1
          +     0.13056368530899 * GRP_LOG_YOJ2  +     0.23263608717254 * 
        GRP_LOG_YOJ3  +     0.05960527277735 * GRP_LOG_YOJ4
          +  9.9999999600419E-11 * GRP_NINQ1  +   1.000000000341E-10 * 
        GRP_NINQ2  +     0.06885844227348 * GRP_NINQ3
          +     0.03011752807588 * GRP_REASON1  +     0.15223826213802 * 
        GRP_REASON2 ;
   H11  =     0.40334970202873 + H11 ;
   H12  =    -0.03605065921952 + H12 ;
   H13  =    -1.42308543156766 + H13 ;
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
IF _DM_BAD EQ 0 THEN DO;
   P_BAD1  =    -2.63470208583197 * H11  +     1.86742307499411 * H12
          +    -1.33116147749524 * H13 ;
   P_BAD1  =    -0.33697759343629 + P_BAD1 ;
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
   P_BAD1  =     0.19941225860621;
   P_BAD0  =     0.80058774139378;
END;
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

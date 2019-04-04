****************************************************************;
******             DECISION TREE SCORING CODE             ******;
****************************************************************;
 
******         LENGTHS OF NEW CHARACTER VARIABLES         ******;
LENGTH I_BAD  $   12;
LENGTH _WARN_  $    4;
 
******              LABELS FOR NEW VARIABLES              ******;
label _NODE_ = 'Node' ;
label _LEAF_ = 'Leaf' ;
label P_BAD1 = 'Predicted: BAD=1' ;
label P_BAD0 = 'Predicted: BAD=0' ;
label Q_BAD1 = 'Unadjusted P: BAD=1' ;
label Q_BAD0 = 'Unadjusted P: BAD=0' ;
label V_BAD1 = 'Validated: BAD=1' ;
label V_BAD0 = 'Validated: BAD=0' ;
label I_BAD = 'Into: BAD' ;
label U_BAD = 'Unnormalized Into: BAD' ;
label _WARN_ = 'Warnings' ;
 
 
******      TEMPORARY VARIABLES FOR FORMATTED VALUES      ******;
LENGTH _ARBFMT_12 $     12; DROP _ARBFMT_12;
_ARBFMT_12 = ' '; /* Initialize to avoid warning. */
 
 
******             ASSIGN OBSERVATION TO NODE             ******;
IF  NOT MISSING(DEBTINC ) AND
  DEBTINC  <     44.7336573513381 THEN DO;
  IF  NOT MISSING(VALUE ) AND
    VALUE  <               303749 THEN DO;
    IF  NOT MISSING(DELINQ ) AND
                         6 <= DELINQ  THEN DO;
      _NODE_  =                    9;
      _LEAF_  =                    2;
      P_BAD1  =                    1;
      P_BAD0  =                    0;
      Q_BAD1  =                    1;
      Q_BAD0  =                    0;
      V_BAD1  =                    1;
      V_BAD0  =                    0;
      I_BAD  = '1' ;
      U_BAD  =                    1;
      END;
    ELSE DO;
      _NODE_  =                    8;
      _LEAF_  =                    1;
      P_BAD1  =     0.06195652173913;
      P_BAD0  =     0.93804347826086;
      Q_BAD1  =     0.06195652173913;
      Q_BAD0  =     0.93804347826086;
      V_BAD1  =     0.05961251862891;
      V_BAD0  =     0.94038748137108;
      I_BAD  = '0' ;
      U_BAD  =                    0;
      END;
    END;
  ELSE DO;
    _NODE_  =                    5;
    _LEAF_  =                    3;
    P_BAD1  =                0.875;
    P_BAD0  =                0.125;
    Q_BAD1  =                0.875;
    Q_BAD0  =                0.125;
    V_BAD1  =                  0.7;
    V_BAD0  =                  0.3;
    I_BAD  = '1' ;
    U_BAD  =                    1;
    END;
  END;
ELSE DO;
  IF  NOT MISSING(DELINQ ) AND
                     0.5 <= DELINQ  THEN DO;
    IF  NOT MISSING(CLAGE ) AND
          345.933333333333 <= CLAGE  THEN DO;
      _NODE_  =                   13;
      _LEAF_  =                   10;
      P_BAD1  =     0.16666666666666;
      P_BAD0  =     0.83333333333333;
      Q_BAD1  =     0.16666666666666;
      Q_BAD0  =     0.83333333333333;
      V_BAD1  =                  0.5;
      V_BAD0  =                  0.5;
      I_BAD  = '0' ;
      U_BAD  =                    0;
      END;
    ELSE DO;
      IF  NOT MISSING(DELINQ ) AND
                         2.5 <= DELINQ  THEN DO;
        _NODE_  =                   21;
        _LEAF_  =                    9;
        P_BAD1  =     0.97222222222222;
        P_BAD0  =     0.02777777777777;
        Q_BAD1  =     0.97222222222222;
        Q_BAD0  =     0.02777777777777;
        V_BAD1  =     0.94915254237288;
        V_BAD0  =     0.05084745762711;
        I_BAD  = '1' ;
        U_BAD  =                    1;
        END;
      ELSE DO;
        IF  NOT MISSING(NINQ ) AND
          NINQ  <                  0.5 THEN DO;
          _NODE_  =                   28;
          _LEAF_  =                    6;
          P_BAD1  =     0.54838709677419;
          P_BAD0  =      0.4516129032258;
          Q_BAD1  =     0.54838709677419;
          Q_BAD0  =      0.4516129032258;
          V_BAD1  =              0.71875;
          V_BAD0  =              0.28125;
          I_BAD  = '1' ;
          U_BAD  =                    1;
          END;
        ELSE DO;
          IF  NOT MISSING(DEROG ) THEN DO;
            _NODE_  =                   38;
            _LEAF_  =                    7;
            P_BAD1  =      0.9076923076923;
            P_BAD0  =     0.09230769230769;
            Q_BAD1  =      0.9076923076923;
            Q_BAD0  =     0.09230769230769;
            V_BAD1  =     0.85245901639344;
            V_BAD0  =     0.14754098360655;
            I_BAD  = '1' ;
            U_BAD  =                    1;
            END;
          ELSE DO;
            _NODE_  =                   39;
            _LEAF_  =                    8;
            P_BAD1  =     0.33333333333333;
            P_BAD0  =     0.66666666666666;
            Q_BAD1  =     0.33333333333333;
            Q_BAD0  =     0.66666666666666;
            V_BAD1  =     0.33333333333333;
            V_BAD0  =     0.66666666666666;
            I_BAD  = '0' ;
            U_BAD  =                    0;
            END;
          END;
        END;
      END;
    END;
  ELSE DO;
    IF  NOT MISSING(CLAGE ) AND
          154.733333333333 <= CLAGE  THEN DO;
      _NODE_  =                   11;
      _LEAF_  =                    5;
      P_BAD1  =     0.35211267605633;
      P_BAD0  =     0.64788732394366;
      Q_BAD1  =     0.35211267605633;
      Q_BAD0  =     0.64788732394366;
      V_BAD1  =     0.34710743801652;
      V_BAD0  =     0.65289256198347;
      I_BAD  = '0' ;
      U_BAD  =                    0;
      END;
    ELSE DO;
      _NODE_  =                   10;
      _LEAF_  =                    4;
      P_BAD1  =     0.71573604060913;
      P_BAD0  =     0.28426395939086;
      Q_BAD1  =     0.71573604060913;
      Q_BAD0  =     0.28426395939086;
      V_BAD1  =     0.60264900662251;
      V_BAD0  =     0.39735099337748;
      I_BAD  = '1' ;
      U_BAD  =                    1;
      END;
    END;
  END;
 
****************************************************************;
******          END OF DECISION TREE SCORING CODE         ******;
****************************************************************;
 
drop _LEAF_;

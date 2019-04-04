*------------------------------------------------------------*;
* Score: Creating Fixed Names;
*------------------------------------------------------------*;
LABEL EM_EVENTPROBABILITY = 'Probability for level 1 of BAD';
EM_EVENTPROBABILITY = P_BAD1;
LABEL EM_PROBABILITY = 'Probability of Classification';
EM_PROBABILITY =
max(
P_BAD1
,
P_BAD0
);
LENGTH EM_CLASSIFICATION $%dmnorlen;
LABEL EM_CLASSIFICATION = "Prediction for BAD";
EM_CLASSIFICATION = I_BAD;

label LOG_DEBTINC = 'Transformed DEBTINC';
if DEBTINC eq . then LOG_DEBTINC = .;
else do;
if DEBTINC + 1 > 0 then LOG_DEBTINC = log(DEBTINC + 1);
else LOG_DEBTINC = .;
end;

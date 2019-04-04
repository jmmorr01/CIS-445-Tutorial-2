label LOG_DELINQ = 'Transformed DELINQ';
if DELINQ eq . then LOG_DELINQ = .;
else do;
if DELINQ + 1 > 0 then LOG_DELINQ = log(DELINQ + 1);
else LOG_DELINQ = .;
end;

label LOG_LOAN = 'Transformed LOAN';
if LOAN eq . then LOG_LOAN = .;
else do;
if LOAN + 1 > 0 then LOG_LOAN = log(LOAN + 1);
else LOG_LOAN = .;
end;

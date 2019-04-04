label LOG_DEROG = 'Transformed DEROG';
if DEROG eq . then LOG_DEROG = .;
else do;
if DEROG + 1 > 0 then LOG_DEROG = log(DEROG + 1);
else LOG_DEROG = .;
end;

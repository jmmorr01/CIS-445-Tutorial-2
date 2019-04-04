label LOG_MORTDUE = 'Transformed MORTDUE';
if MORTDUE eq . then LOG_MORTDUE = .;
else do;
if MORTDUE + 1 > 0 then LOG_MORTDUE = log(MORTDUE + 1);
else LOG_MORTDUE = .;
end;

label LOG_CLNO = 'Transformed CLNO';
if CLNO eq . then LOG_CLNO = .;
else do;
if CLNO + 1 > 0 then LOG_CLNO = log(CLNO + 1);
else LOG_CLNO = .;
end;

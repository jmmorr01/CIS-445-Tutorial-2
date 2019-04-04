label LOG_CLAGE = 'Transformed CLAGE';
if CLAGE eq . then LOG_CLAGE = .;
else do;
if CLAGE + 1 > 0 then LOG_CLAGE = log(CLAGE + 1);
else LOG_CLAGE = .;
end;

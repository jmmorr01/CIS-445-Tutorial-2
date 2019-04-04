label LOG_VALUE = 'Transformed VALUE';
if VALUE eq . then LOG_VALUE = .;
else do;
if VALUE + 1 > 0 then LOG_VALUE = log(VALUE + 1);
else LOG_VALUE = .;
end;

if upcase(name) = 'CLNO' then role = 'REJECTED';
else
if upcase(name) = 'DEBTINC' then role = 'REJECTED';
else
if upcase(name) = 'DEROG' then role = 'REJECTED';
else
if upcase(name) = 'JOB' then role = 'REJECTED';
else
if upcase(name) = 'LOAN' then role = 'REJECTED';
else
if upcase(name) = 'MORTDUE' then role = 'REJECTED';
else
if upcase(name) = 'REASON' then role = 'REJECTED';
else
if upcase(name) = 'VALUE' then role = 'REJECTED';
if upcase(strip(name)) = "G_JOB" then level = "NOMINAL";


if NAME="INDELINQ" then do;
ROLE ="INPUT";
REPORT ="N";
LEVEL ="INTERVAL";
end;
if NAME="DELINQ" then delete;

if NAME="INDEROG" then do;
ROLE ="INPUT";
REPORT ="N";
LEVEL ="INTERVAL";
end;
if NAME="DEROG" then delete;

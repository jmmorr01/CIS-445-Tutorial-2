label LOG_YOJ = 'Transformed YOJ';
if YOJ eq . then LOG_YOJ = .;
else do;
if YOJ + 1 > 0 then LOG_YOJ = log(YOJ + 1);
else LOG_YOJ = .;
end;

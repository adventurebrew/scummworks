call nutcracker sputm build --ref orig\SAMNMAX.000 userdata\SAMNMAX
@REM call nutcracker sputm strings_inject -t strings.txt SAMNMAX.000
..\utils\scummtr -w -g samnmax -if strings.txt -p .
..\utils\md5deep64 -bz SAMNMAX.000 > hash.txt
..\utils\md5deep64 -bz SAMNMAX.001 >> hash.txt
pause

call nutcracker sputm build --ref fix\MONKEY2.000 userdata\MONKEY2
..\utils\scummtr -w -g monkey2 -if strings.txt -p .
@REM call nutcracker sputm strings_inject -t stringst.txt MONKEY2.000
..\utils\md5deep64 -bz MONKEY2.000 > hash.txt
..\utils\md5deep64 -bz MONKEY2.001 >> hash.txt
pause

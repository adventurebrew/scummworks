call nutcracker sputm build --ref fix\MONKEY2.000 userdata\MONKEY2 || exit 1
call nutcracker sputm strings_inject -t strings.txt MONKEY2.000 || exit 1
@REM ..\utils\scummtr -w -g monkey2 -if strings.txt -p .
..\utils\md5deep64 -bz MONKEY2.000 > hash.txt
..\utils\md5deep64 -bz MONKEY2.001 >> hash.txt
pause

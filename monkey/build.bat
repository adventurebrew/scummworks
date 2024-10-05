call nutcracker sputm build --ref orig\monkey.000 userdata\MONKEY || exit 1
call nutcracker sputm strings_inject -t strings.txt MONKEY.000 || exit 1
@REM ..\utils\scummtr -w -g monkeycd -if strings.txt -p .
..\utils\md5deep64 -bz MONKEY.000 > hash.txt
..\utils\md5deep64 -bz MONKEY.001 >> hash.txt
pause

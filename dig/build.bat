call nutcracker sputm build --ref orig\DIG.LA0 userdata\DIG || exit 1
call nutcracker sputm strings_inject -t strings.txt DIG.LA0 || exit 1
@REM ..\utils\scummtr -w -g dig -if strings.txt -p .
..\utils\md5deep64 -bz DIG.LA0 > hash.txt
..\utils\md5deep64 -bz DIG.LA1 >> hash.txt
pause

call nutcracker sputm build --ref orig\ATLANTIS.000 userdata\ATLANTIS || exit 1
call nutcracker sputm strings_inject -t strings.txt ATLANTIS.000 || exit 1
@REM ..\utils\scummtr -w -g atlantis -if strings.txt -p .
..\utils\md5deep64 -bz ATLANTIS.000 > hash.txt
..\utils\md5deep64 -bz ATLANTIS.001 >> hash.txt
pause

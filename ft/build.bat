call nutcracker sputm build --ref orig\FT.LA0 userdata\FT || exit 1
call nutcracker sputm strings_inject -t strings.txt FT.LA0 || exit 1
@REM ..\utils\scummtr -w -g ft -if strings.txt -p .
..\utils\md5deep64 -bz FT.LA0 > hash.txt
..\utils\md5deep64 -bz FT.LA1 >> hash.txt
pause

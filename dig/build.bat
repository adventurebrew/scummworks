python -m nutcracker.sputm.build --ref orig\DIG userdata\DIG
..\utils\scummtr -w -g dig -if strings.txt -p .
..\utils\md5deep64 -bz DIG.LA0 > hash.txt
..\utils\md5deep64 -bz DIG.LA1 >> hash.txt
pause

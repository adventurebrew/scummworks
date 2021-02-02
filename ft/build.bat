python -m nutcracker.sputm.build --ref orig\FT userdata\FT
..\utils\scummtr -w -g ft -if strings.txt -p .
..\utils\md5deep64 -bz FT.LA0 > hash.txt
..\utils\md5deep64 -bz FT.LA1 >> hash.txt
pause

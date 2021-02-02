python -m nutcracker.sputm.build --ref orig\ATLANTIS userdata\ATLANTIS
..\utils\scummtr -w -g atlantis -if strings.txt -p .
..\utils\md5deep64 -bz ATLANTIS.000 > hash.txt
..\utils\md5deep64 -bz ATLANTIS.001 >> hash.txt
pause

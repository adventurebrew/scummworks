call nutcracker sputm build --ref orig\TENTACLE.000 userdata\TENTACLE
..\utils\scummtr -w -g tentacle -if strings.txt -p .
..\utils\md5deep64 -bz TENTACLE.000 > hash.txt
..\utils\md5deep64 -bz TENTACLE.001 >> hash.txt
pause

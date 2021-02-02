python -m nutcracker.sputm.build --ref orig\SAMNMAX userdata\SAMNMAX
..\utils\scummtr -w -g samnmax -if strings.txt -p .
..\utils\md5deep64 -bz SAMNMAX.000 > hash.txt
..\utils\md5deep64 -bz SAMNMAX.001 >> hash.txt
pause

call nutcracker sputm build --ref orig\COMI.LA0 userdata\COMI
..\utils\md5deep64 -bz COMI.LA0 > hash.txt
..\utils\md5deep64 -bz COMI.LA1 >> hash.txt
..\utils\md5deep64 -bz COMI.LA2 >> hash.txt
pause

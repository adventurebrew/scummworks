call nutcracker sputm build --ref orig/SPYFOX.HE0 userdata\SPYFOX
call nutcracker sputm strings_inject -t strings.txt SPYFOX.HE0
..\utils\md5deep64 -bz SPYFOX.HE0 > hash.txt
..\utils\md5deep64 -bz SPYFOX.HE1 >> hash.txt
pause

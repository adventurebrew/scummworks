call nutcracker sputm build --ref orig/PAJAMA.HE0 userdata\PAJAMA
call nutcracker sputm strings_inject -t strings.txt PAJAMA.HE0
..\utils\md5deep64 -bz PAJAMA.HE0 > hash.txt
..\utils\md5deep64 -bz PAJAMA.HE1 >> hash.txt
pause

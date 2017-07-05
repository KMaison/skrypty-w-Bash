cut -d" " -f 1,7,9 cdlinux.www.log|sort -u|cut -d":" -f 2|grep "200"|sort -u|cut -d" " -f 1,2|grep "cdlinux-.*iso" >tmp.txt


grep "OK DOWNLOAD" cdlinux.ftp.log|cut -d"\"" -f 2,4|sort -u >>tmp.txt


grep -o "cdlinux-.*iso" tmp.txt|sort|uniq -c >wyniki.txt


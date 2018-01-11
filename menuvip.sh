#!/bin/bash

if [[ -e /etc/debian_version ]]; then
	OS=debian
	RCLOCAL='/etc/rc.local'
elif [[ -e /etc/centos-release || -e /etc/redhat-release ]]; then
	OS=centos
	RCLOCAL='/etc/rc.d/rc.local'
	chmod +x /etc/rc.d/rc.local
else
	echo "ดูเหมือนว่าคุณไม่ได้ใช้ตัวติดตั้งนี้ในระบบ Debian, Ubuntu หรือ CentOS"
	exit
fi
color1='\e[031;1m'
color2='\e[34;1m'
color3='\e[0m'
	  echo  "--------------------------------------------" 

	cname=$( awk -F: '/model name/ {name=$2} END {print name}' /proc/cpuinfo )
	cores=$( awk -F: '/model name/ {core++} END {print core}' /proc/cpuinfo )
	freq=$( awk -F: ' /cpu MHz/ {freq=$2} END {print freq}' /proc/cpuinfo )
	tram=$( free -m | awk 'NR==2 {print $2}' )
	swap=$( free -m | awk 'NR==4 {print $2}' )
	up=$(uptime|awk '{ $1=$2=$(NF-6)=$(NF-5)=$(NF-4)=$(NF-3)=$(NF-2)=$(NF-1)=$NF=""; print }')
	
lolcat -F 0.3 -S 0 /usr/bin/bannermenu
echo "                           Server: $MYIP" | lolcat
date +"                           %A, %d-%m-%Y" | lolcat
date +"                                   %H:%M:%S %Z" | lolcat
echo ""
echo ""
	echo  "--------------------------------------------" 
	echo -e " [+] ${color1}1${color3}.  สร้างบัญชีแบบกำหนดเอง"
	echo -e " [+] ${color1}2${color3}.  สร้างบัญชีแบบอัตโนมัติ เลือกจำนวน บัญชี"
	echo -e " [+] ${color1}3${color3}.  สร้างบัญชีแบบทดลองใช้"
	echo -e " [+] ${color1}4${color3}.  อัปเดตวันใช้งานของผู้ใช้"
	echo -e " [+] ${color1}5${color3}.  เปลี่ยนรหัสผ่านของผู้ใช้"
	echo -e " [+] ${color1}6${color3}.  ผู้ใช้ที่ถูกแบนที่เข้าสู่ระบบหลายบัญชีของผู้ใช้"
	echo -e " [+] ${color1}7${color3}.  ผู้ใช้ที่ไม่ได้รับอนุญาต"
	echo -e " [+] ${color1}8${color3}.  ล็อคผู้ใช้ของผู้ใช้"
	echo -e " [+] ${color1}9${color3}.  ปลดล็อคผู้ใช้ของผู้ใช้"
	echo -e " [+] ${color1}10${color3}. ลบบัญชีของผู้ใช้"
	echo -e " [+] ${color1}11${color3}. ดูรายละเอียดผู้ใช้"
	echo -e " [+] ${color1}12${color3}. แสดงรายชื่อผู้ใช้"
	echo -e " [+] ${color1}13${color3}. ตรวจสอบการเข้าสู่ระบบของผู้ใช้"
	echo -e " [+] ${color1}14${color3}. ดูบันทึกการเข้าสู่ระบบของผู้ใช้"
	echo -e " [+] ${color1}15${color3}. กำจัดการเข้าสู่ระบบแบบซ้อน"
	echo -e " [+] ${color1}16${color3}. แสดงผู้ใช้ที่ไกล้จะหมดอายุ"
	echo -e " [+] ${color1}17${color3}. แสดงผู้ใช้ที่หมดอายุแล้ว"
	echo -e " [+] ${color1}18${color3}. ลบผู้ใช้ที่หมดอายุแล้ว"
	echo -e " [+] ${color1}19${color3}. ล็อกผู้ใช้ที่หมดอายุแล้ว"
	echo -e " [+] ${color1}20${color3}. ดูรายชื่อผู้ใช้ที่สนใจ"
	echo -e " [+] ${color1}21${color3}. ดูรายชื่อผู้ใช้ที่ถูกสั่งห้าม"
	echo -e " [+] ${color1}22${color3}. สร้างบัญชี PPTP VPN"
	echo -e " [+] ${color1}23${color3}. นำบัญชี PPTP VPN ออก"
	echo -e " [+] ${color1}24${color3}. ดูรายละเอียดบัญชี PPTP VPN"
	echo -e " [+] ${color1}25${color3}. ตรวจสอบการเข้าสู่ระบบ PPTP VPN"
	echo -e " [+] ${color1}26${color3}. ดูรายชื่อผู้ใช้ PPTP VPN"
	echo -e " [+] ${color1}27${color3}. ทดสอบความเร็ว"
	echo -e " [+] ${color1}28${color3}. มาตรฐานเซิร์ฟเวอร์"
	echo -e " [+] ${color1}29${color3}. ดูการใช้ RAM ของเซิร์ฟเวอร์"
if [[ "$OS" = 'debian' ]]; then 
	echo -e " [+] ${color1}30${color3}. รีสตาร์ท OpenSSH"
	echo -e " [+] ${color1}31${color3}. รีสตาร์ท DropBear"
	echo -e " [+] ${color1}32${color3}. รีสตาร์ท OpenVPN"
	echo -e " [+] ${color1}33${color3}. รีสตาร์ท PPTPVPN"
	echo -e " [+] ${color1}34${color3}. รีสตาร์ท Webmin"
	echo -e " [+] ${color1}35${color3}. รีสตาร์ท SquidProxy"
else
	echo -e " [+] ${color1}30${color3}. รีสตาร์ท OpenSSH"
	echo -e " [+] ${color1}31${color3}. รีสตาร์ท DropBear"
	echo -e " [+] ${color1}32${color3}. รีสตาร์ท OpenVPN"
	echo -e " [+] ${color1}33${color3}. รีสตาร์ท PPTPVPN"
	echo -e " [+] ${color1}34${color3}. รีสตาร์ท Webmin"
	echo -e " [+] ${color1}35${color3}. รีสตาร์ท SquidProxy"
fi
	echo -e " [+] ${color1}36${color3}. แก้ไขพอร์ตเซิร์ฟเวอร์"
	echo -e " [+] ${color1}37${color3}. ตั้งค่าเซิร์ฟเวอร์รีบูตอัตโนมัติ"
	echo -e " [+] ${color1}38${color3}. รีสตาร์ทเซิร์ฟเวอร์"
	echo -e " [+] ${color1}39${color3}. เปลี่ยนรหัสผ่านเซิร์ฟเวอร์"
	echo -e " [+] ${color1}40${color3}. ดูบันทึกการติดตั้ง"
	echo -e " [+] ${color1}41${color3}. อัปเดตเดี๋ยวนี้"
	echo -e ""
	echo  "------------ พัฒนาโดย คุณเต้ ทารุมะ (เต้เล็ก) ------------" 
	echo -e ""
	read -p " [+] โปรดใส่ตัวเลือกของเมนู (ตัวเลข): " x
if test $x -eq 1; then
user-add
elif test $x -eq 2; then
user-generate
elif test $x -eq 3; then
trial
elif test $x -eq 4; then
user-aktif
elif test $x -eq 5; then
user-password
elif test $x -eq 6; then
read -p " [+] กรอกจำนวนเงินเข้าสู่ระบบสูงสุด (1-2): " MULTILOGIN
user-ban $MULTILOGIN
elif test $x -eq 7; then
user-unban
elif test $x -eq 8; then
user-lock
elif test $x -eq 9; then
user-unlock
elif test $x -eq 10; then
user-delete
elif test $x -eq 11; then
user-detail
elif test $x -eq 12; then
user-list
elif test $x -eq 13; then
user-login
elif test $x -eq 14; then
user-log
elif test $x -eq 15; then
read -p " [+] กรอกจำนวนเงินเข้าสู่ระบบสูงสุด (1-2): " MULTILOGIN
user-limit $MULTILOGIN
elif test $x -eq 16; then
infouser
elif test $x -eq 17; then
expireduser
elif test $x -eq 18; then
user-delete-expired
elif test $x -eq 19; then
clear
echo " [+] สคริปต์นี้จะทำงานโดยอัตโนมัติทุกๆ 12 ชั่วโมง"
echo " [+] คุณไม่จำเป็นต้องเรียกใช้ด้วยตนเอง"
echo " [+] หากคุณยังต้องการเรียกใช้สคริปต์นี้ให้พิมพ์ user-expire"
elif test $x -eq 20; then
log-limit
elif test $x -eq 21; then
log-ban
elif test $x -eq 22; then
user-add-pptp
elif test $x -eq 23; then
user-delete-pptp
elif test $x -eq 24; then
user-detail-pptp
elif test $x -eq 25; then
user-login-pptp
elif test $x -eq 26; then
alluser-pptp
elif test $x -eq 27; then
speedtest --share
elif test $x -eq 28; then
bench-network
elif test $x -eq 29; then
ram
elif test $x -eq 30; then
	if [[ "$OS" = 'debian' ]]; then 
		/etc/init.d/ssh restart 
	else 
		/etc/init.d/sshd restart 
	fi
elif test $x -eq 31; then
/etc/init.d/dropbear restart
elif test $x -eq 32; then
/etc/init.d/openvpn restart
elif test $x -eq 33; then
	if [[ "$OS" = 'debian' ]]; then 
		/etc/init.d/pptpd restart 
	else 
		/etc/init.d/pptpd restart 
	fi
elif test $x -eq 34; then
/etc/init.d/webmin restart
elif test $x -eq 35; then
	if [[ "$OS" = 'debian' ]]; then 
		/etc/init.d/squid3 restart 
	else 
		/etc/init.d/squid restart 
	fi
elif test $x -eq 36; then
edit-port
elif test $x -eq 37; then
auto-reboot
elif test $x -eq 38; then
reboot
elif test $x -eq 39; then
passwd
elif test $x -eq 40; then
log-install
elif test $x -eq 41; then
wget https://dl.dropboxusercontent.com/s/vcd7jdd7i2bg5bd/install-premiumscript.sh -O - -o /dev/null|sh
else
echo " [+] โปรดใส่ตัวเลขให้ถูกต้อง (ไม่พบตัวเลือกเมนู)"
exit
fi

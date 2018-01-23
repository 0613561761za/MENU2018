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
	
	echo -e " [o] \e[032;1mCPU model:\e[0m $cname"
	echo -e " [o] \e[032;1mNumber of cores:\e[0m $cores"
	echo -e " [o] \e[032;1mCPU frequency:\e[0m $freq MHz"
	echo -e " [o] \e[032;1mTotal amount of ram:\e[0m $tram MB"
	echo -e " [o] \e[032;1mTotal amount of swap:\e[0m $swap MB"
	echo -e " [o] \e[032;1mSystem uptime:\e[0m $up"
	echo  "-----------------------------------------------------------------" 
	echo -e " [o] ${color1}1${color3}.  สร้างบัญชีแบบกำหนดเอง"
	echo -e " [o] ${color1}2${color3}.  สร้างบัญชีแบบอัตโนมัติ เลือกจำนวน บัญชี"
	echo -e " [o] ${color1}3${color3}.  สร้างบัญชีแบบทดลองใช้"
	echo -e " [o] ${color1}4${color3}.  อัปเดตวันใช้งานของผู้ใช้"
	echo -e " [o] ${color1}5${color3}.  เปลี่ยนรหัสผ่านของผู้ใช้"
	echo  "-----------------------------------------------------------------" 	
	echo -e " [o] ${color1}6${color3}.  ผู้ใช้ที่ถูกแบนที่เข้าสู่ระบบหลายบัญชีของผู้ใช้"
	echo -e " [o] ${color1}8${color3}.  ล็อคผู้ใช้ของผู้ใช้"
	echo -e " [o] ${color1}9${color3}.  ปลดล็อคผู้ใช้ของผู้ใช้"
	echo -e " [o] ${color1}10${color3}. ลบบัญชีของผู้ใช้"
	echo -e " [o] ${color1}15${color3}. กำจัดการเข้าสู่ระบบแบบซ้อน"	
	echo  "-----------------------------------------------------------------" 		
	echo -e " [o] ${color1}12${color3}. แสดงรายชื่อผู้ใช้"
	echo -e " [o] ${color1}17${color3}. แสดงผู้ใช้ที่หมดอายุแล้ว"
	echo -e " [o] ${color1}18${color3}. ลบผู้ใช้ที่หมดอายุแล้ว"
	echo -e " [o] ${color1}27${color3}. ทดสอบความเร็ว"
	echo -e " [o] ${color1}29${color3}. ดูการใช้ RAM ของเซิร์ฟเวอร์"
	echo  "-----------------------------------------------------------------" 	
if [[ "$OS" = 'debian' ]]; then 
	echo -e " [o] ${color1}30${color3}. รีสตาร์ท OpenSSH"
	echo -e " [o] ${color1}31${color3}. รีสตาร์ท DropBear"
	echo -e " [o] ${color1}32${color3}. รีสตาร์ท OpenVPN"
	echo -e " [o] ${color1}33${color3}. รีสตาร์ท PPTPVPN"
	echo -e " [o] ${color1}34${color3}. รีสตาร์ท Webmin"
	echo -e " [o] ${color1}35${color3}. รีสตาร์ท SquidProxy"
else
	echo -e " [o] ${color1}30${color3}. รีสตาร์ท OpenSSH"
	echo -e " [o] ${color1}31${color3}. รีสตาร์ท DropBear"
	echo -e " [o] ${color1}32${color3}. รีสตาร์ท OpenVPN"
	echo -e " [o] ${color1}33${color3}. รีสตาร์ท PPTPVPN"
	echo -e " [o] ${color1}34${color3}. รีสตาร์ท Webmin"
	echo -e " [o] ${color1}35${color3}. รีสตาร์ท SquidProxy"
fi
	echo  "-----------------------------------------------------------------" 	
	echo -e " [o] ${color1}37${color3}. ตั้งค่าเซิร์ฟเวอร์รีบูตอัตโนมัติ"
	echo -e " [o] ${color1}38${color3}. รีสตาร์ทเซิร์ฟเวอร์"
	echo -e " [o] ${color1}39${color3}. เปลี่ยนรหัสผ่านเซิร์ฟเวอร์"
	echo -e " [o] ${color1}40${color3}. ดูบันทึกการติดตั้ง"
	echo -e " [o] ${color1}41${color3}. อัปเดตเดี๋ยวนี้"
	echo -e ""
	echo  "-------------- CREATED BY OCSPANEL.INFO 0970267262 --------------" 
	echo -e ""
	read -p " [o] โปรดใส่ตัวเลือกของเมนู (ตัวเลข): " x
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
elif test $x -eq 8; then
user-lock
elif test $x -eq 9; then
user-unlock
elif test $x -eq 10; then
user-delete
elif test $x -eq 12; then
user-list
elif test $x -eq 15; then
read -p " [+] กรอกจำนวนเงินเข้าสู่ระบบสูงสุด (1-2): " MULTILOGIN
user-limit $MULTILOGIN
elif test $x -eq 17; then
expireduser
elif test $x -eq 18; then
user-delete-expired
elif test $x -eq 27; then
speedtest --share
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

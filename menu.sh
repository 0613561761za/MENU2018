#!/bin/bash
clear

# get the VPS IP
#ip=`ifconfig venet0:0 | grep 'inet addr' | awk {'print $2'} | sed s/.*://`
MYIP=`ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0' | head -n1`;
#MYIP=$(ifconfig | grep 'inet addr:' | grep -v inet6 | grep -vE '127\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' | cut -d: -f2 | awk '{ print $1}' | head -1)
if [ "$MYIP" = "" ]; then
	MYIP=$(wget -qO- ipv4.icanhazip.com)
fi
#myip=`ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0' | head -n1`;

flag=0

echo

	#MYIP=$(ifconfig | grep 'inet addr:' | grep -v inet6 | grep -vE '127\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' | cut -d: -f2 | awk '{ print $1}' | head -1)
	#if [ "$MYIP" = "" ]; then
		#MYIP=$(wget -qO- ipv4.icanhazip.com)
	#fi
function card() {
	if [[ ! -e /root/sqlmap ]]; then
	echo "Maaf boss sqlmap belum di install, Silahkan install dulu :p" | lolcat
	exit
	fi
	cd
	carding_hack
	}
	clear

	#echo "--------------- Selamat datang di Server - IP: $MYIP ---------------"
	echo ""
	echo ""
	echo ""
	echo ""
	echo ""
	echo ""
	echo ""
	echo ""
	echo ""
	#cname=$( awk -F: '/model name/ {name=$2} END {print name}' /proc/cpuinfo )
	#cores=$( awk -F: '/model name/ {core++} END {print core}' /proc/cpuinfo )
	#freq=$( awk -F: ' /cpu MHz/ {freq=$2} END {print freq}' /proc/cpuinfo )
	#tram=$( free -m | awk 'NR==2 {print $2}' )
	#swap=$( free -m | awk 'NR==4 {print $2}' )
	#up=$(uptime|awk '{ $1=$2=$(NF-6)=$(NF-5)=$(NF-4)=$(NF-3)=$(NF-2)=$(NF-1)=$NF=""; print }')

	#echo -e "\e[032;1mCPU model:\e[0m $cname"
	#echo -e "\e[032;1mNumber of cores:\e[0m $cores"
	#echo -e "\e[032;1mCPU frequency:\e[0m $freq MHz"
	#echo -e "\e[032;1mTotal amount of ram:\e[0m $tram MB"
	#echo -e "\e[032;1mTotal amount of swap:\e[0m $swap MB"
	#echo -e "\e[032;1mSystem uptime:\e[0m $up"
lolcat -F 0.3 -S 0 /usr/bin/bannermenu
echo "                           Server: $MYIP" | lolcat
date +"                           %A, %d-%m-%Y" | lolcat
date +"                                   %H:%M:%S %Z" | lolcat
echo ""
echo ""
PS3='เลือกเมนูที่ต้องการ โดยการพิมพ์ตัวเลขแล้ว ENTER: '
options=("สร้างบัญชี SSH & OpenVPN" "สร้างบัญชีทดลอง SSH & OpenVPN" "เพิ่มเวลาที่ใช้งานของบัญชี SSH & OpenVPN" "เปลี่ยนรหัสผ่านบัญชี SSH/OpenVPN" "ลบบัญชี SSH & OpenVPN" "แสดงรายชื่อบัญชีทั้งหมด SSH & OpenVPN" "ลบผู้ใช้ SSH & OpenVPN ที่หมดอายุแล้ว" "ล็อกผู้ใช้ SSH & OpenVPN ที่หมดอายุแล้ว" "เปลี่ยน Port Dropbear" "เปลี่ยน Port OpenVpn" "เปลี่ยน Port OpenSSH" "เปลี่ยน Port Squid Proxy" "Restart OpenSSH" "Restart Dropbear" "Restart OpenVPN" "Restart PPTP VPN" "Restart Webmin" "Restart Squid Proxy" "ตั้งค่า Auto Reboot Server" "Reboot Server" "เปลี่ยน Password VPS" "แก้ไขข้อความการแสดงเมื่อเชื่อมต่อ SSH" "แก้ไขข้อความการแสดงเมื่อเชื่อมต่อ VPS" "Speedtest" "Benchmark" "ดูการใช้ RAM ของเซิร์ฟเวอร์" "เช็ค Bandwidth ที่ใช้" "ดูรายละเอียดของการติดตั้งระบบ" "อัพเดตสคริป vip" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "สร้างบัญชี SSH & OpenVPN")
	clear
        user-add
        break
            ;;
	"สร้างบัญชีทดลอง SSH & OpenVPN")
	clear
	user-gen
	break
	;;
	"เพิ่มเวลาที่ใช้งานของบัญชี SSH & OpenVPN")
	clear
	user-renew
	break
	;;
	"เปลี่ยนรหัสผ่านบัญชี SSH/OpenVPN")
	clear
	user-pass
	break
	;;
	"ลบบัญชี SSH & OpenVPN")
	clear
	user-list | lolcat
	break
	;;
	"แสดงรายชื่อบัญชีทั้งหมด SSH & OpenVPN")
	clear
	user-del
	break
	;;
	"ลบผู้ใช้ SSH & OpenVPN ที่หมดอายุแล้ว")
	clear
	user-add-pptp
	break
	;;
	"ล็อกผู้ใช้ SSH & OpenVPN ที่หมดอายุแล้ว")
	clear
	dropmon
	break
	;;
	"เปลี่ยน Port Dropbear")
	clear
	user-login
	break
	;;
	"เปลี่ยน Port OpenVpn")
	clear
        read -p "Isikan Maximal User Login (1-2): " MULTILOGIN
        userlimit.sh $MULTILOGIN
	userlimitssh.sh $MULTILOGIN
	break
	;;
	"เปลี่ยน Port OpenSSH")
	clear 
	read -p "Isikan Maximal User Login (1-2): " MULTILOGIN2
	#echo "@reboot root /root/userlimit.sh" > /etc/cron.d/userlimitreboot
	service cron stop
	echo "* * * * * root /usr/bin/userlimit.sh $MULTILOGIN2" > /etc/cron.d/userlimit1
	   echo "* * * * * root sleep 10; /usr/bin/userlimit.sh $MULTILOGIN2" > /etc/cron.d/userlimit2
           echo "* * * * * root sleep 20; /usr/bin/userlimit.sh $MULTILOGIN2" > /etc/cron.d/userlimit3
           echo "* * * * * root sleep 30; /usr/bin/userlimit.sh $MULTILOGIN2" > /etc/cron.d/userlimit4
           echo "* * * * * root sleep 40; /usr/bin/userlimit.sh $MULTILOGIN2" > /etc/cron.d/userlimit5
           echo "* * * * * root sleep 50; /usr/bin/userlimit.sh $MULTILOGIN2" > /etc/cron.d/userlimit6
	   #:echo "@reboot root /root/userlimitssh.sh" >> /etc/cron.d/userlimitreboot
	   echo "* * * * * root /usr/bin/userlimitssh.sh $MULTILOGIN2" >> /etc/cron.d/userlimit1
	   echo "* * * * * root sleep 11; /usr/bin/userlimitssh.sh $MULTILOGIN2" >> /etc/cron.d/userlimit2
           echo "* * * * * root sleep 21; /usr/bin/userlimitssh.sh $MULTILOGIN2" >> /etc/cron.d/userlimit3
           echo "* * * * * root sleep 31; /usr/bin/userlimitssh.sh $MULTILOGIN2" >> /etc/cron.d/userlimit4
           echo "* * * * * root sleep 41; /usr/bin/userlimitssh.sh $MULTILOGIN2" >> /etc/cron.d/userlimit5
           echo "* * * * * root sleep 51; /usr/bin/userlimitssh.sh $MULTILOGIN2" >> /etc/cron.d/userlimit6
	    service cron start
	    service cron restart
	    service ssh restart
	    service dropbear restart
	    echo "------------+ AUTO KILL SUDAH DI AKTIFKAN BOSS +--------------" | lolcat
	    
	echo "Dasar pelit!!! user ente marah2 jangan salahkan ane ya boss¡¡¡
nanti jangan lupa di matikan boss
biar user senang bs multilogin lagi.." | boxes -d boy | lolcat
	break
	;;
	"เปลี่ยน Port Squid Proxy")
	clear
	service cron stop
	rm -rf /etc/cron.d/userlimit1
	rm -rf /etc/cron.d/userlimit2
	rm -rf /etc/cron.d/userlimit3
	rm -rf /etc/cron.d/userlimit4
	rm -rf /etc/cron.d/userlimit5
	rm -rf /etc/cron.d/userlimit6
	#rm -rf /etc/cron.d/userlimitreboot
	service cron start
	service cron restart
	    service ssh restart
	    service dropbear restart
	clear
	echo "AUTO KILL LOGIN,SUDAH SAYA MATIKAN BOS 
User Sudah Bisa Multi Login Lagi!!!" | boxes -d boy | lolcat
	break
	;;
	"Restart OpenSSH")
	clear
	read -p "Silahkan isi password baru untuk VPS anda: " pass	
        echo "root:$pass" | chpasswd
	echo "Ciieeee.. Ciieeeeeee.. Abis Ganti Password VPS Nie Yeeee...!!!"| boxes -d boy | lolcat
	break
	;;
	"Restart Dropbear")
	clear
	echo "---------------------------------------------"
	echo "Sebelum..." | lolcat
	echo "---------------------------------------------"
       free -h
	echo 1 > /proc/sys/vm/drop_caches
	sleep 1
	echo 2 > /proc/sys/vm/drop_caches
	sleep 1
	echo 3 > /proc/sys/vm/drop_caches && swapoff -a && swapon -a
	sleep 1
	echo "---------------------------------------------"
	echo "Sesudah..." | lolcat
	echo "---------------------------------------------"
	free -h
	echo "---------------------------------------------"
	echo "SUKSES..!!!Cache ram anda sudah di bersihkan." | boxes -d boy | lolcat
        echo ""
	break
	;;
	"Restart OpenVPN")
	clear
	user-active-list | boxes -d dog | lolcat
	break
	;;
	"Restart PPTP VPN")
	clear
	user-expire-list | lolcat
	break
	;;
	"Restart Webmin")
	clear
	disable-user-expire
	break
	;;
	"Restart Squid Proxy")
	clear
	delete-user-expire
	break
	;;
	"ตั้งค่า Auto Reboot Server")
	clear
	banned-user
	break
	;;
	"Reboot Server")
	clear
	unbanned-user
	break
	;;
	"เปลี่ยน Password VPS")
	clear
	ps-mem | boxes -d dog | lolcat
	break
	;;
	"แก้ไขข้อความการแสดงเมื่อเชื่อมต่อ SSH")
	clear
	echo "SPEEDTEST SERVER" | boxes -d peek | lolcat
	echo "-----------------------------------------"
	speedtest --share | lolcat
	echo "-----------------------------------------"
	break
	;;
	"แก้ไขข้อความการแสดงเมื่อเชื่อมต่อ VPS")
	clear
	echo "BENCHMARK" | boxes -d peek | lolcat
	benchmark | lolcat
	break
	;;
        "Speedtest")
	clear
	echo "-----------------------------------------------------------" | lolcat
	echo -e "1.) Simpan text (CTRL + X, lalu ketik Y dan tekan Enter) " | lolcat
	echo -e "2.) Membatalkan edit text (CTRL + X, lalu ketik N dan tekan Enter)" | lolcat
	echo "-----------------------------------------------------------" | lolcat
	read -p "Tekan ENTER untuk melanjutkan........................ " | lolcat
	nano /bannerssh
	service dropbear restart && service ssh restart
	break
	;;
	"Benchmark")
	clear
	echo "--------------------------------------------------------" | lolcat
	echo -e "1. Simpan text (CTRL + X, lalu ketik Y dan tekan ENTER)" | lolcat
	echo -e "2. Membatalkan edit text (CTRL + X,lalu ketik N dan tekan ENTER)" | lolcat
	echo "--------------------------------------------------------" | lolcat
	read -p "Tekan ENTER untuk melanjutkan..................." | lolcat
	nano /usr/bin/bannermenu
	break
	;;
	"ดูการใช้ RAM ของเซิร์ฟเวอร์")
	clear
	user-login
	echo "Contoh: 112.123.345.126 lalu Enter" | lolcat
        read -p "Ketik Salah Satu Alamat IP User: " userip
        curl ipinfo.io/$userip
	echo "-----------------------------------" | lolcat
        break
	;;
	"เช็ค Bandwidth ที่ใช้")
	clear
	 service webmin restart
	 echo "Webmin sudah di restart boss!!!" | boxes -d boy | lolcat
	 break
	 ;;
	 "ดูรายละเอียดของการติดตั้งระบบ")
	 clear
	 reboot
	 echo "sudah di restart tunggu sebentar ya boss!!!" | boxes -d boy | lolcat
	 break
	 ;;
	 "อัพเดตสคริป vip")
	 clear
	 service dropbear restart
	 echo "Dropbear sudah di restart boss!!!" | boxes -d boy | lolcat
	 break
	;;
	 
        *) echo invalid option;
	esac
done

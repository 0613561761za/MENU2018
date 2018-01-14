#!/bin/bash

if [ $USER != 'root' ]; then
	echo "ขออภัยคุณต้องเรียกการใช้งานนี้เป็น root"
	exit
fi

# initialisasi var
export DEBIAN_FRONTEND=noninteractive
OS=`uname -m`;

if [[ -e /etc/debian_version ]]; then
	#OS=debian
	RCLOCAL='/etc/rc.local'
else
	echo "ดูเหมือนว่า คุณไม่ได้ใช้ตัวติดตั้งนี้ในระบบ Debian"
	exit
fi

#source file
	source="http://103.86.50.109/vip9"


# go to root
cd

MYIP=$(wget -qO- ipv4.icanhazip.com);

# check registered ip
wget -q -O "IP" "$source/IP.txt"
if ! grep -w -q $MYIP IP; then
	echo "ขออภัย IP ของท่านไม่สามารถใช้สคริปต์นี้ได้!"
	echo "ติดต่อ: HERE BIRD LNWSHOP / (097-026-7262)"
	rm -f /root/IP
	exit
fi

#https://github.com/adenvt/OcsPanels/wiki/tutor-debian

clear
echo "--------------------------------- OCS Panels Installer for Debian -------------------------------"

echo "                    DEVELOPED HERE BIRD LNWSHOP / (097-026-7262)                    "
echo ""
echo ""
echo "ยินดีต้อนรับสู่ Osc Panel Auto Script : กรุณายืนยันการตั้งค่าต่าง ๆ ดังนี้"
echo "คุณสามารถใช้ข้อมูลของตัวเองได้เพียงแค่ กดลบ หรือ กด Enter ถ้าคุณเห็นด้วยกับข้อมูลของเรา"
echo ""
echo "1.ตั้งรหัสผ่านใหม่สำหรับ user root MySQL:"
read -p "Password ใหม่: " -e -i lnwseed DatabasePass
echo ""
echo "2.ตั้งค่าชื่อฐานข้อมูลสำหรับ OCS Panels"
echo "โปรดใช้ตัวอัพษรปกติเท่านั้นห้ามมีอักขระพิเศษอื่นๆที่ไม่ใช่ขีดล่าง (_)"
read -p "Name Database: " -e -i OCS_PANEL DatabaseName
echo ""
echo "เอาล่ะนี่คือทั้งหมดที่ระบบ Ocs Script ต้องการ เราพร้อมที่จะติดตั้งแผง OCS ของคุณแล้ว"
read -n1 -r -p "กดปุ่ม Enter เพื่อดำเนินการต่อ ..."
service nginx stop
service php5-fpm stop
service php5-cli stop
apt-get -y --purge remove nginx php5-fpm php5-cli
#apt-get update
apt-get update -y
apt-get install build-essential expect -y

apt-get install -y mysql-server

#mysql_secure_installation
so1=$(expect -c "
spawn mysql_secure_installation; sleep 3
expect \"\";  sleep 3; send \"\r\"
expect \"\";  sleep 3; send \"Y\r\"
expect \"\";  sleep 3; send \"$DatabasePass\r\"
expect \"\";  sleep 3; send \"$DatabasePass\r\"
expect \"\";  sleep 3; send \"Y\r\"
expect \"\";  sleep 3; send \"Y\r\"
expect \"\";  sleep 3; send \"Y\r\"
expect \"\";  sleep 3; send \"Y\r\"
expect eof; ")
echo "$so1"
#\r
#Y
#pass
#pass
#Y
#Y
#Y
#Y

chown -R mysql:mysql /var/lib/mysql/
chmod -R 755 /var/lib/mysql/

apt-get install -y nginx php5 php5-fpm php5-cli php5-mysql php5-mcrypt
rm /etc/nginx/sites-enabled/default
rm /etc/nginx/sites-available/default
mv /etc/nginx/nginx.conf /etc/nginx/nginx.conf.backup
mv /etc/nginx/conf.d/vps.conf /etc/nginx/conf.d/vps.conf.backup
wget -O /etc/nginx/nginx.conf "http://script.hostingtermurah.net/repo/blog/ocspanel-debian7/nginx.conf"
wget -O /etc/nginx/conf.d/vps.conf "http://script.hostingtermurah.net/repo/blog/ocspanel-debian7/vps.conf"
sed -i 's/cgi.fix_pathinfo=1/cgi.fix_pathinfo=0/g' /etc/php5/fpm/php.ini
sed -i 's/listen = \/var\/run\/php5-fpm.sock/listen = 127.0.0.1:9000/g' /etc/php5/fpm/pool.d/www.conf

useradd -m vps
mkdir -p /home/vps/public_html
rm /home/vps/public_html/index.html
echo "<?php phpinfo() ?>" > /home/vps/public_html/info.php
chown -R www-data:www-data /home/vps/public_html
chmod -R g+rw /home/vps/public_html
service php5-fpm restart
service nginx restart

apt-get install git
cd /home/vps/public_html
git init
git remote add origin https://github.com/muluu/OCSPanel.git
git pull origin master

chmod 777 /home/vps/public_html/config
chmod 777 /home/vps/public_html/config/config.ini
chmod 777 /home/vps/public_html/config/route.ini

#mysql -u root -p
so2=$(expect -c "
spawn mysql -u root -p; sleep 3
expect \"\";  sleep 3; send \"$DatabasePass\r\"
expect \"\";  sleep 3; send \"CREATE DATABASE IF NOT EXISTS $DatabaseName;EXIT;\r\"
expect eof; ")
echo "$so2"
#pass
#CREATE DATABASE IF NOT EXISTS OCS_PANEL;EXIT;

chmod 777 /home/vps/public_html/config
chmod 777 /home/vps/public_html/config/config.ini
chmod 777 /home/vps/public_html/config/route.ini

clear
echo ""
echo "-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_"
echo ""
echo "เปิดเบราว์เซอร์และเข้าถึงที่อยู่ http://$MYIP:85/ และกรอกข้อมูล 2 ด้านล่าง!"
echo "Database:"
echo "- Database Host: localhost"
echo "- Database Name: $DatabaseName"
echo "- Database User: root"
echo "- Database Pass: $DatabasePass"
echo ""
echo "Admin Login:"
echo "- Username: admin"
echo "- Password New: admin"
echo "- Confirm Password New: admin"
echo ""
echo "คลิกติดตั้งและรอให้กระบวนการเสร็จสิ้นจากนั้นปิด Browser และกลับมาที่นี่ (Putty) แล้วกด [ENTER]!"

sleep 3
echo ""
read -p "หากขั้นตอนข้างต้นเสร็จสิ้นโปรดกดปุ่ม [Enter] เพื่อดำเนินการต่อ ..."
echo ""
read -p "หากคุณเชื่อว่าขั้นตอนข้างต้นได้ทำเสร็จแล้วโปรดกดปุ่ม [Enter] เพื่อดำเนินการต่อ ..."
echo ""


apt-get -y --force-yes -f install libxml-parser-perl

rm -R /home/vps/public_html/installation

cd
rm -f /root/.bash_history && history -c
echo "unset HISTFILE" >> /etc/profile

# info
clear
echo "=======================================================" | tee -a log-install.txt
echo "กรุณาเข้าสู่ระบบ OCS Panel ที่ http://$MYIP:81/" | tee -a log-install.txt

#echo "" | tee -a log-install.txt
#echo "บันทึกการติดตั้ง --> /root/log-install.txt" | tee -a log-install.txt
echo "" | tee -a log-install.txt
echo "โปรดรีบูต VPS ของคุณ!" | tee -a log-install.txt
echo "=======================================================" | tee -a log-install.txt
cd ~/

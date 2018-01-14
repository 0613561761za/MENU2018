#!/bin/bash
myip=`ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0' | head -n1`;
myint=`ifconfig | grep -B1 "inet addr:$myip" | head -n1 | awk '{print $1}'`;
curl -s -o ip.txt http://leedzung-autoscript.net/register/ip.txt
find=`grep $myip ip.txt`
if [ "$find" = "" ]
then
clear
echo ""
echo "     

                   WE ARE SORRY YOUR IP NOT REGISTER YET    
               =============== OS-32 & 64-bit ================
               ♦                                             ♦
               ♦       AUTOSCRIPT CREATED BY LEE DZUNG       ♦
               ♦       -----------About Us------------       ♦ 
               ♦            Tel : +60146463183               ♦
               ♦         { Sms/whatsapp/telegram }           ♦ 
               ♦       http://leedzung-autoscript.net        ♦    
               ♦ http://www.facebook.com/leedzung.autoscript ♦
               ♦                                             ♦
               =============== OS-32 & 64-bit ================
               
                 Please make payment before use auto script
                 ..........................................
                 .           Price: RM20 = 1IP            .
                 .          *****************             .
                 .           Maybank Account              .
                 .           =================            .
                 .          No   : 158202230777           .
                 .          Name : LEE XUAN DUNG          .
                 ..........................................   
                          Thank You For Choice Us
"
exit
fi
if [ $USER != 'root' ]; then
	echo "Sorry, for run the script please using root user"
	exit
fi
echo "
AUTOSCRIPT BY LEE DZUNG

PLEASE CANCEL ALL PACKAGE POPUP

TAKE NOTE !!!"
clear
echo "START AUTOSCRIPT"
clear
echo "SET TIMEZONE KUALA LUMPUT GMT +8"
ln -fs /usr/share/zoneinfo/Asia/Kuala_Lumpur /etc/localtime;
clear
echo "
ENABLE IPV4 AND IPV6

COMPLETE 1%
"
echo ipv4 >> /etc/modules
echo ipv6 >> /etc/modules
sysctl -w net.ipv4.ip_forward=1
sed -i 's/#net.ipv4.ip_forward=1/net.ipv4.ip_forward=1/g' /etc/sysctl.conf
sed -i 's/#net.ipv6.conf.all.forwarding=1/net.ipv6.conf.all.forwarding=1/g' /etc/sysctl.conf
sysctl -p
clear
echo "
REMOVE SPAM PACKAGE

echo "========================================"  | tee -a log-install.txt
echo "Service Autoscript Created By Lee Dzung "  | tee -a log-install.txt
echo "----------------------------------------"  | tee -a log-install.txt
echo "Website : http://leedzung-autoscript.net/"  | tee -a log-install.txt
echo "   Contact Number     : +60146463183     "  | tee -a log-install.txt
echo "         Telegram : @LeeDzung            "  | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "Webmin   : http://$myip:10000/"
echo "Squid3   : 8080, 3128"  | tee -a log-install.txt
echo "OpenSSH  : 22, 143"  | tee -a log-install.txt
echo "Dropbear : 109, 110, 443"  | tee -a log-install.txt
echo "Download client at http://$myip:81/client.ovpn"  | tee -a log-install.txt
echo "Timezone : Asia/Kuala_Lumpur"  | tee -a log-install.txt
echo "Fail2Ban : [on]"   | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "----------------------------------------"
echo "------Thank you for choice us--------"
echo "========================================"  | tee -a log-install.txt
echo "      PLEASE REBOOT TAKE EFFECT !"
echo "========================================"  | tee -a log-install.txt
cat /dev/null > ~/.bash_history && history -c
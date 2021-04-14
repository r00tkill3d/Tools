#!/bin/bash

# Password Hash Extraction Tool Written By: Yassin Sabir
# The following tool should be used with hash files decrypted using secretsdump.py

  echo "Hash Extractor By: Yassin Sabir"
if [ -z "$1" ]; then
  echo "[*] Usage :$0 <Hash File> "
  exit 0
fi


read -p " Select HASHES:
  [1] Domain Admins
  [2] Domain Users
  [3] Service Accounts
  [4] Enabled Accounts
  [5] Disabled Accounts :" ot

read -p " Enter Output File Name: " gof

if [ $ot = 1 ]
then
read -p " Enter Domain name E.g domain.local: " cool
  echo "Gathering Domain Admin Hashes"
for i in $(echo $1 )
  do cat $1 | grep $cool | grep '.da\|.admin'

done > $gof

elif [ $ot = 2 ]
then
read -p " Enter Domain name E.g domain.local: " coo
  echo "Gathering Domain Accounts"
for i in $(echo $1)
  do cat $1 | grep $coo
done > $gof

elif [ $ot = 3 ]
then
  echo "Gathering Service Accounts"
for i in $(echo $1)
  do cat $1 | grep '.Service\|.service\|.svc\|.Svc\|.SVC\|.srvc\|.Srvc'
done > $gof 

elif [ $ot = 4 ]
then
  echo "Gathering Enabled Accounts"
for i in $(echo $1)
  do cat $1 | grep "(status=Enabled)"
done > $gof

else [ $ot = 5 ]
  echo "Gathering Disabled Accounts"
for i in $(echo $1)
  do cat $1 | grep "(status=Disabled)"
done > $gof

fi

read -p " Do you want to crack these hashes, via dictionary attack? *Requires JohnTheRipper*:
Y/N:" ob

if [ $ob = N ]
then
  exit 0
fi

read -p " Enter Path of Wordlist File: " gov

if [ $ob = Y -a $ot = 1 ]
then
  echo "Here comes johnnyyyy!"
john --wordlist=$gov $gof --format=NT

elif [ $ob = Y -a $ot = 2 ]
then
  echo "HEREEE COMESS JOHNNYYYYY!!"
john --wordlist=$gov $gof --format=NT

elif [ $ob = Y -a $ot = 3 ]
then
  echo "HEREEE COMESS JOHNNYYYY!!"
john --wordlist=$gov $gof --format=NT

elif [ $ob = Y -a $ot = 4 ]
then
  echo "HEREEE COMESS JOHNNYYYY!!"
john --wordlist=$gov $gof --format=NT

else [ $ob = Y -a $ot = 5 ]
  echo "HEREEE COMESS JOHNNYYYY!!"
john --wordlist=$gov $gof --format=NT



fi

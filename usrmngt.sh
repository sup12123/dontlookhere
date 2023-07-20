#!/bin/bash

read -a users

usersLength=${#users[@]}	

for (( i=0;i<$usersLength;i++))
do
	clear
	echo ${users[${i}]}
	echo Delete ${users[${i}]}? yes or no
	read yn1
	if [ $yn1 == yes ]
	then
		userdel -r ${users[${i}]}
		printTime "${users[${i}]} has been deleted."
	else	
		echo Make ${users[${i}]} administrator? yes or no
		read yn2								
		if [ $yn2 == yes ]
		then
			gpasswd -a ${users[${i}]} sudo
			gpasswd -a ${users[${i}]} adm
			gpasswd -a ${users[${i}]} lpadmin
			gpasswd -a ${users[${i}]} sambashare
			printTime "${users[${i}]} has been made an administrator."
		else
			gpasswd -d ${users[${i}]} sudo
			gpasswd -d ${users[${i}]} adm
			gpasswd -d ${users[${i}]} lpadmin
			gpasswd -d ${users[${i}]} sambashare
			gpasswd -d ${users[${i}]} root
			printTime "${users[${i}]} has been made a standard user."
		fi
		echo -e "ZkJ%Dw2*9KpNr5*pNc" | passwd ${users[${i}]}
			printTime "${users[${i}]} has been given the password 'ZkJ%Dw2*9KpNr5*pNc'."

#!/bin/bash

user=$(whoami)
if [ $user!="root" ]
then
echo "need root privilege" >&2
exit 1
fi

cat <<+
Choose
A
B
+

read -p "Enter choice" choice

while true; do

choice=$(echo "$choice" | tr 'a-z' 'A-Z')

if [ $choice = "A" ]
then 
read -p "Enter username" user
if [ grep "$user" /etc/passwd ]
then
echo "$user is on system" > sysinfo-output.txt
else
echo "$user does not exist" >> sysinfo-output.txt
exit 1
fi

elif [ $choice="B" ]
then
read -p "Enter service" service
echo "Checking" >> sysinfo-output.txt
systemctl status $service >> sysinfo-output.txt >&"
fi

else
echo "invalid" >> sysinfo-output.txt
read -p "Please enter A or B" choice

fi
done 

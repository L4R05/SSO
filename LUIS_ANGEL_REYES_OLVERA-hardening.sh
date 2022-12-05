#!/bin/bash

os=$(grep "^ID=" /etc/os-release | awk '{print $2}' FS='=' | tr -d '"');


if [ $os == "ubuntu" ]; then
	wget https://www.clamav.net/downloads/production/clamav-1.0.0.linux.x86_64.deb -o av.deb
	dpkg --install clamav-1.0.0.linux.x86_64.deb
	sudo apt-get update
	sudo apt-get upgrade
elif [ $os == "centos" ]; then
	rpm install yum
	yum install wget -y
	wget https://www.clamav.net/downloads/production/clamav-1.0.0.linux.x86_64.rpm -o av.rpm
	rpm -i clamav-1.0.0.linux.x86_64.rpm
	yum install epel-release -y
else
	echo "Sistema operativo no valido."
fi

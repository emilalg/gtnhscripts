#!/bin/bash

sudo apt -y install openjdk-21-jdk
sudo apt -y install unzip

wget -O gtnh.zip http://downloads.gtnewhorizons.com/ServerPacks/GT_New_Horizons_2.6.0_Server_Java_17-21.zip

mkdir gtnh
unzip gtnh.zip -d gtnh
rm gtnh.zip

sed -i 's/eula=false/eula=true/' gtnh/eula.txt
sed -i 's/server-port=25565/server-port=25555/' gtnh/server.properties
cat whitelist.json > gtnh/whitelist.json

# installed by default iguess
# wget -O gtnh/mods/ServerUtilities.jar https://github.com/GTNewHorizons/ServerUtilities/releases/download/2.0.35/ServerUtilities-2.0.35.jar

sudo firewall-cmd --permanent --zone=public --add-port=25555/tcp
sudo firewall-cmd --permanent --zone=public --add-port=25555/udp
sudo firewall-cmd --reload



chmod +x serve.sh
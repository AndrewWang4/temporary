#!/bin/bash
set -e
sudo apt update
sudo apt install -y wget bash unzip apt-transport-https ca-certificates gnupg lsb-release software-properties-common
wget -qO - https://packages.adoptium.net/artifactory/api/gpg/key/public | sudo gpg --dearmor -o /usr/share/keyrings/adoptium.gpg
UBUNTU_CODENAME=$(lsb_release -cs)
echo "deb [signed-by=/usr/share/keyrings/adoptium.gpg] https://packages.adoptium.net/artifactory/deb $UBUNTU_CODENAME main" | sudo tee /etc/apt/sources.list.d/adoptium.list
sudo apt update
sudo apt install -y temurin-8-jdk
echo -n "Java version: "; java -version
echo -n "Javac version: "; javac -version
echo -n "Wget version: "; wget --version | head -n 1
echo -n "Unzip version: "; unzip -v | head -n 1

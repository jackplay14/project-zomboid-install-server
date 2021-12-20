#!/bin/bash

#####################################################
# Project Zomboid Server
# Using LGSM
# Based on DEBIAN/UBUNTU
#####################################################

#####################################################
# System update/install
apt-get update && apt-get upgrade -y

# Install some stuff
apt-get -y install curl wget file tar bzip2 gzip unzip bsdmainutils python util-linux ca-certificates binutils bc jq tmux netcat nano cpio lib32gcc-s1 lib32stdc++6 openjdk-17-jre python3 rng-tools

# Require by SteamCMD
dpkg --add-architecture i386
apt-get update && apt-get upgrade -y
apt-get install -y libsdl2-2.0-0:i386 steamcmd

# Create user 'pzserver'
useradd -m pzserver
su pzserver
cd /home/pzserver

# Get LGSM
wget -O linuxgsm.sh https://linuxgsm.sh && chmod +x linuxgsm.sh && bash linuxgsm.sh pzserver
./pzserver auto-install

# Setting branch
echo "branch=\"b41multiplayer\"" >> lgsm/config-lgsm/pzserver/pzserver.cfg

./pzserver update

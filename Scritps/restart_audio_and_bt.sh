#!/usr/bin/env bash

# Restart BT
pgrep bluetooth | xargs sudo kill
sudo launchctl list | grep -i blue | awk '{ print $3 }' | xargs sudo launchctl stop
sudo launchctl list | grep -i blue | awk '{ print $3 }' | xargs sudo launchctl start
echo Bluetooth daemon/launchctl has been restarted.

#  Restart Audio
#pgrep audio | xargs sudo kill
#sudo launchctl list | grep -i audio | awk '{ print $3 }' | xargs sudo launchctl stop
#sudo launchctl list | grep -i audio | awk '{ print $3 }' | xargs sudo launchctl start

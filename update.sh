#!/bin/bash

export DEBIAN_FRONTEND=noninteractive
GREEN="\033[1;32m"
NOCOLOR="\033[0m"

#____________________CONFIGURE_SCRIPT_____________

#log file path
LOGPATH="/scripts/logs"

#exclude package
EXCLUDE=""

#set true or false
REBOOT="false"

#____________________DOING_UPGRADE________________

exec > $LOGPATH/log_update_script.log 2>&1
echo -e
echo -e "${GREEN}Current date: ${NOCOLOR}"
echo -e $(date)
echo -e
echo -e "${GREEN}exclude packages defined in script, to include again -> apt-mark unhold "$EXCLUDE"${NOCOLOR}"
apt-mark hold $EXCLUDE
echo -e
echo -e "${GREEN}packages on hold:${NOCOLOR}"
dpkg --get-selections | grep "hold"
echo -e
echo -e "${GREEN}update apt cache from sources lists${NOCOLOR}"
apt-get update
echo -e
echo -e "${GREEN}upgrade packages${NOCOLOR}"
apt-get upgrade -y
echo -e
echo -e "${GREEN}upgrade distribution packages${NOCOLOR}"
apt-get dist-upgrade -y
echo -e
echo -e "${GREEN}remove unusuded packages${NOCOLOR}"
apt autoremove -y
echo -e
echo -e "${GREEN}clean apt cache${NOCOLOR}"
apt clean
echo -e
 if $REBOOT eq true

   then

   echo -e "${GREEN}reboot${NOCOLOR}"
   shutdown -r

 fi
echo -e
cat $LOG | echo -e


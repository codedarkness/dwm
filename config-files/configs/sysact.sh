#!/bin/bash
#  ____             _                         ____          _
# |  _ \  __ _ _ __| | ___ __   ___  ___ ___ / ___|___   __| | ___
# | | | |/ _' | '__| |/ / '_ \ / _ \/ __/ __| |   / _ \ / _' |/ _ \
# | |_| | (_| | |  |   <| | | |  __/\__ \__ \ |__| (_) | (_| |  __/
# |____/ \__,_|_|  |_|\_\_| |_|\___||___/___/\____\___/ \__,_|\___|
# -----------------------------------------------------------------
# https://darkncesscode.xyz
# https://github.com/codedarkness
# -----------------------------------------------------------------
#
#        FILE: sysact.sh
#       USAGE: ./sysact.sh | demenu for windows manager system
#
#
# DESCRIPTION: lock, restart, hibernate and shutdown your computer
#
#      AUTHOR: DarknessCode
#       EMAIL: achim@darknesscode.xyz
#
#     CREATED: 05-25-2020 6:10
#
# -----------------------------------------------------------------

font="-fn 'Noto-11'"

declare options=("Cancel
Lock-Screen
Exit
Shutdown
Reboot
Suspend")

choice=$(
	echo -e "${options[@]}" |
	dmenu -i -p 'Select an Option: ' $font
)

case "$choice" in
	Cancel)	exit 1 ;;
	Lock-Screen)	blurlock ;;
	Exit)		kill -TERM $(pidof -s dwm) ;;
	Shutdown)	systemctl poweroff ;;
	Reboot)		systemctl reboot ;;
	Suspend)	systemctl suspend ;;
	*) exit 1 ;;
esac

"$choice"

#!/bin/bash
#  ____             _                         ____          _
# |  _ \  __ _ _ __| | ___ __   ___  ___ ___ / ___|___   __| | ___
# | | | |/ _' | '__| |/ / '_ \ / _ \/ __/ __| |   / _ \ / _' |/ _ \
# | |_| | (_| | |  |   <| | | |  __/\__ \__ \ |__| (_) | (_| |  __/
# |____/ \__,_|_|  |_|\_\_| |_|\___||___/___/\____\___/ \__,_|\___|
# -----------------------------------------------------------------
# https://darkncesscode.com
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
#       EMAIL: admin@darknesscode.com
#
#     CREATED: 05-25-2020 6:10
#
# -----------------------------------------------------------------

# For non-systemd init systems.
case "$(readlink -f /sbin/init)" in
	*runit*) hib="sudo -A zzz" ;;
	*openrc*) reb="sudo -A openrc-shutdown -r"; shut="sudo -A openrc-shutdown -p" ;;
esac

cmds="\
 lock		blurlock
 exit		kill -TERM $(pidof -s dwm)
 hibernate	${hib:-sudo -A systemctl suspend-then-hibernate}
 reboot		${reb:-sudo -A reboot}
 shutdown	${shut:-sudo -A shutdown -h now}"

choice="$(echo "$cmds" | cut -d'	' -f 1 | dmenu -b -i -fn 'Noto-12' -nb '#000000' -nf '#566573' -sf '#FAF9FA' -sb '#000000')" || exit 1

`echo "$cmds" | grep "^$choice	" | cut -d '	' -f2-`

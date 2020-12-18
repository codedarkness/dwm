#!/bin/bash
#  ____             _                         ____          _
# |  _ \  __ _ _ __| | ___ __   ___  ___ ___ / ___|___   __| | ___
# | | | |/ _` | '__| |/ / '_ \ / _ \/ __/ __| |   / _ \ / _` |/ _ \
# | |_| | (_| | |  |   <| | | |  __/\__ \__ \ |__| (_) | (_| |  __/
# |____/ \__,_|_|  |_|\_\_| |_|\___||___/___/\____\___/ \__,_|\___|
# -----------------------------------------------------------------
# https://darkncesscode.com
# https://github.com/codedarkness
# -----------------------------------------------------------------
#
#        FILE: dmenu-programs.sh
#       USAGE: ./dmenu-programs.sh / dmenu_run
#
# DESCRIPTION: Launcher most used gui and terminal programs
#
#      AUTHOR: DarknessCode
#       EMAIL: admin@darknesscode.com
#
#     CREATED: 03-27-2020 11:51
#
# -----------------------------------------------------------------

font="-fn Noto-10"

terminal="urxvt"

declare options=("AppFinder
Gimp
LibreOffice
Sigil
Calibre
FileManager
Htop
Mutt
PyRadio
Ranger
Telegram
Vim")

choice=$(
	echo -e "${options[@]}" |
	dmenu -i -p ' Open Program : ' $font
)

case "$choice" in
	quit)        echo "Program terminated." && exit 1 ;;
	AppFinder)	 choice=xfce4-appfinder ;;
	Gimp)        choice=gimp ;;
	LibreOffice) choice=libreoffice ;;
	Sigil) 		 choice=sigil ;;
	Calibre)	 choice=calibre ;;
	FileManager) choice=pcmanfm ;;
	Htop)        exec $terminal -e htop ;;
	Mutt)	     exec $terminal -e mutt ;;
	PyRadio)     exec $terminal -e pyradio ;;
	Ranger)	     exec $terminal -e ranger ;;
	Telegram)    exec $terminal -e tg ;;
	Vim)         exec $terminal -e vim ;;
	*) exit 1 ;;
esac

"$choice"


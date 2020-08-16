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

font="-fn Noto-12"
nb="-nb #222D31"
sb="-sb #222D31"
sf="-sf #FAF9FA"
nf="-nf #4D5656"

declare options=("Brave
Calcurse
Filezilla
Gimp
Htop
LibreOffice
Mutt
PyRadio
Ranger
Teamviewer
Telegram
Vim")

choice=$(
	echo -e "${options[@]}" |
	dmenu -i -p 'Open Program: ' $font $nb $sb $sf $nf
)

case "$choice" in
	quit)        echo "Program terminated." && exit 1 ;;
	Brave)       choice=brave ;;
	Calcurse)    exec terminal -e calcurse ;;
	Filezilla)   choice=filezilla ;;
	Gimp)        choice=gimp ;;
	Htop)        exec terminal -e htop ;;
	LibreOffice) choice=libreoffice ;;
	Mutt)	     exec terminal -e mutt ;;
	PyRadio)     exec terminal -e pyradio ;;
	Ranger)	     exec terminal -e ranger ;;
	Teamviewer)  choice=teamviewer ;;
	Telegram)    choice=telegram-desktop ;;
	Vim)         exec terminal -e vim ;;
	*) exit 1 ;;
esac

"$choice"


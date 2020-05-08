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
#        FILE: dwm-slstatus-install.sh
#       USAGE: ./dwm-slstatus-install.sh
#
# DESCRIPTION: install dwm, slstatus  and copy custom config files
#	       this is a minimal configuration of dwm and slstatus
#
#      AUTHOR: DarknessCode
#       EMAIL: admin@darknesscode.com
#
#     CREATED: 04-15-2020
#
# -----------------------------------------------------------------

dwm() {
	cd dwm;
	pwd;
	sudo make clean install
}

slstatus() {
	cd slstatus;
	pwd;
	sudo make clean install
}

dmenu() {
	cd dmenu;
	pwd;
	sudo make clean install
}

config-files() {
	cp -ar config-files/conky $HOME/.config/ &&
	echo " ##### conky files had been copied";
	cp -ar config-files/autostart.sh $HOME/.dwm/ &&
	echo " #### autostart has been copied"
	sudo cp config-files/dwm.desktop /usr/share/xsessions/dwm.desktop &&
	echo " ### dwm.desktop entry has been copied"
}

themes() {
	config-files/themes/themes.sh
}

keybindings() {
	less config-files/keybindings
}

press_enter() {
	echo ""
	echo -n " Press Enter To Continue"
	read
	clear
}

incorrect_selection() {
	echo " Incorrect selection! try again"
}

until [ "$selection" = "0" ]; do
	clear
	echo ""
	echo " ----------------------------------------------"
	echo " ###        dwm -- slstatus -- dmenu        ###"
	echo " ##     suckless software that suck less     ##"
	echo " ----------------------------------------------"
	echo ""
	echo " 1 - Install dwm"
	echo " 2 - Install slstatus"
	echo " 3 - Install dmemu"
	echo " 4 - Copy (custom) config files"
	echo " 5 - Themes"
	echo " 6 - Keybindings"
	echo " 0 - Exit"
	echo ""
	echo -n " Enter selection [1 - 0] : "
	read selection
	echo ""

	case $selection in
		1) clear; dwm          ; press_enter ;;
		2) clear; slstatus     ; press_enter ;;
		3) clear; dmenu        ; press_enter ;;
		4) clear; config-files ; press_enter ;;
		5) clear; themes      ;;
		6) clear; keybindings ;;
		0) clear; exit ;;
		*) clear; incorrect_selection ; press_enter ;;
	esac
done

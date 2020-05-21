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
	echo ""
	echo " Getting ready to install dwm"
	cd dwm;
	pwd;
	sleep 2;
	sudo make clean install
}

slstatus() {
	echo ""
	echo " Getting ready to install slstatus"
	cd slstatus;
	pwd;
	sleep 2;
	sudo make clean install
}

dmenu() {
	echo ""
	echo " Getting ready to install dmenu"
	cd dmenu;
	pwd;
	sleep 2;
	sudo make clean install
}

config-files() {
	echo ""
	echo " Getting ready config files"
	sleep 2;
	sudo cp config-files/dwm.desktop /usr/share/xsessions/dwm.desktop &&
		echo " ### dwm.desktop entry has been copied"
	cp -ar config-files/conky $HOME/.config/ &&
		echo " ##### conky files had been copied";
	mkdir ~/.dwm &&
		echo " #### .dwm folder created";
	cp -ar config-files/autostart.sh $HOME/.dwm/ &&
		echo " #### autostart has been copied"
}

themes() {
	config-files/themes/themes.sh
}

keybindings() {
	less config-files/keybindings
}

dwm_edit() {
	vim dwm/config.h
}

slstatus_edit() {
	vim slstatus/config.h
}

dmenu_edit() {
	vim dmenu/config.h
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
	echo " DarknessCode"
	echo "      _                     "
	echo "     | |                    "
	echo "   __| |_      ___ __ ___   "
	echo "  / _' \ \ /\ / / '_ ' _ \  "
	echo " | (_| |\ V  V /| | | | | | "
	echo "  \__,_| \_/\_/ |_| |_| |_| "
	echo " --------------------------------"
	echo " ### dwm -- slstatus -- dmenu ###"
	echo " --------------------------------"
	echo ""
	echo " 1 - Install dwm"
	echo " 2 - Install slstatus"
	echo " 3 - Install dmemu"
	echo " 4 - Copy (custom) config files"
	echo " 5 - Themes"
	echo " 6 - Keybindings"
	echo ""
	echo " d - Edit dwm (config.h)"
	echo " s - Edit slstatus (config.h)"
	echo " m - Edit dmenu (config.h)"
	echo " 0 - Exit"
	echo ""
	echo -n " Enter selection [1 - 0] : "
	read selection
	echo ""

	case $selection in
		1) clear; dwm            ; press_enter ;;
		2) clear; slstatus       ; press_enter ;;
		3) clear; dmenu          ; press_enter ;;
		4) clear; config-files   ; press_enter ;;
		5) clear; themes        ;;
		6) clear; keybindings   ;;
		d) clear; dwm_edit      ;;
		s) clear; slstatus_edit ;;
		m) clear; dmenu_edit    ;;
		0) clear; exit ;;
		*) clear; incorrect_selection ; press_enter ;;
	esac
done

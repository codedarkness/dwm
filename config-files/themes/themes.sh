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
#        FILE: themes.sh
#       USAGE: ./themes.sh - sub menu (script) of
#              spectrwm_install.sh
#
# DESCRIPTION: change the color of dwm colors
#
#      AUTHOR: DarknessCode
#       EMAIL: achim@darknesscode.xyz
#
#     CREATED: 04-15-2020
#
# -----------------------------------------------------------------

dark-color() {
	config-files/themes/dwm-dark-color.sh
}

dracula-color() {
	config-files/themes/dwm-dracula-color.sh
}

green-color() {
	config-files/themes/dwm-green-color.sh
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
	echo "      _                     _____      _                 "
	echo "     | |                   / ____|    | |                "
	echo "   __| |_      ___ __ ___ | |     ___ | | ___  _ __ ___  "
	echo "  / _' \ \ /\ / / '_ ' _ \| |    / _ \| |/ _ \| '__/ __| "
	echo " | (_| |\ V  V /| | | | | | |___| (_) | | (_) | |  \__ \ "
	echo "  \__,_| \_/\_/ |_| |_| |_|\_____\___/|_|\___/|_|  |___/ "
	echo ""
	echo " Change the color for dwm"
	echo ""
	echo " 1 - Dark Color Scheme"
	echo " 2 - Dracula Color Scheme"
	echo " 3 - Green Color Scheme"
	echo ""
	echo " 0 - Back"
	echo ""
	echo -n " Enter selection [1 - 0] : "
	read selection
	echo ""

	case $selection in
		1) clear; dark-color	  ; press_enter ;;
		2) clear; dracula-color	  ; press_enter ;;
		3) clear; green-color	  ; press_enter ;;
		0) clear; exit ;;
		*) clear; incorrect_selection ; press_enter ;;
	esac
done

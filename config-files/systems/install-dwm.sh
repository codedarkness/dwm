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
#        FILE: install-dwm.sh
#       USAGE: ./install-dwm.sh | sub menu of dwm-install.sh
#
# DESCRIPTION: install suckless tools: dwm, lstatus, dmenu
#
#      AUTHOR: DarknesCode
#       EMAIL: admin@darknesscode.com
#
#     CREATED: 08-16-20 10:59
#
# -----------------------------------------------------------------

install-dwm(){
	echo ""
	echo " Installing dwm tilign window manager"
	echo ""
	sleep 2

	cd config-files/systems/dwm/
	echo ""

	while true; do
		read -p " Install dwm [y - n] : " yn
		case $yn in
			[Yy]* )
				sudo make clean install
				cd ../../..; break ;;
			[Nn]* )
				break ;;
			* ) echo "Please answer yes or no." ;;
		esac
	done

	echo ""
}

install-dmenu(){
	echo ""
	echo " Installing dmenu"
	echo ""
	sleep 2

	cd config-files/systems/dmenu
	echo ""

	while true; do
		read -p " Install dmenu [y - n] : " yn
		case $yn in
			[Yy]* )
				sudo make clean install
				cd ../../..; break ;;
			[Nn]* )
				break ;;
			* ) echo "Please answer yes or no." ;;
		esac
	done

	echo ""
}

install-slstatus(){
	echo ""
	echo " Installing slstatus, status bar for dwm"
	echo ""
	sleep 2

	while true; do
		read -p " Install xsetroot [y - n] : " yn
		case $yn in
			[Yy]* )
				if ! location="$(type -p "xsetroot")" || [ -z "xsetroot" ]; then

					# check if pacman is installed
					if which pacman > /dev/null; then

						sudo pacman -S --noconfirm xorg-xsetroot

					# check if apt is installed
					elif which apt > /dev/null; then

						sudo apt install -y x11-xserver-utils

					# check if xbps is installed
					elif which xbps-install > /dev/null 2>&1; then

						sudo xbps-install -Sy xsetroot

					else

						echo " Your system is not compatible with this script..."
					fi

					else
						echo " Nothing to do! xsetroot is installed in your System"
				fi ; break ;;
			[Nn]* )
				break ;;
			* ) echo "Please answer yes or no." ;;
		esac
	done

	echo ""
	cd config-files/systems/slstatus
	echo ""

	while true; do
		read -p " Install slstatus [y - n] : " yn
		case $yn in
			[Yy]* )
				sudo make clean install
				cd ../../..; break ;;
			[Nn]* )
				break ;;
			* ) echo "Please answer yes or no." ;;
		esac
	done

	echo ""
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
	echo "                 _    _            _______          _      "
	echo "                | |  | |          |__   __|        | |     "
	echo "  ___ _   _  ___| | _| | ___  ___ ___| | ___   ___ | |___  "
	echo " / __| | | |/ __| |/ / |/ _ \/ __/ __| |/ _ \ / _ \| / __| "
	echo " \__ \ |_| | (__|   <| |  __/\__ \__ \ | (_) | (_) | \__ \ "
	echo " |___/\__,_|\___|_|\_\_|\___||___/___/_|\___/ \___/|_|___/ "
	echo ""
	echo " software that sucks less"
	echo ""
	echo " 1 - dwm"
	echo " 2 - dmenu"
	echo " 3 - slstatus (status bar)"
	echo ""
	echo " 0 - Back"
	echo ""
	echo -n " Enter selection [1 - 0] : "
	read selection
	echo ""

	case $selection in
		1) clear; install-dwm      ; press_enter ;;
		2) clear; install-dmenu    ; press_enter ;;
		3) clear; install-slstatus ; press_enter ;;
		0) clear; exit ;;
		*) clear; incorrect_selection ; press_enter ;;
	esac
done

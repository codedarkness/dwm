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

install-suckless() {
	config-files/systems/install-dwm.sh
}

config-files() {
	echo ""
	echo " Getting ready config files"
	echo ""
	sleep 2

	sudo cp config-files/configs/dwm.desktop /usr/share/xsessions/dwm.desktop &&
	echo " dwm.desktop entry has been copied" || echo " I dunno what happend!!"
	echo ""

	## Conky directory
	### Check for dir, if not found create it using the mkdir ###
	dldir="$HOME/.config/conky"
	[ ! -d "$dldir" ] && mkdir -p "$dldir" &&
	echo " conky directory was created" || echo " conky directory already exist"
	echo ""

	cp -af config-files/configs/conky_live $HOME/.config/conky/ &&
	cp -af config-files/configs/conky_shortcuts_dwm $HOME/.config/conky/ &&
	echo " conky files had been copied" || echo " Upsssss!!!"
	echo ""

	## DWM directory
	### Check for dir, if not found create it using the mkdir ###
	dldir2="$HOME/.dwm"
	[ ! -d "$dldir2" ] && mkdir -p "$dldir2" &&
	echo " dwm directory was created" || echo " dwm directory already exist"
	echo ""

	cp -af config-files/configs/autostart.sh $HOME/.dwm/ &&
	echo " autostart has been copied" || echo " Holly Shhhhhh!!!"
	echo ""

	cp -af config-files/configs/sysact.sh $HOME/.dwm/ &&
	echo " system account files has been copied" || echo " We have a problem again!!!"
	echo ""

	cp -af config-files/configs/dmenu-programs.sh $HOME/.dwm/ &&
	echo " dmenu custom file has been copied" || echo " Not again!!!"
	echo ""

	while true; do
		read -p " Copy Xresources [y - n] : " yn
		case $yn in
			[Yy]* )
				cp -af config-files/configs/Xresources $HOME/.Xresources &&
				echo " New Xresources file has been copied" || echo " Againnnn!!!"
				echo "" ; break ;;
			[Nn]* )
				break ;;
			* ) echo "Please answer yes or no." ;;
		esac
	done
}

themes() {
	config-files/themes/themes.sh
}

keybindings() {
	less config-files/keybindings
}

dwm_edit() {
	echo ""
	echo " Edit dwm config.h and reinstall dwm"
	echo ""
	sleep 2

	while true; do
		read -p " Edit dwm (config.h) [y - n] : " yn
		case $yn in
			[Yy]* )
				vim config-files/systems/dwm/config.h; break ;;
			[Nn]* )
				break ;;
			* ) echo "Please answer yes or no." ;;
		esac
	done
	echo ""

	while true; do
		read -p " Re-install dwm [y - n] : " yn
		case $yn in
			[Yy]* )
				cd config-files/systems/dwm
			        sudo make clean install
				cd ../../.. ; break ;;
			[Nn]* )
				break ;;
			* ) echo "Please answer yes or no." ;;
		esac
	done
	echo ""
}

slstatus_edit() {
	echo ""
	echo " Edit slstatus config.h and reinstall slstatus"
	echo ""
	sleep 2

	while true; do
		read -p " Edit slstatus (config.h) [y - n] : " yn
		case $yn in
			[Yy]* )
				vim config-files/systems/slstatus/config.h; break ;;
			[Nn]* )
				break ;;
			* ) echo "Please answer yes or no." ;;
		esac
	done
	echo ""

	while true; do
		read -p " Re-install slstatus [y - n] : " yn
		case $yn in
			[Yy]* )
				cd config-files/systems/slstatus
			        sudo make clean install
				cd ../../.. ; break ;;
			[Nn]* )
				break ;;
			* ) echo "Please answer yes or no." ;;
		esac
	done
	echo ""
}

dmenu_edit() {
	echo ""
	echo " Edit dmenu config.h and reinstall dmenu"
	echo ""
	sleep 2

	while true; do
		read -p " Edit demnu (config.h) [y - n] : " yn
		case $yn in
			[Yy]* )
				vim config-files/systems/dmenu/config.h; break ;;
			[Nn]* )
				break ;;
			* ) echo "Please answer yes or no." ;;
		esac
	done
	echo ""

	while true; do
		read -p " Re-install dmenu [y - n] : " yn
		case $yn in
			[Yy]* )
				cd config-files/systems/dmenu
				sudo make clean install
			        cd ../../.. ; break ;;
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
	echo "      _                     "
	echo "     | |                    "
	echo "   __| |_      ___ __ ___   "
	echo "  / _' \ \ /\ / / '_ ' _ \  "
	echo " | (_| |\ V  V /| | | | | | "
	echo "  \__,_| \_/\_/ |_| |_| |_| "
	echo ""
	echo " dwm is a dynamic window manager for X"
	echo ""
	echo " 1 - Install"
	echo " 2 - Copy (custom) config files"
	echo " 3 - Themes"
	echo " 4 - Keybindings"
	echo ""
	echo " d - Edit dwm (config.h)"
	echo " s - Edit slstatus (config.h)"
	echo " m - Edit dmenu (config.h)"
	echo ""
	echo " 0 - Exit"
	echo ""
	echo -n " Enter selection [1 - 0] : "
	read selection
	echo ""

	case $selection in
		1) clear; install-suckless ;;
		2) clear; config-files   ; press_enter ;;
		3) clear; themes        ;;
		4) clear; keybindings   ;;
		d) clear; dwm_edit      ;;
		s) clear; slstatus_edit ;;
		m) clear; dmenu_edit    ;;
		0) clear; exit ;;
		*) clear; incorrect_selection ; press_enter ;;
	esac
done

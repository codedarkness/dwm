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
#        FILE: dwm-dark-theme.sh
#       USAGE: ./dwm-dark-theme.sh
#
# DESCRIPTION: change color scheme in dwm config.h file
#	       this script just change the color
#
#      AUTHOR: DarknessCode
#       EMAIL: admin@darknesscode.com
#
#     CREATED: 04-26-2020 12:39
#
# -----------------------------------------------------------------

## setting up env
clear

echo "Changing color scheme for dwm - Dark"

echo "-------------------------------------------------------------"

## background color
sed -i 's/col_gray1\[\]\s*    =\s* ".*";/col_gray1\[\]\       =\ "#14161B";/g' dwm/config.h &&
	echo "Background color has changed"

## border color unfocused windows
sed -i 's/col_gray2\[\]\s*    =\s* ".*";/col_gray2\[\]\       =\ "#22252C";/g' dwm/config.h &&
	echo "Border color (unfocused) has changed"

## foreground color (font)
sed -i 's/col_gray3\[\]\s*    =\s* ".*";/col_gray3\[\]\       =\ "#808080";/g' dwm/config.h &&
	echo "Foreground color (font) has changed"

## background color
sed -i 's/col_gray4\[\]\s*    =\s* ".*";/col_gray4\[\]\       =\ "#d7d7d7";/g' dwm/config.h &&
	echo "Background color has changed"

## border color focused windows and tags
sed -i 's/col_cyan\[\]\s*     =\s* ".*";/col_cyan\[\]\        =\ "#C0C0C0";/g' dwm/config.h &&
	echo "Boder color (focused/tags) has changed"

echo "------------------------------------------------------------"

while true; do
	read -p "Re-install dwm from source [ y - n ] : " yn
	case $yn in
		[Yy]* )
			cd dwm;
			pwd;
			echo "------------------------------------------------------------";
			sudo make clean install;
			exit 0 ;;
		[Nn]* )
			echo "Don't forge to re-install dwm"; exit 0 ;;
		* ) echo "Please answer yes or no." ;;
	esac
done

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

echo " Changing colors for dwm - Dark"
echo ""
sleep 2

## background color
sed -i 's/col_gray1\[\]\s*    =\s* ".*";/col_gray1\[\]\       =\ "#14161B";/g' config-files/systems/dwm/config.h &&
echo " Background color has changed" || echo " Remember we have better days"
echo ""

## border color unfocused windows
sed -i 's/col_gray2\[\]\s*    =\s* ".*";/col_gray2\[\]\       =\ "#22252C";/g' config-files/systems/dwm/config.h &&
echo " Border color (unfocused) has changed" || echo " Shhhhh! you have a real problmen"
echo ""

## foreground color (font)
sed -i 's/col_gray3\[\]\s*    =\s* ".*";/col_gray3\[\]\       =\ "#808080";/g' config-files/systems/dwm/config.h &&
echo " Foreground color (font) has changed" || echo " Did you break the matrix!!!"
echo ""

## background color
sed -i 's/col_gray4\[\]\s*    =\s* ".*";/col_gray4\[\]\       =\ "#14161B";/g' config-files/systems/dwm/config.h &&
echo " Background color has changed" || echo " Try again or format your machine"
echo ""

## foreground color (font tags)
sed -i 's/col_gray5\[\]\s*    =\s* ".*";/col_gray5\[\]\       =\ "#797D7F";/g' config-files/systems/dwm/config.h &&
echo " Window border color has changed" || echo " Not again what's wrong with you!!"
echo ""

## border color focused windows and tags
sed -i 's/col_cyan\[\]\s*     =\s* ".*";/col_cyan\[\]\        =\ "#808080";/g' config-files/systems/dwm/config.h &&
echo " Boder color (focused/tags) has changed" || echo " Uppppssss!!!"
echo ""

## dmenu system account
sed -i 's/nb="-nb #.*"/nb="-nb #14161B"/g' ~/.dwm/sysact.sh &&
sed -i 's/sb="-sb #.*"/sb="-sb #14161B"/g' ~/.dwm/sysact.sh &&
sed -i 's/nf="-nf #.*"/nf="-nf #383A59"/g' ~/.dwm/sysact.sh &&
echo " dmenu colors has canged" || echo " Now what? try agin!"
echo ""

while true; do
	read -p " Do you want to copy Xresources [y - n] : " yn
	case $yn in
		[Yy]* )
			cp -af config-files/themes/xresources/Xresources-dark $HOME/.Xresources &&
			echo " Xresources has been copy" || echo " Upsss! we have a problem here" ; break ;;
		[Nn]* )
			break ;;
		* ) echo " Please answer yes or no." ;;
	esac
done

echo ""

while true; do
	read -p " Re-install dwm [y - n] : " yn
	case $yn in
		[Yy]* )
			cd config-files/systems/dwm
			pwd
			echo ""
			sudo make clean install;
			break ;;
		[Nn]* )
			echo " Don't forge to re-install dwm"; break ;;
		* ) echo " Please answer yes or no." ;;
	esac
done
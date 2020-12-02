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
#        FILE: dwm-green-theme.sh
#       USAGE: ./dwm-green-theme.sh
#
# DESCRIPTION: change color scheme in dwm config.h file
#	       this script just change the colors
#
#      AUTHOR: DarknessCode
#       EMAIL: admin@darknesscode.com
#
#     CREATED: 04-22-2020
#
# -----------------------------------------------------------------

echo " Changing colors for dwm - Green"
echo ""
sleep 2

## background color
sed -i 's/col_gray1\[\]\s*    =\s* ".*";/col_gray1\[\]\       =\ "#222D31";/g' config-files/systems/dwm/config.h &&
echo " Background color has changed" || echo " Remember we have better days"
echo ""

## border color unfocused windows
sed -i 's/col_gray2\[\]\s*    =\s* ".*";/col_gray2\[\]\       =\ "#2F3D44";/g' config-files/systems/dwm/config.h &&
echo " Border color (unfocused) has changed" || echo " Shhhhh! you have a real problmen"
echo ""

## foreground color (font)
sed -i 's/col_gray3\[\]\s*    =\s* ".*";/col_gray3\[\]\       =\ "#D7D7D7";/g' config-files/systems/dwm/config.h &&
echo " Foreground color (font) has changed" || echo " Did you break the matrix!!!"
echo ""

## foreground color (font tags)
sed -i 's/col_gray4\[\]\s*    =\s* ".*";/col_gray4\[\]\       =\ "#C0C5CE";/g' config-files/systems/dwm/config.h &&
echo " Background color has changed" || echo " Try again or format your machine"
echo ""

## foreground color (window border)
sed -i 's/col_gray5\[\]\s*    =\s* ".*";/col_gray5\[\]\       =\ "#0B5345";/g' config-files/systems/dwm/config.h &&
echo " Window border color has changed" || echo " Not again what's wrong with you!!"
echo ""

## border color focused windows and tags
sed -i 's/col_cyan\[\]\s*     =\s* ".*";/col_cyan\[\]\        =\ "#0B5345";/g' config-files/systems/dwm/config.h &&
echo " Boder color (focused/tags) has changed" || echo " Uppppssss!!!"
echo ""

## dmenu
sed -i 's/\[\SchemeNorm\]\ = { ".*", ".*" },/\[\SchemeNorm\]\ = { "#4D5656", "#222D31" },/g' config-files/systems/dmenu/config.h &&
sed -i 's/\[\SchemeSel\]\  = { ".*", ".*" },/\[\SchemeSel\]\  = { "#FAF9FA", "#222D31" },/g' config-files/systems/dmenu/config.h &&
sed -i 's/\[\SchemeOut\]\  = { ".*", ".*" },/\[\SchemeOut\]\  = { "#000000", "#222D31" },/g' config-files/systems/dmenu/config.h &&
echo " dmenus colors applied" || echo " Sorryyy!!!"
echo ""

## change background color dnustrc
sed -i 's/background\ = .*/background\ = \"#222D31"/g' $HOME/.config/dunst/dunstrc &&
echo " dnust color scheme has been applied" || echo " No way!!!!"
echo ""

## change the background colo in nitrogen
sed -i 's/bgcolor=.*/bgcolor=#222D31/g' $HOME/.config/nitrogen/bg-saved.cfg &&
echo " nitrogen background color has been applied" || echo " Maybe is you!!!!"
echo ""

## change background color in slick-greeter lightdm
while true; do
	read -p " You use slick-greeter (Arch Linux, Debian) [y - n] : " yn
	case $yn in
		[Yy]* )
			sudo sed -i 's/background-color=.*/background-color=#222D31/g' /etc/lightdm/slick-greeter.conf &&
			sudo sed -i 's/theme-name=.*/theme-name=Adapta-Nokto-Eta-Maia/g' /etc/lightdm/slick-greeter.conf &&
			sudo sed -i 's/icon-theme-name=.*/icon-theme-name=Adapta-Maia/g' /etc/lightdm/slick-greeter.conf &&
			echo " Slick-Greeter has been changed" || echo " Upsss!!!!"
			echo "" ; break ;;
		[Nn]* )
			break ;;
		* ) echo " Please answer yes or no." ;;
	esac
done
echo ""

## change background color in lightdm-mini-greeter
while true; do
	read -p " You use lightdm-mini-greeter (Void Linux) [y - n] : " yn
	case $yn in
		[Yy]* )
			sudo sed -i 's/text-color = ".*"/text-color = "#C0C5CE"/g' /etc/lightdm/lightdm-mini-greeter.conf &&
			sudo sed -i 's/background-color = ".*"/background-color = "#222D31"/g' /etc/lightdm/lightdm-mini-greeter.conf &&
			sudo sed -i 's/window-color = ".*"/window-color = "#222D31"/g' /etc/lightdm/lightdm-mini-greeter.conf &&
			sudo sed -i 's/border-color = ".*"/border-color = "#0B5345"/g' /etc/lightdm/lightdm-mini-greeter.conf &&
			sudo sed -i 's/password-background-color = ".*"/password-background-color = "#222D31"/g' /etc/lightdm/lightdm-mini-greeter.conf &&
			echo " lightdm-mini-greeter has been changed" || echo " Upsss!!!!"
			echo "" ; break ;;
		[Nn]* )
			break ;;
		* ) echo " Please answer yes or no." ;;
	esac
done
echo ""

while true; do
	read -p " Do you want to copy Xresources [y - n] : " yn
	case $yn in
		[Yy]* )
			cp -af config-files/themes/xresources/Xresources-green $HOME/.Xresources &&
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
			echo ""
			sudo make clean install
			cd ../../..;
			break ;;
		[Nn]* )
			echo " Don't forge to re-install dwm"; break ;;
		* ) echo " Please answer yes or no." ;;
	esac
done

echo ""

while true; do
	read -p " Re-install dmenu [y - n] : " yn
	case $yn in
		[Yy]* )
			cd config-files/systems/dmenu
			echo ""
			sudo make clean install;
			break ;;
		[Nn]* )
			echo " Don't forge to re-install dwm"; break ;;
		* ) echo " Please answer yes or no." ;;
	esac
done

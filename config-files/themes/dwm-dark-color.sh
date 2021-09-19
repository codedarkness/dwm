#!/bin/bash
#  ____             _                         ____          _
# |  _ \  __ _ _ __| | ___ __   ___  ___ ___ / ___|___   __| | ___
# | | | |/ _` | '__| |/ / '_ \ / _ \/ __/ __| |   / _ \ / _` |/ _ \
# | |_| | (_| | |  |   <| | | |  __/\__ \__ \ |__| (_) | (_| |  __/
# |____/ \__,_|_|  |_|\_\_| |_|\___||___/___/\____\___/ \__,_|\___|
# -----------------------------------------------------------------
# https://darkncesscode.xyz
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
#       EMAIL: achim@darknesscode.xyz
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

## foreground color (center info bar)
sed -i 's/col_gray6\[\]\s*    =\s* ".*";/col_gray6\[\]\       =\ "#2B5278";/g' config-files/systems/dwm/config.h &&
echo " Window border color has changed" || echo " Not again what's wrong with you!!"
echo ""

## foreground color (selected tag workspace)
sed -i 's/col_gray7\[\]\s*    =\s* ".*";/col_gray7\[\]\       =\ "#1F618D";/g' config-files/systems/dwm/config.h &&
echo " Window border color has changed" || echo " Not again what's wrong with you!!"
echo ""

## border color focused windows and tags
sed -i 's/col_cyan\[\]\s*     =\s* ".*";/col_cyan\[\]\        =\ "#808080";/g' config-files/systems/dwm/config.h &&
echo " Boder color (focused/tags) has changed" || echo " Uppppssss!!!"
echo ""

## new status bar

while true; do
	read -p " New Status Bar [y - n] : " yn
	case $yn in
		[Yy]* )
sed -i 's/\[SchemeStatus\]\ 	=\ { .*, .*, "#000000" },/\[SchemeStatus\]\ 	=\ { col_gray3, col_gray1, "#000000" },/g' config-files/systems/dwm/config.h &&
sed -i 's/\[SchemeTagsSel\]\ 	=\ { .*, .*, "#000000" },/\[SchemeTagsSel\]\ 	=\ { col_gray7, col_gray1, "#000000" },/g' config-files/systems/dwm/config.h &&
sed -i 's/\[SchemeTagsNorm\]\ 	=\ { .*, .*, "#000000" },/\[SchemeTagsNorm\]\ 	=\ { col_gray3, col_gray1, "#000000" },/g' config-files/systems/dwm/config.h &&
sed -i 's/\[SchemeInfoSel\]\  	=\ { .*, .*, "#000000" },/\[SchemeInfoSel\]\  	=\ { col_gray6, col_gray1, "#000000" },/g' config-files/systems/dwm/config.h &&
sed -i 's/\[SchemeInfoNorm\]\ 	=\ { .*, .*, "#000000" },/\[SchemeInfoNorm\]\ 	=\ { col_gray6, col_gray1, "#000000" },/g' config-files/systems/dwm/config.h &&

sed -i 's/{ cpu_perc,		" CPU %s% : "/{ cpu_perc,		"^c#AF6015^CPU %s% : "/g' config-files/systems/slstatus/config.h &&
sed -i 's/{ temp,     	"TEM %s°C : "/{ temp,     	"^c#5DADE2^TEM %s°C : "/g' config-files/systems/slstatus/config.h &&
sed -i 's/{ ram_used, 	"MEM %s : "/{ ram_used, 	"^c#D7BDE2^MEM %s : "/g' config-files/systems/slstatus/config.h &&
sed -i 's/{ disk_free,	"SSD %s : "/{ disk_free,	"^c#7FC6B6^SSD %s : "/g' config-files/systems/slstatus/config.h &&
sed -i 's/{ battery_perc, "BAT %s% : "/{ battery_perc, "^c#E1ACFF^BAT %s% : "/g' config-files/systems/slstatus/config.h &&
sed -i 's/{ run_command, 	"VOL %s%% : "/{ run_command, 	"^c#E59866^VOL %s%% : "/g' config-files/systems/slstatus/config.h &&
sed -i 's/{ datetime, 	"%s"/{ datetime, 	"^c#81A1C1^%s"/g' config-files/systems/slstatus/config.h &&
echo " Ne estaus bar has changed" || echo " The Matirx is broken" ; break ;;
		[Nn]* )
			break ;;
		* ) echo " Please answer yes or no." ;;
	esac
done

echo ""

## classic status bar

while true; do
	read -p " Classic Status bar [y - n] : " yn
	case $yn in
		[Yy]* )
sed -i 's/\[SchemeStatus\]\ 	=\ { .*, .*, "#000000" },/\[SchemeStatus\]\ 	=\ { col_gray3, col_gray1, "#000000" },/g' config-files/systems/dwm/config.h &&
sed -i 's/\[SchemeTagsSel\]\ 	=\ { .*, .*, "#000000" },/\[SchemeTagsSel\]\ 	=\ { col_gray4, col_gray5, "#000000" },/g' config-files/systems/dwm/config.h &&
sed -i 's/\[SchemeTagsNorm\]\ 	=\ { .*, .*, "#000000" },/\[SchemeTagsNorm\]\ 	=\ { col_gray3, col_gray1, "#000000" },/g' config-files/systems/dwm/config.h &&
sed -i 's/\[SchemeInfoSel\]\  	=\ { .*, .*, "#000000" },/\[SchemeInfoSel\]\  	=\ { col_gray4, col_gray5, "#000000" },/g' config-files/systems/dwm/config.h &&
sed -i 's/\[SchemeInfoNorm\]\ 	=\ { .*, .*, "#000000" },/\[SchemeInfoNorm\]\ 	=\ { col_gray4, col_gray5, "#000000" },/g' config-files/systems/dwm/config.h &&

sed -i 's/{ cpu_perc,	"^c#AF6015^CPU %s% : "/{ cpu_perc,		" CPU %s% : "/g' config-files/systems/slstatus/config.h &&
sed -i 's/{ temp,     	"^c#5DADE2^TEM %s°C : "/{ temp,     	"TEM %s°C : "/g' config-files/systems/slstatus/config.h &&
sed -i 's/{ ram_used, 	"^c#D7BDE2^MEM %s : "/{ ram_used, 	"MEM %s : "/g' config-files/systems/slstatus/config.h &&
sed -i 's/{ disk_free,	"^c#7FC6B6^SSD %s : "/{ disk_free,	"SSD %s : "/g' config-files/systems/slstatus/config.h &&
sed -i 's/{ battery_perc, "^c#E1ACFF^BAT %s% : "/{ battery_perc, "BAT %s% : "/g' config-files/systems/slstatus/config.h &&
sed -i 's/{ run_command, 	"^c#E59866^VOL %s%% : "/{ run_command, 	"VOL %s%% : "/g' config-files/systems/slstatus/config.h &&
sed -i 's/{ datetime, 	"^c#81A1C1^%s"/{ datetime, 	"%s"/g' config-files/systems/slstatus/config.h &&
echo " Classic status bar changed" || echo " We have problem" ; break ;;
		[Nn]* )
			break ;;
		* ) echo "Please answer yes or no." ;;
	esac
done

echo ""

## dmenu
sed -i 's/\[\SchemeNorm\]\ = { ".*", ".*" },/\[\SchemeNorm\]\ = { "#383A59", "#14161B" },/g' config-files/systems/dmenu/config.h &&
sed -i 's/\[\SchemeSel\]\  = { ".*", ".*" },/\[\SchemeSel\]\  = { "#FAF9FA", "#14161B" },/g' config-files/systems/dmenu/config.h &&
sed -i 's/\[\SchemeOut\]\  = { ".*", ".*" },/\[\SchemeOut\]\  = { "#000000", "#14161B" },/g' config-files/systems/dmenu/config.h &&
echo " dmenus colors applied" || echo " Sorryyy!!!"
echo ""

## change background color dnustrc
sed -i 's/background\ = .*/background\ = \"#14161B"/g' $HOME/.config/dunst/dunstrc &&
echo " dnust color scheme has been applied" || echo " No way!!!!"
echo ""

## changin the backgroun color for nitrogen
sed -i 's/bgcolor=.*/bgcolor=#14161B/g' $HOME/.config/nitrogen/bg-saved.cfg &&
echo " nitrogen background color has been applied" || echo " Maybe is you!!!!"
echo ""

## change background color in slick-greeter lightdm
while true; do
	read -p " You use slick-greeter (Arch Linux, Debian) [y - n] : " yn
	case $yn in
		[Yy]* )
			sudo sed -i 's/background-color=.*/background-color=#14161B/g' /etc/lightdm/slick-greeter.conf &&
			sudo sed -i 's/theme-name=.*/theme-name=Matcha-dark-azul/g' /etc/lightdm/slick-greeter.conf &&
			sudo sed -i 's/icon-theme-name=.*/icon-theme-name=Adwaita/g' /etc/lightdm/slick-greeter.conf &&
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
			sudo sed -i 's/background-color = ".*"/background-color = "#14161B"/g' /etc/lightdm/lightdm-mini-greeter.conf &&
			sudo sed -i 's/window-color = ".*"/window-color = "#14161B"/g' /etc/lightdm/lightdm-mini-greeter.conf &&
			sudo sed -i 's/border-color = ".*"/border-color = "#808080"/g' /etc/lightdm/lightdm-mini-greeter.conf &&
			sudo sed -i 's/password-background-color = ".*"/password-background-color = "#14161B"/g' /etc/lightdm/lightdm-mini-greeter.conf &&
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
			pwd
			echo ""
			sudo make clean install;
			cd ../../..;
			break ;;
		[Nn]* )
			echo " Don't forge to re-install dwm"; break ;;
		* ) echo " Please answer yes or no." ;;
	esac
done

echo ""

while true; do
	read -p " Re-install slstatus [y - n] : " yn
	case $yn in
		[Yy]* )
			cd config-files/systems/slstatus
			pwd
			echo ""
			sudo make clean install;
			cd ../../..;
			break ;;
		[Nn]* )
			echo " Don't forge to re-install slstatus"; break ;;
		* ) echo " Please answer yes or no." ;;
	esac
done

echo ""
echo " Now logout, then login to apply all the changes"
echo ""

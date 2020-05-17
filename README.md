# dwm - dmenu - slstatus

dwm is a dynamic window manager for x11. It manages windows in tiled, monocle and floating layouts. For more info got to [suckless](https://suckless.org/dwm)

![dwm - darknesscode](https://github.com/codedarkness/dwm-slstatus/blob/master/config-files/dwm-a.png)

## What this does

This script just install a custom build for:

* *dwm*
* *dmenu*
* *slstatus*
* Copy custom files (autostart.sh and conky)
* Color Schemes for dwm (config.h)

Install *xsetrrot* this application can manage the status bar with plain text and bash scripts.

## Patches

Patches added to dwm in this build:

* attachaside - master always in the left
* autostart - programs when log in
* center windows - center windows in toggle mode
* uselesspag - add gaps between windows

![dwm - darknesscode](https://github.com/codedarkness/dwm-slstatus/blob/master/config-files/dwm-b.png)

## Software

Here are the software that always install in my systems:

* Compton
* Ranger file manager
* Nitrogen
* Volumeicon
* nm-applet
* xfce4-power-manager
* pacmac-tray
* xautolock (blurlock)
* ff-theme-util
* fix_xcursor
* bash (can be change)
* conky
* dnust

## Helpfull keybindings for this installation

| Keybinding  | Action               |
| :---------  | :------------------  |
| MOD+Enter   | Open terminal (bash) |
| MOD+r       | Ranger File Manager  |
| MOD+v       | Vim                  |
| MOD+Shift+o | dmenu_recency        |
| MOD+F10     | Lock screen          |
| MOD+F11     | Restart computer     |
| MOD+F12     | Shutdown computer    |
| MOD+Shift+q | Quit                 |

Add your keybinings in config.h

Too lazzy! that's why i use *Manjaro* or *Debian* to install my base system and work from that.

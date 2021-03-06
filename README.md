# dwm - dmenu - slstatus

dwm is a dynamic window manager for x11. It manages windows in tiled, monocle and floating layouts. For more info got to [suckless](https://suckless.org/dwm)

![dwm - darknesscode](https://github.com/codedarkness/dwm-slstatus/blob/master/config-files/dwm-arch-linux.png)

## What this does

This script just install a custom build for:

* *dwm*
* *dmenu*
* *slstatus*
* Copy custom files
* Change color schemes

Install *xsetroot* this application can manage the status bar with plain text and bash scripts.

## dwm Patches

Patches added to dwm in this build:

* attachaside - master always in the left
* autostart - programs when log in
* center windows - center windows in toggle mode
* uselesspag - add gaps between windows
* pertag - have different layout in each tag

![dwm - darknesscode](https://github.com/codedarkness/dwm-slstatus/blob/master/config-files/dwm-void-linux.png)

## dmenu Patches

Patches added to dmenu in this build:

* center - centers dmenu in the middle of the screen
* border - adds a border around the dmenu window
* mouse support - dmenu will have basic mouse support

![dwm - darknesscode](https://github.com/codedarkness/dwm-slstatus/blob/master/config-files/dwm.png)

## Helpfull keybindings for this installation

| Keybinding  | Action                |
| :---------  | :------------------   |
| MOD+Enter   | Open terminal (urxvt) |
| MOD+r       | Ranger File Manager   |
| MOD+v       | Vim                   |
| MOD+Shift+o | dmenu_run             |
| MOD+F12     | Lock screen           |
| MOD+0       | System account        |
| MOD+Shift+q | Quit                  |

Add your keybinings in config.h

**dwm** is my windows manager of choice. I use it in **Arch Linux**, **Debian** and **Void Linux**

![dwm - darknesscode](https://github.com/codedarkness/dwm-slstatus/blob/master/config-files/dwm-debian.png)

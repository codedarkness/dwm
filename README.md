# dwm - dmenu - slstatus

dwm is a dynamic window manager for x11. It manages windows in tiled, monocle and floating layouts. For more info got to [suckless](https://suckless.org/dwm)

![dwm - darknesscode](/config-files/images/dwm-arch-linux.png)

## What this does

This script just install a custom build for:

* *dwm* v6.3
* *dmenu* v5.1
* *slstatus*
* Copy custom files
* Color Schemes for dwm (config.h)

Install *xsetroot* this application can manage the status bar with plain text and bash scripts.

## dwm Patches

Patches added to dwm in this build:

* attachaside - master always in the left
* autostart - programs when log in
* center - center windows in toggle mode
* colorbar - change foreground and background color of every status bar
* restartsig - restart dwm without exit current session
* rotatestack - moves a client form the bottom to the top of the stack
* status2d - allows color in the status bar
* uselessgas - add gaps between windows

![dwm - darknesscode](/config-files/images/dwm-void-linux.png)

## dmenu Patches

Patches added to dmenu in this build:

* center - centers dmenu in the middle of the screen
* border - adds a border around the dmenu window
* mouse support - dmenu will have basic mouse support
* numbers - add text which pisplays the number of matched and total items
* lines below pront - vertical list starts at the same horizontal line that the prompt is drawn
* line height - sets the minimum height of dmenu line

![dwm - darknesscode](/config-files/images/dwm.png)

## Helpfull keybindings for this installation

| Keybinding      | Action                |
| :---------      | :------------------   |
| MOD+Enter       | Open terminal (urxvt) |
| MOD+Shift+Enter | Open terminal (st)    |
| MOD+r           | Ranger File Manager   |
| MOD+v           | Vim                   |
| MOD+Shift+o     | dmenu_run             |
| MOD+0           | System account        |
| MOD+Shift+q     | Quit                  |
| MOD+F11         | NetworkManger dmenu   |
| MOD+F12         | Lock screen           |

Add your keybinings in config.h

**dwm** is my windows manager of choice. I use it in **Arch Linux**, **Debian** and **Void Linux**

![dwm - darknesscode](/config-files/images/dwm-debian.png)

**New Status bar**

![dwm - darknesscode](/config-files/images/new-dwm.png)

### Note

Added [st](https://github.com/LukeSmithxyz/st) From Luke Smith repo.
Added [NetworkManager-dmenu](https://github.com/firecat53/networkmanager-dmenu) From Firecat53 repo.


/*  ____             _                         ____          _
## |  _ \  __ _ _ __| | ___ __   ___  ___ ___ / ___|___   __| | ___
## | | | |/ _' | '__| |/ / '_ \ / _ \/ __/ __| |   / _ \ / _' |/ _ \
## | |_| | (_| | |  |   <| | | |  __/\__ \__ \ |__| (_) | (_| |  __/
## |____/ \__,_|_|  |_|\_\_| |_|\___||___/___/\____\___/ \__,_|\___|
## -----------------------------------------------------------------
## https://darkncesscode.com
## https://github.com/codedarkness
## ---------------------------------------------------------------*/

/* See LICENSE file for copyright and license details. */
/* Default settings; can be overriden by command line. */

static int topbar = 1;                      /* -b  option; if 0, dmenu appears at bottom     */
/* -fn option overrides fonts[0]; default X11 font or font set */
static const char *fonts[] = {
	"monospace:size=11"
};
static const char *prompt      = NULL;      /* -p  option; prompt to the left of input field */
static const char *colors[SchemeLast][2] = {
	/*     fg         bg       */
	[SchemeNorm] = { "#4D5656", "#222D31" },
	[SchemeSel]  = { "#FAF9FA", "#222D31" },
	[SchemeOut]  = { "#000000", "#222D31" },
};
/* -l option; if nonzero, dmenu uses vertical list with given number of lines */
static unsigned int lines      = 0;

/*
 * Characters not considered part of a word while deleting words
 * for example: " /?\"&[]"
 */
static const char worddelimiters[] = " ";

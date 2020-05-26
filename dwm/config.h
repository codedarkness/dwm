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

/* appearance */
static const unsigned int borderpx  = 1;        /* border pixel of windows */
static const unsigned int gappx     = 5;        /* gaps between windows */
static const unsigned int snap      = 32;       /* snap pixel */
static const int showbar            = 1;        /* 0 means no bar */
static const int topbar             = 1;        /* 0 means bottom bar */
static const char *fonts[]          = { "monospace:size=11" };
static const char dmenufont[]       = "monospace:size=11";
static const char col_gray1[]       = "#14161B"; /* backgroun color */
static const char col_gray2[]       = "#22252C";
static const char col_gray3[]       = "#808080";
static const char col_gray4[]       = "#14161B";
static const char col_cyan[]        = "#808080";
static const char *colors[][3]      = {
	/*               fg         bg         border   */
	[SchemeNorm] = { col_gray3, col_gray1, col_gray2 },
	[SchemeSel]  = { col_gray4, col_cyan,  col_cyan  },
};

/* tagging */
static const char *tags[] = { "1", "2", "3", "4", "5", "6", "7", "8", "9" };

static const Rule rules[] = {
	/* xprop(1):
	 *	WM_CLASS(STRING) = instance, class
	 *	WM_NAME(STRING) = title
	 */
	/* class      	  instance    title                tags mask     iscentered   isfloating   monitor */
	{ "Gimp",     	  NULL,       NULL,                0,            0,		  0,           -1 },
	{ "Firefox",  	  NULL,       NULL,                1 << 8,       0,		  0,           -1 },
	{ "URxvt",    	  NULL,       "backup-system",     0,		 1,		  1,	       -1 },
	{ "URxvt",    	  NULL,	      "tremc_url",         0,	         1,		  1,	       -1 },
	{ "URxvt",	  NULL,	      "alsamixer",         0,		 1,		  1,	       -1 },
	{ "Nitrogen",	  NULL,	      NULL,	           0,	         1,               1,           -1 },
	{ "MPlayer",	  NULL,       NULL,                0,            1,               1,           -1 },
	{ "Lxappearance", NULL,	      NULL,                0,		 1,		  1,	       -1 },
};

/* layout(s) */
static const float mfact     = 0.55; /* factor of master area size [0.05..0.95] */
static const int nmaster     = 1;    /* number of clients in master area */
static const int resizehints = 0;    /* 1 means respect size hints in tiled resizals */

static const Layout layouts[] = {
	/* symbol     arrange function */
	{ "[]=",      tile },    /* first entry is default */
	{ "><>",      NULL },    /* no layout function means floating behavior */
	{ "[M]",      monocle },
};

/* key definitions */
#define MODKEY Mod4Mask
#define TAGKEYS(KEY,TAG) \
	{ MODKEY,                       KEY,      view,           {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask,           KEY,      toggleview,     {.ui = 1 << TAG} }, \
	{ MODKEY|ShiftMask,             KEY,      tag,            {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask|ShiftMask, KEY,      toggletag,      {.ui = 1 << TAG} },

/* helper for spawning shell commands in the pre dwm-5.0 fashion */
#define SHCMD(cmd) { .v = (const char*[]){ "/bin/sh", "-c", cmd, NULL } }

/* commands */
static char dmenumon[2] = "0"; /* component of dmenucmd, manipulated in spawn() */
static const char *dmenucmd[] = { "dmenu_recency", "-b" , NULL };
static const char *termcmd[]  = { "terminal", NULL };

/* volume commands */
#include <X11/XF86keysym.h>

static const char *mutevol[]	 = { "amixer", "-q", "set", "Master", "toggle", NULL };
static const char *upvol[]	 = { "amixer", "-q", "set", "Master", "5%+", "unmute", NULL };
static const char *downvol[]	 = { "amixer", "-q", "set", "Master", "5%-", "unmute", NULL };

static Key keys[] = {
	/* modifier                     key        function        argument */
	{ MODKEY,                       XK_Return, spawn,          {.v = termcmd } },
	{ MODKEY,                       XK_b,      togglebar,      {0} },
	{ MODKEY,                       XK_j,      focusstack,     {.i = +1 } },
	{ MODKEY,                       XK_k,      focusstack,     {.i = -1 } },
	{ MODKEY,                       XK_i,      incnmaster,     {.i = +1 } },
	{ MODKEY,			XK_r,      spawn,	   SHCMD("terminal -e ranger") },
	{ MODKEY,                       XK_d,      incnmaster,     {.i = -1 } },
	{ MODKEY,                       XK_h,      setmfact,       {.f = -0.05} },
	{ MODKEY,                       XK_l,      setmfact,       {.f = +0.05} },
	{ MODKEY,                       XK_Tab,    view,           {0} },
	{ MODKEY,                       XK_q,      killclient,     {0} },
	{ MODKEY,                       XK_t,      setlayout,      {.v = &layouts[0]} },
	{ MODKEY,                       XK_f,      setlayout,      {.v = &layouts[1]} },
	{ MODKEY,                       XK_m,      setlayout,      {.v = &layouts[2]} },
	{ MODKEY,			XK_v,	   spawn,	   SHCMD("terminal -e vim") },
	{ MODKEY,                       XK_space,  setlayout,      {0} },
	{ MODKEY|ShiftMask,             XK_space,  togglefloating, {0} },
	{ MODKEY,                       XK_0,      spawn,          SHCMD("./.dwm/sysact.sh") },
	{ MODKEY|ShiftMask,             XK_0,      view,           {.ui = ~0 } },
	{ MODKEY,                       XK_comma,  focusmon,       {.i = -1 } },
	{ MODKEY,                       XK_period, focusmon,       {.i = +1 } },
	{ MODKEY|ShiftMask,             XK_comma,  tagmon,         {.i = -1 } },
	{ MODKEY|ShiftMask,             XK_period, tagmon,         {.i = +1 } },
	{ 0,                            XK_Print,  spawn,          SHCMD("i3-scrot -d") },

	/* open custom scripts dmenu */
	{ MODKEY,                       XK_o,      spawn,          SHCMD("./Documents/scripts/dmenu-programs.sh") },
	{ MODKEY|ControlMask,           XK_o,	   spawn,          SHCMD("terminal -e ./Documents/scripts/tremc_url.sh") },
	{ MODKEY|ShiftMask,             XK_o,      spawn,          {.v = dmenucmd } },

	/* open gui applications */
	{ MODKEY,                       XK_F2,     spawn,          SHCMD("brave") },
	{ MODKEY,                       XK_F3,     spawn,          SHCMD("pcmanfm") },
	{ MODKEY,                       XK_F4,     spawn,          SHCMD("terminal -e vim './Documents/darkwiki/index.wiki'") },
	{ MODKEY,                      XK_F12,     spawn,          SHCMD("blurlock") },

	/* volume keys */
	{ 0,                 XF86XK_AudioMute,     spawn,          {.v = mutevol } },
	{ 0,          XF86XK_AudioLowerVolume,     spawn,          {.v = downvol } },
	{ 0,          XF86XK_AudioRaiseVolume,     spawn,          {.v = upvol } },

	/* change tags (desktop) */
	TAGKEYS(                        XK_1,                      0)
	TAGKEYS(                        XK_2,                      1)
	TAGKEYS(                        XK_3,                      2)
	TAGKEYS(                        XK_4,                      3)
	TAGKEYS(                        XK_5,                      4)
	TAGKEYS(                        XK_6,                      5)
	TAGKEYS(                        XK_7,                      6)
	TAGKEYS(                        XK_8,                      7)
	TAGKEYS(                        XK_9,                      8)
	{ MODKEY|ShiftMask,             XK_q,      quit,           {0} },
};

/* button definitions */
/* click can be ClkTagBar, ClkLtSymbol, ClkStatusText, ClkWinTitle, ClkClientWin, or ClkRootWin */
static Button buttons[] = {
	/* click                event mask      button          function        argument */
	{ ClkLtSymbol,          0,              Button1,        setlayout,      {0} },
	{ ClkLtSymbol,          0,              Button3,        setlayout,      {.v = &layouts[2]} },
	{ ClkWinTitle,          0,              Button2,        zoom,           {0} },
	{ ClkStatusText,        0,              Button2,        spawn,          {.v = termcmd } },
	{ ClkClientWin,         MODKEY,         Button1,        movemouse,      {0} },
	{ ClkClientWin,         MODKEY,         Button2,        togglefloating, {0} },
	{ ClkClientWin,         MODKEY,         Button3,        resizemouse,    {0} },
	{ ClkTagBar,            0,              Button1,        view,           {0} },
	{ ClkTagBar,            0,              Button3,        toggleview,     {0} },
	{ ClkTagBar,            MODKEY,         Button1,        tag,            {0} },
	{ ClkTagBar,            MODKEY,         Button3,        toggletag,      {0} },
};


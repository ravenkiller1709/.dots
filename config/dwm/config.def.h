/* See LICENSE file for copyright and license details. */

#include <X11/XF86keysym.h>

/* appearance */
static const unsigned int borderpx  = 1;        /* border pixel of windows */
static const unsigned int snap      = 32;       /* snap pixel */
static const unsigned int gappih    = 10;       /* horiz inner gap between windows */
static const unsigned int gappiv    = 10;       /* vert inner gap between windows */
static const unsigned int gappoh    = 10;       /* horiz outer gap between windows and screen edge */
static const unsigned int gappov    = 10;       /* vert outer gap between windows and screen edge */
static const int smartgaps          = 0;        /* 1 means no outer gap when there is only one window */
static const int showbar            = 1;        /* 0 means no bar */
static const int topbar             = 1;        /* 0 means bottom bar */
static const unsigned int colorfultitle  = 1;  /* 0 means title use SchemeTitle and SchemeTitleFloat */
static const unsigned int colorfultag    = 1;  /* 0 means use SchemeSel for selected tag */
static const int user_bh            = 2;        /* 2 is the default spacing around the bar's font */
static const int horizpadbar        = 2;        /* horizontal padding for statusbar */
static const int vertpadbar         = 5;        /* vertical padding for statusbar */
static const int vertpad            = 10;       /* vertical padding of bar */
static const int sidepad            = 10;       /* horizontal padding of bar */
static const char *fonts[]          = { "MesloLGS Nerd Font:size=13",  "Material Design Icons Desktop:size=13" };
static const char dmenufont[]       = "monospace:size=13";
static const char col_gray1[]       = "#1d1f21";
static const char col_gray2[]       = "#444444";
static const char col_gray3[]       = "#bbbbbb";
static const char col_gray4[]       = "#eeeeee";
static const char col_cyan[]        = "#8abeb7";
static const char col_br_black[]    = "#1d1f21";
static const char col_fg[]          = "#c5c8c6";
static const char col_br_yellow[]   = "#f0c674";
static const char col_br_blue[]     = "#81a2be";
static const char col_br_magenta[]  = "#b294bb";
static const char col_br_cyan[]     = "#8abeb7";
static const char col_br_green[]    = "#7EC7A2";
static const char col_yellow[]      = "#de935f";
static const char col_br_red[]      = "#cc6666";
static const char col_white[]       = "#c5c8c6";
static const char col_red[]         = "#a54242";
static const char col_bg[]          = "#1d1f21";
static const char col_black[]       = "#1E222A";
static const char col_dark[]        = "#373b41";
static const char col_blue[]        = "#5f819d";

static const char *colors[][3]      = {
	/*               fg         bg         border   */
	[SchemeNorm] = { col_gray3, col_gray1, col_gray2 },
	[SchemeSel]  = { col_gray4, col_cyan,  col_cyan  },
	[SchemeTag]        = { col_br_yellow,   col_bg,    col_black },
        [SchemeTag1]       = { col_cyan,        col_dark,  col_black },
	[SchemeTag2]       = { col_br_red,      col_dark,  col_black },
        [SchemeTag3]       = { col_yellow,      col_dark,  col_black },
        [SchemeTag4]       = { col_br_blue,     col_dark,  col_black },
        [SchemeTag5]       = { col_br_magenta,  col_dark,  col_black },
	[SchemeTag6]       = { col_br_cyan,     col_dark,  col_black },
	[SchemeTag7]       = { col_br_green,    col_dark,  col_black },
	[SchemeTag8]       = { col_yellow,      col_dark,  col_black },
	[SchemeTag9]       = { col_br_red,      col_dark,  col_black },
	[SchemeLayout]     = { col_blue,        col_bg,    col_black },
	[SchemeTitle]      = { col_fg,          col_bg,    col_black },
	[SchemeTitleFloat] = { col_br_blue,     col_bg,    col_black },
	[SchemeTitle1]     = { col_fg,          col_bg,    col_black },
	[SchemeTitle2]     = { col_red,         col_bg,    col_black },
        [SchemeTitle3]     = { col_br_yellow,   col_bg,    col_black },
        [SchemeTitle4]     = { col_br_blue,     col_bg,    col_black },
        [SchemeTitle5]     = { col_br_magenta,  col_bg,    col_black },
	[SchemeTitle6]     = { col_br_cyan,     col_bg,    col_black },
	[SchemeTitle7]     = { col_br_green,    col_bg,    col_black },
	[SchemeTitle8]     = { col_yellow,      col_bg,    col_black },
	[SchemeTitle9]     = { col_br_red,      col_bg,    col_black },
        [SchemeFloat]      = { col_fg,          col_bg,    col_blue },
};

/* tagging */
static char *tags[] = {"󰇄", "󰇧", "󰇩", "󰇮", "󰄫", "󰂓", "󰄑", "󰆉", "󰈰"};

static const Rule rules[] = {
	/* xprop(1):
	 *	WM_CLASS(STRING) = instance, class
	 *	WM_NAME(STRING) = title
	 */
	/* class      instance    title       tags mask     isfloating   monitor */
	{ "Gimp",     NULL,       NULL,       0,            1,           -1 },
	{ "Firefox",  NULL,       NULL,       1 << 8,       0,           -1 },
};

static const int tagschemes[] = { SchemeTag1, SchemeTag2, SchemeTag3,
                                  SchemeTag4, SchemeTag5, SchemeTag6,
                                  SchemeTag7, SchemeTag8, SchemeTag9 };
static const int titleschemes[] = { SchemeTitle1, SchemeTitle2, SchemeTitle3,
                                    SchemeTitle4, SchemeTitle5, SchemeTitle6,
                                    SchemeTitle7, SchemeTitle8, SchemeTitle9 };

/* layout(s) */
static const float mfact     = 0.55; /* factor of master area size [0.05..0.95] */
static const int nmaster     = 1;    /* number of clients in master area */
static const int resizehints = 1;    /* 1 means respect size hints in tiled resizals */
static const int lockfullscreen = 1; /* 1 will force focus on the fullscreen window */

static const Layout layouts[] = {
	/* symbol     arrange function */
	{ "[]=",      tile },    /* first entry is default */
	{ "><>",      NULL },    /* no layout function means floating behavior */
	{ "[M]",      monocle },
};

/* key definitions */
#define MODKEY Mod4Mask
#define ALTKEY Mod1Mask
#define TAGKEYS(KEY,TAG) \
	{ MODKEY,                       KEY,      view,           {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask,           KEY,      toggleview,     {.ui = 1 << TAG} }, \
	{ MODKEY|ShiftMask,             KEY,      tag,            {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask|ShiftMask, KEY,      toggletag,      {.ui = 1 << TAG} },

/* helper for spawning shell commands in the pre dwm-5.0 fashion */
#define SHCMD(cmd) { .v = (const char*[]){ "/bin/sh", "-c", cmd, NULL } }

/* commands */
static char dmenumon[2] = "0"; /* component of dmenucmd, manipulated in spawn() */
static const char *dmenucmd[] = { "dmenu_run", "-m", dmenumon, "-fn", dmenufont, "-nb", col_gray1, "-nf", col_gray3, "-sb", col_cyan, "-sf", col_gray4, NULL };
static const char *termcmd[]  = { "st", NULL };
static const char scratchpadname[] = "scratchpad";
static const char *scratchpadcmd[] = { "st", "-t", scratchpadname, "-g", "120x34", NULL };

static const Key keys[] = {
	/* modifier                     key        function        argument */



     // brightness and audio 
        { 0, XF86XK_AudioMute,		spawn,		SHCMD("amixer -q sset Master toggle") },
	{ 0, XF86XK_AudioRaiseVolume,	spawn,		SHCMD("amixer -q sset Master 5%+") },
	{ 0, XF86XK_AudioLowerVolume,	spawn,		SHCMD("amixer -q sset Master 5%-") },
        { 0, XF86XK_MonBrightnessUp,	spawn,		{.v = (const char*[]){"sudo",  "brightnessctl", "set", "+15", NULL } } },
	{ 0, XF86XK_MonBrightnessDown,	spawn,		{.v = (const char*[]){ "sudo", "brightnessctl", "set", "15-", NULL } } },
	{ 0, XF86XK_AudioPrev,		spawn,		{.v = (const char*[]){ "mpc", "prev", NULL } } },
	{ 0, XF86XK_AudioNext,		spawn,		{.v = (const char*[]){ "mpc",  "next", NULL } } },
	{ 0, XF86XK_AudioPause,		spawn,		{.v = (const char*[]){ "mpc", "pause", NULL } } },
	{ 0, XF86XK_AudioPlay,		spawn,		{.v = (const char*[]){ "mpc", "play", NULL } } },
	{ 0, XF86XK_AudioStop,		spawn,		{.v = (const char*[]){ "mpc", "stop", NULL } } },
	{ 0, XF86XK_AudioRewind,	spawn,		{.v = (const char*[]){ "mpc", "seek", "-10", NULL } } },
	{ 0, XF86XK_AudioForward,	spawn,		{.v = (const char*[]){ "mpc", "seek", "+10", NULL } } },
	{ 0, XF86XK_AudioMicMute,	spawn,		SHCMD("pactl set-source-mute @DEFAULT_SOURCE@ toggle") },

	/*	{ MODKEY,                       XK_d,      spawn,          {.v = dmenucmd } },*/
	{ MODKEY,                       XK_d,      spawn,          SHCMD("dmenu_run -c -l 10") },
	{ MODKEY,                       XK_Return, spawn,          {.v = termcmd } },
	{ MODKEY,                       XK_s,      togglescratch,  {.v = scratchpadcmd } },
	{ ALTKEY,                       XK_e,      spawn,          SHCMD("emacsclient -c -a emacs") },
	{ MODKEY|ControlMask,           XK_w,      spawn,          SHCMD("$HOME/.local/bin/setbg ~/.dots/.baggrunde/") },
        { Mod1Mask|ShiftMask,           XK_d,      spawn,          SHCMD("dmenuunicode") },
        { MODKEY|ControlMask,           XK_s,      spawn,          SHCMD("st -e /home/kim/.scripts/buildconf") },
	{ MODKEY|ControlMask,           XK_v,      spawn,          SHCMD("$HOME/.scripts/vpnup")},
        { MODKEY|ShiftMask,             XK_v,      spawn,          SHCMD("$HOME/.scripts/vpndown")},
	{ MODKEY,                       XK_b,      togglebar,      {0} },
	{ MODKEY,                       XK_j,      focusstack,     {.i = +1 } },
	{ MODKEY,                       XK_k,      focusstack,     {.i = -1 } },
	{ MODKEY,                       XK_i,      incnmaster,     {.i = +1 } },
	{ MODKEY,                       XK_p,      incnmaster,     {.i = -1 } },
	{ MODKEY,                       XK_h,      setmfact,       {.f = -0.05} },
	{ MODKEY,                       XK_l,      setmfact,       {.f = +0.05} },
	{ MODKEY|Mod1Mask,              XK_h,      incrgaps,       {.i = +1 } },
	{ MODKEY|Mod1Mask,              XK_l,      incrgaps,       {.i = -1 } },
	{ MODKEY|Mod1Mask|ShiftMask,    XK_h,      incrogaps,      {.i = +1 } },
	{ MODKEY|Mod1Mask|ShiftMask,    XK_l,      incrogaps,      {.i = -1 } },
	{ MODKEY|Mod1Mask|ControlMask,  XK_h,      incrigaps,      {.i = +1 } },
	{ MODKEY|Mod1Mask|ControlMask,  XK_l,      incrigaps,      {.i = -1 } },
	{ MODKEY|Mod1Mask,              XK_0,      togglegaps,     {0} },
	{ MODKEY|Mod1Mask|ShiftMask,    XK_0,      defaultgaps,    {0} },
	{ MODKEY,                       XK_y,      incrihgaps,     {.i = +1 } },
	{ MODKEY,                       XK_o,      incrihgaps,     {.i = -1 } },
	{ MODKEY|ControlMask,           XK_y,      incrivgaps,     {.i = +1 } },
	{ MODKEY|ControlMask,           XK_o,      incrivgaps,     {.i = -1 } },
	{ MODKEY|Mod1Mask,              XK_y,      incrohgaps,     {.i = +1 } },
	{ MODKEY|Mod1Mask,              XK_o,      incrohgaps,     {.i = -1 } },
	{ MODKEY|ShiftMask,             XK_y,      incrovgaps,     {.i = +1 } },
	{ MODKEY|ShiftMask,             XK_o,      incrovgaps,     {.i = -1 } },
	{ MODKEY|ShiftMask,             XK_Return, zoom,           {0} },
	{ MODKEY,                       XK_Tab,    view,           {0} },
	{ MODKEY|ShiftMask,             XK_c,      killclient,     {0} },
	{ MODKEY,                       XK_t,      setlayout,      {.v = &layouts[0]} },
	{ MODKEY,                       XK_f,      setlayout,      {.v = &layouts[1]} },
	{ MODKEY,                       XK_m,      setlayout,      {.v = &layouts[2]} },
	{ MODKEY,                       XK_space,  setlayout,      {0} },
	{ MODKEY|ShiftMask,             XK_space,  togglefloating, {0} },
	{ MODKEY,                       XK_0,      view,           {.ui = ~0 } },
	{ MODKEY|ShiftMask,             XK_0,      tag,            {.ui = ~0 } },
	{ MODKEY,                       XK_comma,  focusmon,       {.i = -1 } },
	{ MODKEY,                       XK_period, focusmon,       {.i = +1 } },
	{ MODKEY|ShiftMask,             XK_comma,  tagmon,         {.i = -1 } },
	{ MODKEY|ShiftMask,             XK_period, tagmon,         {.i = +1 } },
	TAGKEYS(                        XK_1,                      0)
	TAGKEYS(                        XK_2,                      1)
	TAGKEYS(                        XK_3,                      2)
	TAGKEYS(                        XK_4,                      3)
	TAGKEYS(                        XK_5,                      4)
	TAGKEYS(                        XK_6,                      5)
	TAGKEYS(                        XK_7,                      6)
	TAGKEYS(                        XK_8,                      7)
	TAGKEYS(                        XK_9,                      8)
	{ MODKEY,                       XK_BackSpace,     spawn,   SHCMD("/home/kim/.local/bin/sysact")},
	{ MODKEY|ShiftMask,             XK_q,      quit,           {0} },
};

/* button definitions */
/* click can be ClkTagBar, ClkLtSymbol, ClkStatusText, ClkWinTitle, ClkClientWin, or ClkRootWin */
static const Button buttons[] = {
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


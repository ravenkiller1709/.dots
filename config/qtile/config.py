import os
import re
import socket
import subprocess
import psutil
import json

from libqtile import qtile
from typing import List  
from libqtile import bar, layout, widget, hook
from libqtile.config import Click, Drag, Group, Key, Match, Screen, ScratchPad, DropDown, KeyChord
from libqtile.lazy import lazy
from libqtile.utils import guess_terminal
from libqtile.widget import Spacer, Backlight
from libqtile.widget.image import Image
from libqtile.dgroups import simple_key_binder
from pathlib import Path

# import layout objects
from libqtile.layout.columns import Columns
from libqtile.layout.xmonad import MonadTall
from libqtile.layout.stack import Stack
from libqtile.layout.floating import Floating

from qtile_extras import widget
from qtile_extras.widget.decorations import RectDecoration

mod = "mod4"
terminal = guess_terminal()
keys = [
    # A list of available commands that can be bound to keys can be found
    # at https://docs.qtile.org/en/latest/manual/config/lazy.html
    # Switch between windows
    Key([mod], "h", lazy.layout.left(), desc="Move focus to left"),
    Key([mod], "l", lazy.layout.right(), desc="Move focus to right"),
    Key([mod], "j", lazy.layout.down(), desc="Move focus down"),
    Key([mod], "k", lazy.layout.up(), desc="Move focus up"),
    Key([mod], "space", lazy.layout.next(), desc="Move window focus to other window"),
    # Move windows between left/right columns or move up/down in current stack.
    # Moving out of range in Columns layout will create new column.
    Key([mod, "shift"], "h", lazy.layout.shuffle_left(), desc="Move window to the left"),
    Key([mod, "shift"], "l", lazy.layout.shuffle_right(), desc="Move window to the right"),
    Key([mod, "shift"], "j", lazy.layout.shuffle_down(), desc="Move window down"),
    Key([mod, "shift"], "k", lazy.layout.shuffle_up(), desc="Move window up"),
    # Grow windows. If current window is on the edge of screen and direction
    # will be to screen edge - window would shrink.
    Key([mod, "control"], "h", lazy.layout.grow_left(), desc="Grow window to the left"),
    Key([mod, "control"], "l", lazy.layout.grow_right(), desc="Grow window to the right"),
    Key([mod, "control"], "j", lazy.layout.grow_down(), desc="Grow window down"),
    Key([mod, "control"], "k", lazy.layout.grow_up(), desc="Grow window up"),
    Key([mod], "n", lazy.layout.normalize(), desc="Reset all window sizes"),
    # Toggle between split and unsplit sides of stack.
    # Split = all windows displayed
    # Unsplit = 1 window displayed, like Max layout, but still with
    # multiple stack panes
    Key(
        [mod, "shift"],
        "Return",
        lazy.layout.toggle_split(),
        desc="Toggle between split and unsplit sides of stack",
    ),

         # Sound
    Key([], "XF86AudioMute", lazy.spawn("amixer -q set Master toggle")),
    Key([], "XF86AudioLowerVolume", lazy.spawn("amixer -c 0 sset Master 1- unmute")),
    Key([], "XF86AudioRaiseVolume", lazy.spawn("amixer -c 0 sset Master 1+ unmute")),
    Key([mod], "Return", lazy.spawn(terminal), desc="Launch terminal"),
    Key([mod], "w", lazy.spawn('firefox'), desc="Launch browser"),
    Key([mod], "d", lazy.spawn('rofi -modes combi,window -show combi -combi-modes run,drun -show-icons'), desc="Launcher"),
    # Toggle between different layouts as defined below
    Key([mod], "Tab", lazy.next_layout(), desc="Toggle between layouts"),
    Key([mod], "q", lazy.window.kill(), desc="Kill focused window"),
    Key([mod, "control"], "r", lazy.reload_config(), desc="Reload the config"),
    Key([mod, "control"], "q", lazy.shutdown(), desc="Shutdown Qtile"),
    Key([mod], "r", lazy.spawncmd(), desc="Spawn a command using a prompt widget"),
    Key([mod], "x", lazy.spawn('oblogout'), desc="Launch exit menu"),
    # toggle visibiliy of above defined DropDown named "term"

    KeyChord([mod], "e", [
        Key([], "e", lazy.spawn('emacs')),
        Key([], "p", lazy.spawn('emacs --execute "(mu4e)"')),
        Key([], "d", lazy.spawn('emacsclient -c -a "emacs" --eval "(dired nil)"')),
        Key([], "i", lazy.spawn('emacsclient -c -a "emacs" --eval "(erc)"')),
        Key([], "t", lazy.spawn('emacsclient -c -a "emacs" --eval "(vterm/here nil)"')),
        Key([], "s", lazy.spawn('emacsclient -c -a "emacs" --eval "(eshell)"')),
        Key([], "b", lazy.spawn('emacsclient -c -a "emacs" --eval "(ibuffer)"')),
        ]),

    KeyChord([mod], "a", [
        Key([], "s", lazy.spawn('baggrund.sh')),
        Key([], "d", lazy.spawn('baggrund.sh')),
        Key([], "m", lazy.spawn('kitty -e ncmpcpp')),
        Key([], "p", lazy.spawn('kitty -e neomutt')),
        Key([], "k", lazy.spawn('kitty'))
        ])
]


groups = [
    Group('1', label='一', matches=[Match(wm_class='firefox')], layout='max'),
    Group('2', label='二', matches=[Match(wm_class='Alacritty')], layout='tile'),
    Group('3', label='三', matches=[Match(wm_class='Emacs')], layout='max'),
    Group('4', label='四', layout='monadWide'),
    Group('5', label='五', layout='monadtall'),
    Group('6', label='六', layout='monadtall'),
    Group('7', label='七', layout='RatioTile'),
    Group('8', label='八', layout='monadtall'),
    Group('9', label='九', layout='monadtall'),
]

for i in groups:
    keys.extend(
        [
            # mod1 + letter of group = switch to group
            Key(
                [mod],
                i.name,
                lazy.group[i.name].toscreen(),
                desc="Switch to group {}".format(i.name),
            ),
            # mod1 + shift + letter of group = switch to & move focused window to group
            Key(
                [mod, "shift"],
                i.name,
                lazy.window.togroup(i.name, switch_group=True),
                desc="Switch to & move focused window to group {}".format(i.name),
            ),
            # Or, use below if you prefer not to switch to that group.
            # # mod1 + shift + letter of group = move focused window to group
            # Key([mod, "shift"], i.name, lazy.window.togroup(i.name),
            #     desc="move focused window to group {}".format(i.name)),
        ]
    )
# Append scratchpad with dropdowns to groups
groups.append(ScratchPad('scratchpad', [
    DropDown('term', 'kitty', width=0.4, height=0.5, x=0.3, y=0.1
, opacity=1),
    DropDown('mixer', 'pavucontrol', width=0.4,
             height=0.6, x=0.3, y=0.1, opacity=1),
    DropDown('pomo', 'pomotroid', x=0.4, y=0.2, opacity=1),
    DropDown('bitwarden', 'bitwarden-desktop',
             width=0.4, height=0.6, x=0.3, y=0.1, opacity=1),
]))
# extend keys list with keybinding for scratchpad
keys.extend([
    Key(["control"], "1", lazy.group['scratchpad'].dropdown_toggle('term')),
    Key(["control"], "2", lazy.group['scratchpad'].dropdown_toggle('mixer')),
    Key(["control"], "3", lazy.group['scratchpad'].dropdown_toggle('pomo')),
    Key(["control"], "4", lazy.group['scratchpad'].dropdown_toggle('bitwarden')),
])
 
# --------------------------------------------------------
# Pywal Colors
# --------------------------------------------------------

colors = os.path.expanduser('~/.cache/wal/colors.json')
colordict = json.load(open(colors))
ColorZ=(colordict['colors']['color0'])
ColorA=(colordict['colors']['color1'])
ColorB=(colordict['colors']['color2'])
ColorC=(colordict['colors']['color3'])
ColorD=(colordict['colors']['color4'])
ColorE=(colordict['colors']['color5'])
ColorF=(colordict['colors']['color6'])
ColorG=(colordict['colors']['color7'])
ColorH=(colordict['colors']['color8'])
ColorI=(colordict['colors']['color9'])


# --------------------------------------------------------
# Setup Layout Theme
# --------------------------------------------------------

layout_theme = { 
    "border_width": 3,
    "margin": 15,
    "border_focus": "FFFFFF",
    "border_normal": "1d1f21",
    "single_border_width": 3
}

#---------------------------------------------------------
# Layouts
#---------------------------------------------------------

layouts = [
    #layout.Columns(border_focus_stack=["#c5c8c6", "#1d1f21"], border_width=4),
    layout.Max(**layout_theme),
    # Try more layouts by unleashing below layouts.
    #layout.Stack(num_stacks=2),
    layout.Bsp(**layout_theme),
    layout.Matrix(**layout_theme),
    layout.MonadTall(**layout_theme),
    layout.MonadWide(**layout_theme),
    layout.RatioTile(**layout_theme),
    layout.Tile(**layout_theme),
    layout.TreeTab(**layout_theme),
    layout.VerticalTile(**layout_theme),
    layout.Zoomy(**layout_theme),
]

widget_defaults = dict(
    font="TerminessTTF NerdFont",
    fontsize=15,
    padding=8,
)
extension_defaults = widget_defaults.copy()

decoration_group = {
    "decorations": [
        RectDecoration(colour="#373B41", radius=12, filled=True, padding_y=1, group=True),
    ],
    "padding": 15,
}

screens = [
    Screen(
        top=bar.Bar(
            [
                widget.Image(
                    filename='/home/kim/.baggrunde/arch.png',
                ),
                widget.Spacer(
                    length=30
                ),
                widget.GroupBox(
                    active='#cccccc',
                    inactive='#dddddd',
                    background="#282A2E",
                    highlight_method='line',
                    block_highlight_text_color="#c5c8c6",
                    highlight_color="2D3D4C",
                    padding=6,
                    margin_x=10,
                    decorations=[
                        RectDecoration(
                            colour="#373B41",
                            radius=12,
                            filled=True,
                            padding_y=1,
                            group=True),
                        ],
                ),
                widget.Spacer(
                    length=50
                ),
                widget.Prompt(),
                widget.WindowName(),
                widget.Chord(
                    chords_colors={
                        "launch": (ColorZ, ColorI),
                    },
                    name_transform=lambda name: name.upper(),
                ),
                widget.Mpd2(
                    foreground='#c5c8c6',
                    background="282A2E",
                    idle_message='\uF001',
                    **decoration_group
                ),
                widget.Spacer(
                    length=25
                ),
                
                widget.Battery(
                    battery=0,
                    discharge_char='\uf241',
                    charge_char='\uf1E6',
                    format='{char} {percent: 2.0%}',
                    foreground='#c5c8c6',
                    background="#282A2E",
                    update_interval=30,
                    **decoration_group
                ),
                widget.Net(
                    interface='wlp2s0',
                    foreground='#c5c8c6',
                    background="2D3D4C",
                    **decoration_group
                ),
                widget.Spacer(
                    length=25
                ),
                widget.Clock(
                    format=" \uF073  %a %H:%M %p",
                    foreground='#c5c8c6',
                    **decoration_group
                ),
                widget.OpenWeather(
                    location='Vordingborg,Denmark',
                    format=' {main_temp}°{units_temperature} ',
                    font="weather icons",
                    foreground='#c5c8c6',
                    **decoration_group
                ),
                widget.Spacer(
                    length=25
                ),
                widget.QuickExit(
                    default_text='\uF706',
                    foreground=ColorE,
                ),
                widget.Spacer(
                    length=25
                ),
                widget.Volume(
                    emoji=True,
                    foreground=ColorE,
                ),
            ],
            background="#282A2E",
            foreground="#ffffff",
            foreground_inactive="#ffffff",
            margin=0,
            padding=10,
            border_width=4,
            border_color="#282A2E",
            opacity=1,
            size=28,
            # border_width=[2, 0, 2, 0],  # Draw top and bott#m borders
            # border_color=["2e3440", "2e3440", "2e3440", "2e#440"]  # Borders are magenta
        ),
    ),
]


# Drag floating layouts.
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(), start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(), start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front()),
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: list
follow_mouse_focus = True
bring_front_click = False
floats_kept_above = True
cursor_warp = False
floating_layout = layout.Floating(
    float_rules=[
        # Run the utility of `xprop` to see the wm class and name of an X client.
        *layout.Floating.default_float_rules,
        Match(wm_class="confirmreset"),  # gitk
        Match(wm_class="makebranch"),  # gitk
        Match(wm_class="maketag"),  # gitk
        Match(wm_class="ssh-askpass"),  # ssh-askpass
        Match(title="branchdialog"),  # gitk
        Match(title="pinentry"),  # GPG key password entry
    ]
)
auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True

# If things like steam games want to auto-minimize themselves when losing
# focus, should we respect this or not?
auto_minimize = True

# When using the Wayland backend, this can be used to configure input devices.
wl_input_rules = None

# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "LG3D"

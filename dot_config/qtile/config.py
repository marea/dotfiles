import os
import subprocess

from libqtile import bar, hook, layout, widget
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.lazy import lazy
from libqtile.utils import guess_terminal
from xrcat import xrcat
from sticky import *

xrcat.updateResources()
mod = "mod4"
terminal = guess_terminal("ghostty")

fg = xrcat.getResource("*color9")
fg_alt = xrcat.getResource("*color10")
bg = xrcat.getResource("*background")

keys = [
    Key([mod], "d", lazy.spawn("dmenu-randr")),
    Key([mod], "space", lazy.next_screen(), desc="Move focus to other screen"),
    Key([mod], "h", lazy.layout.left(), desc="Move focus to left"),
    Key([mod], "l", lazy.layout.right(), desc="Move focus to right"),
    Key([mod], "j", lazy.layout.down(), desc="Move focus down"),
    Key([mod], "k", lazy.layout.up(), desc="Move focus up"),
    Key(
        [mod, "shift"], "h", lazy.layout.shuffle_left(), desc="Move window to the left"
    ),
    Key(
        [mod, "shift"],
        "l",
        lazy.layout.shuffle_right(),
        desc="Move window to the right",
    ),
    Key([mod, "shift"], "j", lazy.layout.shuffle_down(), desc="Move window down"),
    Key([mod, "shift"], "k", lazy.layout.shuffle_up(), desc="Move window up"),
    Key([mod, "control"], "h", lazy.layout.grow_left(), desc="Grow window to the left"),
    Key(
        [mod, "control"], "l", lazy.layout.grow_right(), desc="Grow window to the right"
    ),
    Key([mod, "control"], "j", lazy.layout.grow_down(), desc="Grow window down"),
    Key([mod, "control"], "k", lazy.layout.grow_up(), desc="Grow window up"),
    Key([mod], "n", lazy.layout.normalize(), desc="Reset all window sizes"),
    Key(
        [mod, "shift"],
        "Return",
        lazy.layout.toggle_split(),
        desc="Toggle between split and unsplit sides of stack",
    ),
    Key([mod], "Return", lazy.spawn(terminal), desc="Launch terminal"),
    Key([mod], "Tab", lazy.next_layout(), desc="Toggle between layouts"),
    Key([mod, "shift"], "q", lazy.window.kill(), desc="Kill focused window"),
    Key(
        [mod],
        "f",
        lazy.window.toggle_fullscreen(),
        desc="Toggle fullscreen on the focused window",
    ),
    Key(
        [mod],
        "t",
        lazy.window.toggle_floating(),
        desc="Toggle floating on the focused window",
    ),
    Key([mod], "s", lazy.window.static()),
    Key([mod, "control"], "r", lazy.reload_config(), desc="Reload the config"),
    Key([mod, "control"], "q", lazy.shutdown(), desc="Shutdown Qtile"),
    Key(
        [mod],
        "r",
        lazy.spawn("rofi -show run"),
        desc="Spawn a command using a prompt widget",
    ),
    Key([mod, "shift"], "s", toggle_sticky_windows()),
]

groups = []
keynames = [i for i in "123456789"]
group_labels = ["󰖟", "", "", "", "5", "󰭹", "7", "8", ""]
for g in range(len(group_labels)):
    groups.append(Group(name=keynames[g], label=group_labels[g]))

for i in groups:
    keys.extend(
        [
            Key(
                [mod],
                i.name,
                lazy.group[i.name].toscreen(),
                desc=f"Switch to group {i.name}",
            ),
            Key(
                [mod, "shift"],
                i.name,
                lazy.window.togroup(i.name),
                desc="move focused window to group {}".format(i.name),
            ),
        ]
    )

layouts = [
    layout.Columns(
        border_focus=fg,
        border_normal=bg,
        border_focus_stack=["#d75f5f", "#8f3d3d"],
        border_width=4,
        margin=5,
        margin_on_single=0,
        initial_ratio=2.5,
    ),
    layout.Max(),
]

widget_defaults = dict(
    font="JetBrainsMono Nerd Font Propo",
    fontsize=12,
    padding=3,
)
extension_defaults = widget_defaults.copy()


widgetbox_settings = {
    "close_button_location": "right",
    "text_closed": "",
    "text_open": "",
}

groupbox_settings = {
    "highlight_method": "line",
    "hide_unused": True,
    "highlight_color": ["00000000"],
    "inactive": fg_alt,
    "other_current_screen_border": bg,
    "other_screen_border": bg,
    "this_current_screen_border": fg,
    "this_screen_border": fg,
}

bars_common_left = [
    widget.Prompt(),
    widget.Sep(padding=10),
]

bars_common_right = [
    widget.CPU(format=" {load_percent}%"),
    widget.CPUGraph(
        border_color=fg,
        fill_color=fg,
        graph_color=fg,
        width=50,
    ),
    widget.Memory(format=" {MemPercent}%"),
    widget.MemoryGraph(
        border_color=fg,
        fill_color=fg,
        graph_color=fg,
        width=50,
    ),
]

screens = [
    Screen(
        bottom=bar.Bar(
            [widget.GroupBox(**groupbox_settings)]
            + bars_common_left
            + [widget.WindowName(), widget.Systray()]
            + [widget.WidgetBox(**widgetbox_settings, widgets=bars_common_right.copy())]
            + [
                widget.Sep(
                    padding=10,
                ),
                widget.Clock(format="%m-%d %H:%M"),
            ],
            24,
            background="#00000000",
        ),
    ),
    Screen(
        bottom=bar.Bar(
            [widget.GroupBox(**groupbox_settings)]
            + bars_common_left
            + [widget.WindowName()]
            + [widget.WidgetBox(**widgetbox_settings, widgets=bars_common_right)]
            + [
                widget.Sep(
                    padding=10,
                ),
                widget.Clock(format="%m-%d %H:%M"),
            ],
            24,
            background="#00000000",
        )
    ),
]

mouse = [
    Drag(
        [mod],
        "Button1",
        lazy.window.set_position_floating(),
        start=lazy.window.get_position(),
    ),
    Drag(
        [mod], "Button3", lazy.window.set_size_floating(), start=lazy.window.get_size()
    ),
    Click([mod], "Button2", lazy.window.bring_to_front()),
]

dgroups_key_binder = None
dgroups_app_rules = []
follow_mouse_focus = True
bring_front_click = False
floats_kept_above = True
cursor_warp = False
floating_layout = layout.Floating(
    float_rules=[
        *layout.Floating.default_float_rules,
        Match(wm_class="confirmreset"),
        Match(wm_class="makebranch"),
        Match(wm_class="maketag"),
        Match(wm_class="ssh-askpass"),
        Match(title="branchdialog"),
        Match(title="pinentry"),
    ]
)
auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True
auto_minimize = True
wl_xcursor_theme = None
wl_xcursor_size = 24
wmname = "LG3D"


@hook.subscribe.startup_once
def atuostart():
    home = os.path.expanduser("~/.config/qtile/autostart.sh")
    subprocess.call(home)

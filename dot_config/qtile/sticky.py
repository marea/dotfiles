# Adds sticky windows to qtile
# A modified version of https://www.reddit.com/r/qtile/comments/ynxnvd/how_to_make_sticky_window/

from libqtile import qtile
from libqtile import hook
from libqtile.lazy import lazy

sticky_windows = []


@lazy.function
def toggle_sticky_windows(qtile, window=None):
    group = qtile.current_screen.group
    if window is None:
        window = group.current_window
    if window:
        if window in sticky_windows:
            sticky_windows.remove(window)
        else:
            sticky_windows.append(window)
        group.focus(group.current_window)  # update window name in WinName widget
    return window


@hook.subscribe.setgroup
def move_sticky_windows():
    group = qtile.current_screen.group
    focused = group.current_window
    prev_group = qtile.current_screen.previous_group
    prev_focused = prev_group and prev_group.current_window
    for window in sticky_windows:
        window.togroup()
        if window == prev_focused:
            focused = prev_focused
    group.focus(focused)
    if focused in sticky_windows and focused.floating:
        focused.bring_to_front()


@hook.subscribe.client_killed
def remove_sticky_windows(window):
    if window in sticky_windows:
        sticky_windows.remove(window)


def is_sticky_window(window):
    return window in sticky_windows


# Below is an example how to make Firefox Picture-in-Picture windows automatically sticky.
# I have a German Firefox and don't know if the 'name' is 'Picture-in-Picture'.
# You can check yourself with `xprop` and then lookup at the line `wm_name`.
# @hook.subscribe.client_managed
# def auto_sticky_windows(window):
#    info = window.info()
#    if (info['wm_class'] == ['Toolkit', 'firefox']
#            and info['name'] == 'Picture-in-Picture'):
#        sticky_windows.append(window)

#!/usr/bin/env python3
import i3ipc

i3 = i3ipc.Connection()
toggle = [True]

def on_window_new(i3, event):
    if toggle[0]:
        i3.command("split vertical")
    else:
        i3.command("split horizontal")
    toggle[0] = not toggle[0]

i3.on("window::new", on_window_new)
i3.main()

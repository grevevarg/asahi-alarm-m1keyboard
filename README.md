# Overview

This is a 1:1 mapping for the Swedish keyboard of an M1 Macbook Pro, provided as a custom xkb keymap.

Either clone it fully or use it as reference when adapting for your own language.

If you know how to write proper XKB stuff, feel free to send it upstream to [xkeyboard-config on freedesktop](https://gitlab.freedesktop.org/xkeyboard-config/xkeyboard-config) so it can get included by default in most distros.

# How to use

The instructions here are specifically for hyprland and assumes that you're running Omarchy.

## Swedish
If you simply want the swedish keymap, compare the contents of `hyprinput.conf` with `.config/hypr/input.conf`

Change or add relevant settings. If you skip lv3:ralt_switch you won't be able to access level 3 and 4 of the keymap. This is bad as it means you'll get locked out of a lot of symbols.

## Other languages
Copy keymap into a separate file and edit the keys for your language. Due to how xkb works you need to either use the name or unicode for characters.

A full list of names and which symbols they map to can be found [in the official keysymdef.h header](https://cgit.freedesktop.org/xorg/proto/x11proto/plain/keysymdef.h) or this [more readable table](https://wiki.linuxquestions.org/wiki/List_of_keysyms).

Make sure to run `xkbcomp -w 0 YOURFILE` to make sure it compiles.

If it compiles, move it to `/usr/share/X11/xkb/symbols/YOURFILE`, this requires sudo btw.

After that, edit your `.config/hypr/input.conf` to use your custom keymap. Use the following codeblock as refrence.
```
input {
  kb_layout = YOURFILE #not the full path, just name of the file is fine
  kb_variant = basic
  kb_options = lv3:ralt_switch
}

```

In case you skipped the previous section, enabling lv3:ralt_switch configures your right alt key to be altgr and to access level 3 of the keymap. You need this for access to both level 3 and level 4 keycodes (of which there are a lot).
Skipping it will practically make the keymap useless, you've been warned.

# Contributing
If people start sending their own configurations here, I can probably refactor and extend the functionality of scripts to accomodate automatic configuration. 

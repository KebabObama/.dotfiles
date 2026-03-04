{
  wayland.windowManager.hyprland.settings.exec-once = [
    "dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
    "systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
    "wl-paste --type text --watch cliphist store"
    "hyprctl setcursor Vimix-cursors 32"
    "hyprctl dispatch exec '[workspace special silent] discord'"
  ];
}

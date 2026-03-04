{
  wayland.windowManager.hyprland.settings = {
    workspace = [
      "special:music        , on-created-empty:spotify"
      "special:communication, on-created-empty:discord"
      "special:communication, on-created-empty:legcord"
    ];

    windowrule = [
      "match:class ^jetbrains-studio$, no_dim on, opaque on "
      "match:class ^krita$, maximize on, no_dim on, opaque on"
      "match:class ^mpv$, maximize on, no_dim on, opaque on"
      "match:pin true, no_blur on, opaque on, opacity 1.0 override 1.0 override"
      "match:class ^(discord|legcord)$, workspace special:communication silent, render_unfocused on"
      "match:class ^(spotify|ncspot)$, workspace special:music silent"
    ];
  };
}

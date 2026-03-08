{
  wayland.windowManager.hyprland.settings = {
    workspace = [
      "special:music        , on-created-empty:spotify"
      "special:communication, on-created-empty:discord"
      "special:communication, on-created-empty:legcord"
    ];

    windowrule = [
      "match:class ^file-picker$, float on, size 960 540, center on, pin on, no_blur on, match:pin true, opaque on, opacity 1.0 override 1.0 override"
      "match:class ^jetbrains-studio$, no_dim on, opaque on "
      "match:class ^krita$, maximize on, no_dim on, opaque on"
      "match:class ^mpv$, maximize on, no_dim on, opaque on"
      "match:class ^steam$, no_dim on, opaque on"
      "match:class ^(discord|legcord)$, workspace special:communication silent, render_unfocused on"
      "match:class ^(spotify|ncspot)$, workspace special:music silent"
      "match:pin true, opaque on, opacity 1.0 override 1.0 override"
    ];
  };
}

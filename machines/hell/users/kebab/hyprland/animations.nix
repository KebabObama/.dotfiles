{
  wayland.windowManager.hyprland.settings = {
    animations = {
      enabled = true;
      workspace_wraparound = true;
      bezier = [
        "smoothOut, 0.25, 0.9, 0.25, 1.0"
        "fastOut,   0.3, 1.0, 0.6, 1.0"
        "softFade,  0.0, 0.4, 0.6, 1.0"
      ];

      animation = [
        "windowsIn,   1, 5, smoothOut, slide"
        "windowsOut,  1, 4, fastOut,   slide"
        "windowsMove, 1, 3, smoothOut"
        "workspaces,  1, 5, smoothOut, slidefade 20%"

        "fadeIn,      1, 3, softFade"
        "fadeOut,     1, 3, softFade"
        "fadeSwitch,  1, 2, softFade"
        "fadeShadow,  1, 6, softFade"
        "fadeDim,     1, 4, smoothOut"
      ];
    };
  };
}

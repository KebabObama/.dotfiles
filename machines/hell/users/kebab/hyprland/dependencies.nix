{pkgs, ...}: {
  home.packages = with pkgs; [
    cliphist
    wl-clipboard
    fuzzel
    jq
  ];
  wayland.windowManager.hyprland = {
    enable = true;
    package = null;
    portalPackage = null;
    plugins = [];
    systemd.enable = true;
    systemd.variables = ["--all"];
    extraConfig = "monitor=,preferred,auto,1";
    settings.xwayland.force_zero_scaling = true;
  };
}

{pkgs, ...}: {
  imports = [
    ./animations.nix
    ./binds.nix
    ./config.nix
    ./inputs.nix
    ./rules.nix
    ./start-up.nix
  ];

  home.packages = with pkgs; [
    cliphist
    wl-clipboard
    fuzzel
    jq
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    package = null;
    plugins = [];
    systemd.enable = true;
    systemd.variables = ["--all"];
    systemd.enableXdgAutostart = true;
    extraConfig = "monitor=,preferred,auto,1";
    settings.xwayland.force_zero_scaling = true;
  };
}

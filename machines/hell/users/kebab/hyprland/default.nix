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
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    package = null;
    plugins = [];
    extraConfig = ''
      monitor = eDP-1, 2240x1260@144, auto, 1
      monitor =      , preferred    , auto, 1, mirror, DP-1
    '';
    settings.xwayland.force_zero_scaling = true;
    xwayland.enable = true;
    systemd = {
      enable = true;
      variables = ["--all"];
      enableXdgAutostart = true;
    };
  };
}

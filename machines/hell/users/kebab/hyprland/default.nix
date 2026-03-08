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
    extraConfig = "monitor=,preferred,auto,1";
    settings.xwayland.force_zero_scaling = true;
    xwayland.enable = true;
    systemd = {
      enable = true;
      variables = ["--all"];
      enableXdgAutostart = true;
    };
  };
}

{pkgs, ...}: {
  preferSingleUser = true;
  boot.tmp.useTmpfs = true;

  services = {
    scx.enable = true;
    scx.scheduler = "scx_rustland";
    sunshine = {
      enable = false;
      autoStart = false;
      openFirewall = true;
    };
  };

  programs = {
    nano.enable = false;
    anime-game-launcher.enable = true;
    gpu-screen-recorder.enable = true;

    gamemode = {
      enable = true;
      enableRenice = true;
    };

    hyprland = {
      enable = true;
      withUWSM = false;
      xwayland.enable = true;
      package = pkgs.hyprland;
    };

    steam = {
      enable = true;
      gamescopeSession.enable = true;
      platformOptimizations.enable = true;
      extraCompatPackages = [pkgs.proton-ge-bin];
    };

    gamescope = {
      enable = true;
      capSysNice = true;
    };
  };
}

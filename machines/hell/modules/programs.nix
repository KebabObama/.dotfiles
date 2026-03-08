{pkgs, ...}: {
  preferSingleUser = true;
  programs = {
    nano.enable = false;
    anime-game-launcher.enable = true;
    gpu-screen-recorder.enable = true;

    gamemode = {
      enable = true;
      enableRenice = false;
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

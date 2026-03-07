{pkgs, ...}: let
  legendary = pkgs.symlinkJoin {
    name = "legendary";
    paths = [pkgs.legendary-gl];
    nativeBuildInputs = [pkgs.makeWrapper];
    postBuild = ''
      wrapProgram $out/bin/legendary \
        --prefix PATH : ${pkgs.lib.makeBinPath [
        pkgs.wine64
        pkgs.legendary-gl
      ]}
    '';
  };
in {
  services.displayManager.defaultSession = "hyprland-uwsm";
  environment.systemPackages = [legendary];
  programs = {
    nano.enable = false;
    anime-game-launcher.enable = true;
    gpu-screen-recorder.enable = true;
    uwsm.enable = true;

    gamemode = {
      enable = true;
      enableRenice = false;
    };

    hyprland = {
      enable = true;
      xwayland.enable = true;
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

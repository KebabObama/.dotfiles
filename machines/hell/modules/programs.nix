{pkgs, ...}: let
  legendary = pkgs.symlinkJoin {
    name = "legendary";
    paths = [pkgs.legendary-gl];
    nativeBuildInputs = [pkgs.makeWrapper]; #
    postBuild = ''
      wrapProgram $out/bin/legendary \
        --prefix PATH : ${pkgs.lib.makeBinPath [
        pkgs.wine64
        pkgs.legendary-gl
      ]}
    '';
  };
in {
  environment.systemPackages = [legendary];

  services.scx.enable = true;
  services.scx.scheduler = "scx_rustland";

  programs = {
    nano.enable = false;
    git.config.url."https://github.com/KebabObama/".insteadOf = ["me:"];

    anime-game-launcher.enable = true;
    gpu-screen-recorder.enable = true;

    gamemode = {
      enable = true;
      enableRenice = false;
      settings = {};
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

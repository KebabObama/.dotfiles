{
  pkgs,
  lib,
  inputs,
  ...
}: {
  home.packages = [
    # inputs.viu.packages.${pkgs.system}.default
    (pkgs.symlinkJoin {
      name = "ani-cli-wrapped";
      paths = [pkgs.ani-cli];
      nativeBuildInputs = [pkgs.makeWrapper];
      postBuild = ''
        wrapProgram $out/bin/ani-cli \
          --prefix PATH : ${lib.makeBinPath [pkgs.ani-skip]}
      '';
    })
  ];

  programs.mpv = {
    enable = true;

    scripts = with pkgs.mpvScripts; [
      modernz
      mpris
    ];

    bindings = {
      "l" = "seek 5";
      "h" = "seek -5";
      "RIGHT" = "seek 5";
      "LEFT" = "seek -5";

      "k" = "add volume 2";
      "j" = "add volume -2";
      "UP" = "add volume 2";
      "DOWN" = "add volume -2";

      "ENTER" = "cycle pause";
      "SPACE" = "cycle pause";
      "MBTN_LEFT" = "cycle pause";
      "MBTN_RIGHT" = "script-binding context_menu/open";
      "f" = "cycle fullscreen";
      "q" = "quit";
      "Q" = "quit";
    };

    config = {
      input-default-bindings = "no";
      save-watch-history = "yes";
      write-filename-in-watch-later-config = "yes";
      save-position-on-quit = "yes";
      watch-later-options = "write-filename-proxy";
      ignore-path-in-watch-later-config = "yes";
      watch-later-directory = "~/.cache/mpv/watch_later";
      autofit-larger = "100%x100%";
      keepaspect-window = "yes";
      geometry = "0:0";
      hwdec = "auto";
      osc = "no";
      osd-bar = "no";
      osd-on-seek = "no";
      border = "no";
      input-vo-keyboard = "yes";
    };
  };
}

{pkgs, ...}: {
  home.packages = [pkgs.spotify];
  programs.ncspot = {
    enable = false;
    package = pkgs.ncspot.override {withPulseAudio = true;};
    settings = {
      backend = "pulseaudio";
      audio_cache = true;
      audio_cache_size = 1024;
      shuffle = true;
      gapless = true;
      repeat = "playlist";
      bitrate = 320;
      volnorm = true;
      volnorm_pregain = 0.0;
      use_nerdfont = true;
      album_column = true;
      hide_display_names = true;
      keybindings = {
        "k" = "move up";
        "j" = "move down";
        "h" = "move left";
        "l" = "move right";
        "g" = "move top";
        "G" = "move bottom";

        " " = "playpause";
        "n" = "next";
        "p" = "previous";
        "+" = "volup";
        "-" = "voldown";
        "r" = "repeat";
        "s" = "shuffle";

        "/" = "search";
        "q" = "quit";
        "?" = "help";
      };
    };
  };
}

{
  programs.caelestia.settings.cli = {
    enable = true;
    settings = {
      # toggles = {
      #   communication.discord = {
      #     enable = true;
      #     move = true;
      #     command = ["discord"];
      #     match = [{class = "discord";}];
      #   };
      #   music.spotify = {
      #     enable = true;
      #     move = true;
      #     command = ["spotify"];
      #     match = [{class = "spotify";}];
      #   };
      # };
      theme = {
        enableTerm = true;
        enableHypr = true;
        enableDiscord = true;
        enableSpicetify = true;
        enableFuzzel = true;
        enableBtop = true;
        enableGtk = true;
        enableQt = true;
      };
    };
  };
}

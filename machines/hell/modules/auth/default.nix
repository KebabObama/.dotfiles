{data, ...}: {
  services.logind.settings.Login.HandlePowerKey = "ignore";
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        restart = true;
        command = "start-hyprland";
        user = data.primaryUser;
      };
    };
  };
}

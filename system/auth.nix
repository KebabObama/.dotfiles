{
  data,
  lib,
  pkgs,
  config,
  ...
}: {
  environment.systemPackages = with pkgs; [
    (where-is-my-sddm-theme.override {
      themeConfig.General = {
        background = "/var/lib/sddm-wallpaper/wallpaper";
        backgroundMode = "fill";
        passwordFontSize = 24;
        hideCursor = false;
        passwordInputCursorVisible = true;
        passwordInputWidth = 0.25;
        passwordCursorColor = "#ffffffff";
        passwordAllowEmpty = false;
        showSessionsByDefault = true;
        showUsersByDefault = true;
        passwordInputBackground = "#a0000000";
        passwordInputBorderWidth = 2;
        passwordInputBorderColor = "#ff000000";
        passwordInputRadius = 32;
        wrongPasswordBorderColor = "#ffeb6f92";
        backgroundFill = "#ff000000";
        basicTextColor = "#ffffffff";
        passwordCharacter = "*";
        blurRadius = 2;
      };
    })
  ];

  services.displayManager = {
    sddm = {
      enable = lib.mkForce true;
      autoNumlock = lib.mkDefault true;
      wayland.enable = lib.mkDefault true;
      wayland.compositor = lib.mkDefault "kwin";
      theme = lib.mkDefault "where_is_my_sddm_theme";
    };

    autoLogin = {
      enable = config.preferSingleUser;
      user = lib.mkDefault data.primaryUser;
    };
  };

  specialisation = lib.mkIf config.preferSingleUser {
    multi-user.configuration.services.displayManager.autoLogin.enable = lib.mkForce false;
  };
}

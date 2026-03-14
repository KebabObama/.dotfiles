{
  lib,
  pkgs,
  config,
  ...
}: {
  systemd.tmpfiles.rules = [
    "d /var/lib/sddm-wallpaper 0755 ${config.users.primaryUser} users -"
  ];

  environment.systemPackages = with pkgs; [
    vimix-cursors
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
        passwordInputBackground = "#c0000000";
        passwordInputBorderWidth = 2;
        passwordInputBorderColor = "#ff000000";
        passwordInputRadius = 32;
        wrongPasswordBorderColor = "#ffeb6f92";
        backgroundFill = "#ff000000";
        basicTextColor = "#ffffffff";
        passwordCharacter = "*";
        blurRadius = 0;
      };
    })
  ];

  services.displayManager = {
    sddm = {
      enable = lib.mkForce true;
      autoNumlock = lib.mkDefault true;
      wayland.enable = lib.mkDefault true;
      wayland.compositor = lib.mkDefault "kwin";
      theme = "where_is_my_sddm_theme";
      extraPackages = [pkgs.kdePackages.qt5compat];
      settings = {
        Theme = {
          CursorTheme = "Vimix-cursors";
          CursorSize = 32;
        };
      };
    };

    autoLogin = {
      enable = lib.mkDefault config.preferSingleUser;
      user = lib.mkDefault config.users.primaryUser;
    };
  };

  specialisation = lib.mkIf config.preferSingleUser {
    multi-user.configuration.services.displayManager.autoLogin.enable = false;
  };
}

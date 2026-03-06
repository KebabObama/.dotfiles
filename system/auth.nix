{
  data,
  lib,
  preferSingleUser,
  pkgs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    (where-is-my-sddm-theme.override {
      themeConfig = {
        General = {
          background = toString ../wallpapers/caelestia.png;
          backgroundMode = "fill";
          FontSize = 18;
        };
        Colors = {
          text = "#ffffff";
          accent = "#cccccc";
          background = "#000000";
        };
      };
    })
  ];

  services.displayManager = {
    sddm = {
      enable = true;
      autoNumlock = true;
      wayland.enable = true;
      wayland.compositor = "kwin";
      theme = "where_is_my_sddm_theme";
      settings = {
        Users = {
          RememberLastUser = true;
        };
      };
    };

    autoLogin = {
      enable = preferSingleUser;
      user = data.primaryUser;
    };
  };

  specialisation = lib.mkIf preferSingleUser {
    multi-user.configuration = {
      services.displayManager.autoLogin.enable = lib.mkForce false;
    };
  };
}

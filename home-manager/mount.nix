{pkgs, ...}: let
  patchedIcons = pkgs.runCommand "patched-icon-theme" {} ''
    mkdir -p $out/share/icons/hicolor;
    ln -s ${pkgs.papirus-icon-theme}/share/icons/Papirus/* $out/share/icons/hicolor/;
  '';
in {
  home.packages = [patchedIcons];
  services.udiskie = {
    enable = true;
    tray = "always";
    automount = true;
    settings = {
      notifications = {
        device_added = false;
      };

      program_options = {
        appindicator = true;
        file_manager = "xdg-open";
        menu_items = [
          "browse"
          "mount"
          "unmount"
          "unlock"
          "lock"
          "eject"
          "detach"
        ];
      };
    };
  };
}

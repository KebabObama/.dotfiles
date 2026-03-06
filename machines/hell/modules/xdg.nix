{pkgs, ...}: {
  preferSingleUser = true;
  xdg.portal = {
    enable = true;
    config = {
      common.default = ["gtk"];
      common."org.freedesktop.impl.portal.FileChooser" = ["termfilechooser"];
      hyprland.default = ["gtk" "hyprland"];
      hyprland."org.freedesktop.impl.portal.FileChooser" = ["termfilechooser"];
    };
    xdgOpenUsePortal = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-termfilechooser
      xdg-desktop-portal-hyprland
      xdg-desktop-portal-gtk
    ];
  };
}

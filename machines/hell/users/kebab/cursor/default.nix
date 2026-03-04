{
  pkgs,
  config,
  ...
}: {
  home.pointerCursor = {
    gtk.enable = true;
    x11.enable = true;
    x11.defaultCursor = "left_ptr";
    package = pkgs.vimix-cursors;
    name = "Vimix-cursors";
    size = 32;
  };
  gtk = {
    enable = true;
    # gtk2.configLocation = "${config.xdg.configHome}/gtk-2.0/gtkrc";
    cursorTheme = {
      package = pkgs.vimix-cursors;
      name = "Vimix-cursors";
      size = 32;
    };
  };
}

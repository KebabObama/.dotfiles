{pkgs, ...}: {
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
    cursorTheme = {
      package = pkgs.vimix-cursors;
      name = "Vimix-cursors";
      size = 32;
    };
  };
}

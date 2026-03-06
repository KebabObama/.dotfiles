{pkgs, ...}: let
  text = [
    "vim.desktop"
    "code.desktop"
  ];
in {
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

  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "inode/directory" = ["yazi"];
      "text/*" = text;
      "text/plain" = text;
      "application/json" = text;
      "application/xml" = text;
      "application/x-shellscript" = text;
      "text/markdown" = text;
      "text/x-csrc" = text;
      "text/x-c++src" = text;
      "text/x-python" = text;
      "text/x-rust" = text;
      "text/x-tcl" = text;
      "text/x-tex" = text;
      "text/x-nix" = text;
      "application/x-yaml" = text;
      "application/pdf" = text;
    };
  };
}

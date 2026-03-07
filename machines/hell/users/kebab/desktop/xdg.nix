{pkgs, ...}: {
  xdg = {
    enable = true;
    terminal-exec.enable = true;

    portal = {
      enable = true;
      config.hyprland.default = ["gtk" "hyprland"];
      config.hyprland."org.freedesktop.impl.portal.FileChooser" = ["termfilechooser"];
      xdgOpenUsePortal = true;
      extraPortals = with pkgs; [
        xdg-desktop-portal-termfilechooser
        xdg-desktop-portal-hyprland
        xdg-desktop-portal-gtk
      ];
    };

    mimeApps = {
      enable = true;
      defaultApplications = {
        "inode/directory" = ["superfile.desktop"];
        "text/*" = ["vim.desktop" "code.desktop"];
        "text/plain" = ["vim.desktop" "code.desktop"];
        "application/json" = ["vim.desktop" "code.desktop"];
        "application/xml" = ["vim.desktop" "code.desktop"];
        "application/x-shellscript" = ["vim.desktop" "code.desktop"];
        "text/markdown" = ["vim.desktop" "code.desktop"];
        "text/x-csrc" = ["vim.desktop" "code.desktop"];
        "text/x-c++src" = ["vim.desktop" "code.desktop"];
        "text/x-python" = ["vim.desktop" "code.desktop"];
        "text/x-rust" = ["vim.desktop" "code.desktop"];
        "text/x-tcl" = ["vim.desktop" "code.desktop"];
        "text/x-tex" = ["vim.desktop" "code.desktop"];
        "text/x-nix" = ["vim.desktop" "code.desktop"];
        "application/x-yaml" = ["vim.desktop" "code.desktop"];
        "application/pdf" = ["vim.desktop" "code.desktop"];
      };
    };
  };
}

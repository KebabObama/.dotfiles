let
  text = [
    "vim.desktop"
    "code.desktop"
  ];
in {
  xdg.desktopEntries.zen = {
    name = "Zen";
    genericName = "Web Browser";
    exec = "zen %u";
    terminal = false;
    settings.NoDisplay = "true";
    categories = [
      "Network"
      "WebBrowser"
    ];
    mimeType = [
      "image/*"
      "image/jpeg"
      "image/png"
      "image/gif"
      "image/webp"
      "text/html"
      "x-scheme-handler/http"
      "x-scheme-handler/https"
      "x-scheme-handler/about"
      "x-scheme-handler/unknown"
    ];
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

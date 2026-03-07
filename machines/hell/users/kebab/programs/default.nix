{
  pkgs,
  functions,
  ...
}: {
  home.packages =
    (functions.mkScriptPkgs pkgs ./scripts)
    ++ (with pkgs; [
      discord
      spotify
      rnnoise-plugin
      blender
      krita
      android-studio
      upscayl
      sqlit-tui
      tree
    ]);

  programs.btop = {
    enable = true;
    package = pkgs.btop-cuda;
    settings = {
      color_theme = "caelestia";
      theme_background = false;
      vim_keys = true;
      rounded_corners = true;
      terminal_sync = true;
      update_ms = 1000;
      graph_symbol = "braille";
      graph_symbol_cpu = "default";
      graph_symbol_mem = "default";
      graph_symbol_net = "default";
      graph_symbol_proc = "default";
      shown_boxes = "cpu mem net proc gpu0";
    };
  };
}
